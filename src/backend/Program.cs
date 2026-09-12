using Farutech.Platform.Application.Provisioning;
using Farutech.Platform.Infrastructure.Provisioning;

var builder = WebApplication.CreateBuilder(args);

// Inyección de servicios del Control Plane
builder.Services.AddSingleton<IProvisioningEngine, PostgresProvisioningEngine>();
builder.Services.AddEndpointsApiExplorer();

var app = builder.Build();

app.MapGet("/health", () => Results.Ok(new
{
    status = "healthy",
    component = "plt-core-platform-controlplane",
    runtime = ".NET 10",
    timestamp = DateTime.UtcNow
}));

// Endpoint de aprovisionamiento automatizado (Shared / Dedicated)
app.MapPost("/api/v1/provisioning/instances", async (ProvisionInstanceRequest request, IProvisioningEngine engine) =>
{
    var result = await engine.ProvisionAsync(request);
    return result.Success ? Results.Created($"/api/v1/instances/{result.InstanceId}", result) : Results.BadRequest(result);
});

// Endpoint de resolución dinámica de host para Ingress / HAProxy Gateway
app.MapGet("/api/v1/routing/resolve", async (string host, IProvisioningEngine engine) =>
{
    var instance = await engine.ResolveInstanceByHostAsync(host);
    if (instance == null)
    {
        return Results.NotFound(new { message = $"No se encontró instancia activa asociada al host: {host}" });
    }

    return Results.Ok(new
    {
        instanceId = instance.Id,
        organizationId = instance.OrganizationId,
        applicationKey = instance.ApplicationKey,
        isolationMode = instance.IsolationMode.ToString(),
        databaseSchema = instance.DatabaseSchema,
        status = instance.Status
    });
});

app.Run();
