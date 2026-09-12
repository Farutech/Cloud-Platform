namespace Farutech.Platform.Domain.Entities;

using Farutech.Platform.Domain.Enums;

public class Instance
{
    public Guid Id { get; set; } = Guid.NewGuid();
    public Guid OrganizationId { get; set; }
    public string ApplicationKey { get; set; } = string.Empty; // ej. "mkt-app-kronix", "prd-corp-website"
    public string SubdomainSlug { get; set; } = string.Empty;
    public string FullDomain { get; set; } = string.Empty;
    public IsolationMode IsolationMode { get; set; } = IsolationMode.Shared;
    
    // Configuración de persistencia generada por el Provisioning Engine
    public string DatabaseSchema { get; set; } = string.Empty; // ej. "org_abc123"
    public string DatabaseConnectionStringName { get; set; } = "PlatformSharedDb";
    
    public string Status { get; set; } = "Provisioning"; // Provisioning, Running, Suspended, Terminated
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    public DateTime? ReadyAt { get; set; }
    
    public Organization? Organization { get; set; }
}
