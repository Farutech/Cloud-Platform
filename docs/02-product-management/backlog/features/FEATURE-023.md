# FEATURE-023 — Global Query Filters for Data Isolation

## Epic

EPIC-004 — Multi-Tenancy Core

## Objetivo

Implementar filtros de consulta globales en Entity Framework Core que aseguren automáticamente el aislamiento de datos a nivel de tenant, previniendo fugas de información entre organizaciones sin requerir modificaciones manuales en cada consulta.

## Descripción

Esta feature es la última línea de defensa del multi-tenancy. Incluso si un desarrollador olvida filtrar por tenant en una consulta, EF Core inyectará automáticamente la condición `WHERE OrganizationId = @currentTenant` en todas las queries de entidades multi-tenant.

El sistema debe:
1. Identificar qué entidades son multi-tenant (vía interfaz marker `IMultiTenant`).
2. Aplicar global query filters en `OnModelCreating` dinámicamente según el `TenantContext` actual.
3. Permitir bypass explícito solo para operaciones administrativas globales (con auditoría estricta).

## Alcance

- [ ] Crear interfaz marker `IMultiTenant` con propiedad `Guid OrganizationId`.
- [ ] Implementar `IMultiTenantDbContext` que aplica filtros en `OnModelCreating`.
- [ ] Configurar filtros globales para todas las entidades que implementen `IMultiTenant`.
- [ ] Proveer método `.IgnoreMultiTenant()` para casos excepcionales (solo admin).
- [ ] Validar en tests de integración que consultas sin filtro explícito siguen aisladas.

## Fuera de alcance

- Aislamiento a nivel de base de datos física (cubierto en FEATURE-021/022).
- Encriptación de datos sensibles (cubierto en EPIC-015 Security).
- Auditoría de accesos (cubierta en FEATURE-019).

## Dependencias

- FEATURE-020 (Tenant Context): Proporciona el `OrganizationId` actual para el filtro.
- ADR-011 (Multi-Tenancy Strategy): Define requirement de aislamiento lógico.
- Engineering Standards (.NET + EF Core): Patrones de configuración de DbContext.

## Criterios de aceptación

### Scenario 1 — Filtro automático en consulta simple

**Given** una entidad `Product` que implementa `IMultiTenant` con `OrganizationId=123`
**When** se ejecuta `dbContext.Products.ToListAsync()` con tenant context `org=123`
**Then** la consulta SQL generada incluye `WHERE "OrganizationId" = '123'` automáticamente

### Scenario 2 — Aislamiento cruzado

**Given** datos existentes para `org=123` y `org=456`
**When** un usuario de `org=123` consulta todos los productos
**Then** solo recibe productos de `org=123`, los de `org=456` están invisibles

### Scenario 3 — Bypass explícito (admin)

**Given** un usuario con rol SuperAdmin
**When** ejecuta `dbContext.Products.IgnoreMultiTenant().ToListAsync()`
**Then** obtiene todos los productos de todas las organizaciones (registrado en audit log)

## Consideraciones técnicas

- **Performance**: Los filtros globales de EF Core tienen impacto mínimo (<5ms) pero deben indexarse las columnas `OrganizationId`.
- **Migraciones**: Asegurar que todas las tablas multi-tenant tengan columna `OrganizationId` con índice.
- **Testing**: Usar Testcontainers con múltiples tenants para validar aislamiento en integración.
- **Edge Cases**: Cuidado con `.Any()`, `.Count()` y joins; verificar que el filtro se propaga correctamente.

## Referencias

- EPIC-004
- ADR-011 (Multi-Tenancy Strategy)
- FEATURE-020
- Engineering Standards (.NET Data Access)
