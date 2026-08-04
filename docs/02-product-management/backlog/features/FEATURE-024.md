# FEATURE-024 — Tenant-Aware Migration Strategy

## Epic

EPIC-004 — Multi-Tenancy Core

## Objetivo

Implementar una estrategia de migraciones de base de datos que permita ejecutar cambios de esquema (migraciones EF Core) de manera consciente del tenant, soportando tanto entornos shared (múltiples schemas en una DB) como dedicated (DBs independientes).

## Descripción

En un entorno multi-tenant híbrido, las migraciones no pueden ejecutarse con un comando simple `dotnet ef database update`. El sistema debe:

1. **Shared Mode**: Iterar sobre todos los schemas de organizaciones y aplicar la migración en cada uno secuencialmente o en paralelo controlado.
2. **Dedicated Mode**: Conectar a cada instancia de base de datos dedicada y aplicar migraciones individualmente.
3. **Control de Versiones**: Registrar qué versión de esquema tiene cada tenant para permitir rollbacks selectivos y detectar drift.

Esta feature incluye herramientas CLI y servicios automatizados para gestión del ciclo de vida del esquema.

## Alcance

- [ ] Crear servicio `ITenantMigrationRunner` con métodos `MigrateAllTenantsAsync`, `MigrateTenantAsync`.
- [ ] Implementar lógica de iteración sobre schemas (shared) y connection strings (dedicated).
- [ ] Crear tabla de control `__TenantMigrationsHistory` independiente por schema/DB.
- [ ] Proveer comandos CLI: `migrate --all`, `migrate --tenant {id}`, `rollback --tenant {id}`.
- [ ] Implementar notificación de progreso y reporte de fallos por tenant.

## Fuera de alcance

- Migraciones de datos (transformación de datos existentes) (se manejarán caso a caso).
- Zero-downtime migrations avanzadas (blue-green schema) (fase posterior).
- Validación automática de compatibilidad hacia atrás (requiere procesos manuales de review).

## Dependencias

- FEATURE-021 (Dynamic Provisioning): Proporciona lista de tenants y connection strings.
- FEATURE-022 (Shared/Dedicated Logic): Diferencia el modo de ejecución.
- ADR-011 (Multi-Tenancy Strategy): Define la necesidad de aislamiento de esquemas.

## Criterios de aceptación

### Scenario 1 — Migración en entorno Shared

**Given** 50 schemas de organizaciones en una instancia PostgreSQL compartida
**When** se ejecuta `MigrateAllTenantsAsync` para una nueva migración
**Then** la migración se aplica exitosamente a los 50 schemas y se registra en cada `__TenantMigrationsHistory`

### Scenario 2 — Migración parcial con fallo

**Given** 100 tenants, uno con schema corrupto
**When** se ejecuta la migración masiva
**Then** 99 tenants se migran exitosamente, el fallido se reporta en logs y no bloquea el proceso completo

### Scenario 3 — Rollback selectivo

**Given** un tenant específico con problemas tras una migración
**When** se ejecuta `rollback --tenant {id} --step 1`
**Then** solo ese tenant revierte la última migración sin afectar a los demás

## Consideraciones técnicas

- **Paralelismo**: En shared mode, limitar concurrencia (max 5 schemas simultáneos) para no saturar la DB.
- **Timeouts**: Migraciones grandes pueden exceder timeouts default; configurar valores altos (5-10 min).
- **Idempotencia**: Las migraciones deben ser idempotentes; re-ejecutar no debe causar errores.
- **Backup**: Recomendar backup automático antes de migraciones masivas (integrar con FEATURE-021 cleanup).

## Referencias

- EPIC-004
- ADR-011 (Multi-Tenancy Strategy)
- FEATURE-021, FEATURE-022
- Engineering Standards (.NET Data Access + Migrations)
