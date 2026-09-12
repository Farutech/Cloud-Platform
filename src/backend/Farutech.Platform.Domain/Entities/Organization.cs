namespace Farutech.Platform.Domain.Entities;

using Farutech.Platform.Domain.Enums;

public class Organization
{
    public Guid Id { get; set; } = Guid.NewGuid();
    public string Name { get; set; } = string.Empty;
    public string Slug { get; set; } = string.Empty;
    public string Plan { get; set; } = "standard"; // standard, pro, enterprise
    public IsolationMode DefaultIsolationMode { get; set; } = IsolationMode.Shared;
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    public bool IsActive { get; set; } = true;
    
    public ICollection<Instance> Instances { get; set; } = new List<Instance>();
}
