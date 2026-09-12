namespace Farutech.Platform.Application.Provisioning;

using Farutech.Platform.Domain.Entities;
using Farutech.Platform.Domain.Enums;

public record ProvisionInstanceRequest(
    Guid OrganizationId,
    string OrganizationSlug,
    string ApplicationKey,
    string InstanceSubdomain,
    IsolationMode IsolationMode,
    string? CustomDomain = null
);

public record ProvisionInstanceResult(
    bool Success,
    Guid InstanceId,
    string AssignedDomain,
    string DatabaseSchemaOrDb,
    string Status,
    string? ErrorMessage = null
);

public interface IProvisioningEngine
{
    Task<ProvisionInstanceResult> ProvisionAsync(ProvisionInstanceRequest request, CancellationToken ct = default);
    Task<Instance?> ResolveInstanceByHostAsync(string host, CancellationToken ct = default);
}
