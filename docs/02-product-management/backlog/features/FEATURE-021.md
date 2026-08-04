# FEATURE-021 — Dynamic Database & Schema Provisioning

## Epic

EPIC-004 — Multi-Tenancy Core

## Objetivo

Implementar el motor de aprovisionamiento dinámico de bases de datos y schemas PostgreSQL según el modelo híbrido (Shared vs Dedicated), permitiendo la creación automática de infraestructura de datos al contratar una nueva instancia de aplicación.

## Descripción

Esta feature orquesta la creación física de recursos de base de datos basada en la configuración del tenant:

**Modo Shared:**
- Crea un schema dentro de una instancia PostgreSQL compartida.
- Nombre del schema: `org_{organization_id}`.
- Múltiples organizaciones comparten la misma instancia PostgreSQL pero con schemas aislados.

**Modo Dedicated:**
- Crea una instancia PostgreSQL completa dedicada (nuevo contenedor/servicio).
- Dentro de esa instancia, crea el schema de la organización.
- Asigna recursos exclusivos (CPU, RAM, almacenamiento) según el plan contratado.

El proceso es triggered por un evento `InstanceProvisioningRequested` y debe ser idempotente.

## Alcance

- [ ] Implementar servicio `IDatabaseProvisioner` con métodos `CreateSchemaAsync`, `CreateDatabaseInstanceAsync`.
- [ ] Crear scripts SQL parametrizados para creación de schemas y extensiones.
- [ ] Integrar con Docker API o Kubernetes API para creación de instancias dedicadas (según ADR de despliegue).
- [ ] Gestionar connection strings dinámicos y almacenarlos en secret manager.
- [ ] Implementar retry logic con exponential backoff para fallos de provisionamiento.
- [ ] Publicar eventos `InstanceProvisioned` o `InstanceProvisioningFailed`.

## Fuera de alcance

- Migraciones de esquema de aplicación (cubiertas en FEATURE-024).
- UI de selección de modo de despliegue (cubierta en EPIC-007).
- Billing asociado al uso de recursos dedicados (cubierta en EPIC-008).

## Dependencias

- FEATURE-020 (Tenant Context): Necesario para identificar org/instance durante el provisionamiento.
- ADR-011 (Multi-Tenancy Strategy): Define el modelo híbrido.
- ADR-003 (Event-Driven Architecture): Uso de eventos para orquestación.
- FEATURE-010 (Event Bus Core): Infraestructura de mensajería.

## Criterios de aceptación

### Scenario 1 — Provisionamiento Shared exitoso

**Given** una solicitud para crear instancia con `deployment_type=shared`
**When** se ejecuta el provisioner
**Then** se crea un schema `org_{id}` en la DB compartida y se retorna el connection string

### Scenario 2 — Provisionamiento Dedicated exitoso

**Given** una solicitud para crear instancia con `deployment_type=dedicated`
**When** se ejecuta el provisioner
**Then** se despliega un nuevo contenedor PostgreSQL, se crea el schema y se registran las credenciales en el vault

### Scenario 3 — Idempotencia

**Given** una solicitud de provisionamiento para una instancia ya existente
**When** se ejecuta el provisioner nuevamente
**Then** no se crean recursos duplicados y se retorna el estado actual sin errores

## Consideraciones técnicas

- **PostgreSQL**: Usar roles con privilegios limitados para creación de schemas.
- **Secrets**: Connection strings deben guardarse en HashiCorp Vault o Azure Key Vault.
- **Naming Convention**: Schemas: `org_{guid}`, DBs: `inst_{guid}`.
- **Cleanup**: Implementar lógica de eliminación (DROP SCHEMA/DATABASE) cuando se cancele una instancia.
- **Timeout**: Operaciones de creación de DB pueden tardar; usar mensajes asíncronos con timeout configurable.

## Referencias

- EPIC-004
- ADR-011 (Multi-Tenancy Strategy)
- ADR-003 (Event-Driven Architecture)
- FEATURE-020
