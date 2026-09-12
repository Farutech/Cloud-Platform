namespace Farutech.Platform.Domain.Enums;

/// <summary>
/// Modelo de aislamiento de infraestructura conforme a ADR-003 y directrices PaaS FaruTech.
/// </summary>
public enum IsolationMode
{
    /// <summary>
    /// Infraestructura compartida con aislamiento lógico mediante esquemas PostgreSQL (org_{id}).
    /// Planes Estándar / Basic. Enrutamiento: {instanceId}.{organizationId}.farutech.app
    /// </summary>
    Shared = 1,

    /// <summary>
    /// Infraestructura dedicada: contenedor exclusivo, base de datos PostgreSQL aislada y worker reservado.
    /// Planes Enterprise. Soporte para dominio propio del cliente (app.cliente.com).
    /// </summary>
    Dedicated = 2
}
