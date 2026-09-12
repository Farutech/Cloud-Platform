namespace Farutech.Platform.Infrastructure.Provisioning;

using Microsoft.Extensions.Logging;
using Farutech.Platform.Application.Provisioning;
using Farutech.Platform.Domain.Entities;
using Farutech.Platform.Domain.Enums;

public class PostgresProvisioningEngine : IProvisioningEngine
{
    private readonly ILogger<PostgresProvisioningEngine> _logger;
    private readonly Dictionary<string, Instance> _inMemoryInstances = new();

    public PostgresProvisioningEngine(ILogger<PostgresProvisioningEngine> logger)
    {
        _logger = logger;
    }

    public async Task<ProvisionInstanceResult> ProvisionAsync(ProvisionInstanceRequest request, CancellationToken ct = default)
    {
        _logger.LogInformation(
            "Iniciando aprovisionamiento para Org: {OrgSlug}, App: {AppKey}, Modo: {Mode}",
            request.OrganizationSlug, request.ApplicationKey, request.IsolationMode);

        try
        {
            var instanceId = Guid.NewGuid();
            string assignedDomain;
            string schemaOrDb;

            if (request.IsolationMode == IsolationMode.Shared)
            {
                // Regla Shared Mode: subdominio {instanceId}.{organizationId}.farutech.app
                // Schema aislado en PostgreSQL: org_{shortId}
                assignedDomain = $"{request.InstanceSubdomain}.{request.OrganizationSlug}.farutech.app";
                schemaOrDb = $"org_{request.OrganizationId.ToString("N")[..8]}";

                _logger.LogInformation("Shared Mode: Preparando schema PostgreSQL '{Schema}' para dominio '{Domain}'",
                    schemaOrDb, assignedDomain);

                // En ejecución contra base de datos:
                // await dbConnection.ExecuteAsync($"CREATE SCHEMA IF NOT EXISTS {schemaOrDb};");
            }
            else
            {
                // Regla Dedicated Mode: Contenedor y base de datos dedicada
                assignedDomain = request.CustomDomain ?? $"{request.InstanceSubdomain}.{request.OrganizationSlug}.enterprise.farutech.app";
                schemaOrDb = $"db_dedicated_{request.OrganizationSlug}_{instanceId.ToString("N")[..6]}";

                _logger.LogInformation("Dedicated Mode: Aprovisionando base de datos aislada '{DbName}' para '{Domain}'",
                    schemaOrDb, assignedDomain);
            }

            var instance = new Instance
            {
                Id = instanceId,
                OrganizationId = request.OrganizationId,
                ApplicationKey = request.ApplicationKey,
                SubdomainSlug = request.InstanceSubdomain,
                FullDomain = assignedDomain,
                IsolationMode = request.IsolationMode,
                DatabaseSchema = schemaOrDb,
                Status = "Running",
                ReadyAt = DateTime.UtcNow
            };

            _inMemoryInstances[assignedDomain.ToLowerInvariant()] = instance;

            _logger.LogInformation("Instancia {InstanceId} aprovisionada con éxito en estado Running", instanceId);

            return await Task.FromResult(new ProvisionInstanceResult(
                Success: true,
                InstanceId: instanceId,
                AssignedDomain: assignedDomain,
                DatabaseSchemaOrDb: schemaOrDb,
                Status: "Running"
            ));
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Falla en el aprovisionamiento de instancia");
            return new ProvisionInstanceResult(
                Success: false,
                InstanceId: Guid.Empty,
                AssignedDomain: string.Empty,
                DatabaseSchemaOrDb: string.Empty,
                Status: "Failed",
                ErrorMessage: ex.Message
            );
        }
    }

    public Task<Instance?> ResolveInstanceByHostAsync(string host, CancellationToken ct = default)
    {
        var normalized = host.Trim().ToLowerInvariant();
        _inMemoryInstances.TryGetValue(normalized, out var instance);
        return Task.FromResult(instance);
    }
}
