# FEATURE-022 — Shared vs Dedicated Infrastructure Logic

## Epic

EPIC-004 — Multi-Tenancy Core

## Objetivo

Implementar la lógica de negocio y configuración que permite al sistema operar en dos modos de despliegue (Shared y Dedicated), gestionando las diferencias de infraestructura de manera transparente para las capas superiores de la aplicación.

## Descripción

Esta feature abstrae la complejidad del modelo híbrido de multi-tenancy. El sistema debe:

1. **Identificar el modo** de cada tenant al momento de la solicitud (desde el contexto o configuración).
2. **Resolver connection strings** dinámicamente según el modo:
   - **Shared**: Usa un pool de connection strings a instancias compartidas, seleccionando por schema.
   - **Dedicated**: Usa un connection string único almacenado en vault para esa instancia específica.
3. **Aplicar políticas de recursos** diferenciadas (rate limiting, timeouts, tamaño de pool de conexiones).

La implementación debe ser transparente para los Use Cases: ellos solo piden datos, la infraestructura decide dónde buscarlos.

## Alcance

- [ ] Crear servicio `IConnectionStringResolver` que retorna el connection string correcto según tenant.
- [ ] Implementar fábrica de DbContexts (`ITenantDbContextFactory`) que configura EF Core dinámicamente.
- [ ] Configurar pools de conexiones diferenciados (mayor tamaño para shared, dedicado para dedicated).
- [ ] Implementar middleware de rate limiting configurado por tipo de deployment.
- [ ] Crear configuración por ambiente (appsettings) para definir umbrales de recursos shared.

## Fuera de alcance

- UI de selección del modo (cubierta en EPIC-007 Marketplace).
- Migración entre modos (shared → dedicated) (se considerará en fase posterior).
- Optimización automática de recursos (auto-scaling) (cubierta en EPIC-012).

## Dependencias

- FEATURE-020 (Tenant Context): Proporciona el deployment_type actual.
- FEATURE-021 (Dynamic Provisioning): Provee los connection strings almacenados.
- ADR-011 (Multi-Tenancy Strategy): Define el modelo operativo.

## Criterios de aceptación

### Scenario 1 — Resolución de connection string Shared

**Given** un tenant con `deployment_type=shared` y `org_id=123`
**When** la aplicación necesita acceder a la base de datos
**Then** se resuelve un connection string a la instancia compartida con `SearchPath=org_123`

### Scenario 2 — Resolución de connection string Dedicated

**Given** un tenant con `deployment_type=dedicated` y `instance_id=456`
**When** la aplicación necesita acceder a la base de datos
**Then** se recupera el connection string único desde el vault para esa instancia

### Scenario 3 — Aislamiento de configuración

**Given** dos tenants concurrentes (uno shared, uno dedicated)
**When** ambos realizan solicitudes simultáneas
**Then** cada uno usa su propia configuración de pool de conexiones y rate limits sin interferencia

## Consideraciones técnicas

- **EF Core**: Usar `DbContextOptionsBuilder` dinámico para configurar Connection String por request.
- **Vault Integration**: Para dedicated, cachear connection strings con TTL corto para evitar llamadas constantes al vault.
- **Performance**: En modo shared, pre-calentar pools de conexión para schemas frecuentes.
- **Configuración**: Los límites de rate limiting deben ser configurables por entorno (Dev/Staging/Prod).

## Referencias

- EPIC-004
- ADR-011 (Multi-Tenancy Strategy)
- FEATURE-020, FEATURE-021
