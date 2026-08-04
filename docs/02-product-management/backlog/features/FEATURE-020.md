# FEATURE-020 — Organization & Tenant Context Resolution

## Epic

EPIC-004 — Multi-Tenancy Core

## Objetivo

Implementar el mecanismo de resolución y propagación del contexto de tenant (Organización + Instancia) en todas las capas de la aplicación, garantizando que cada solicitud esté correctamente asociada a su tenant antes de ejecutar cualquier lógica de negocio o acceso a datos.

## Descripción

Esta feature establece el foundation del multi-tenancy híbrido. Cada request entrante debe identificar inequívocamente:
1. **Organization ID**: El schema lógico donde residen los datos.
2. **Instance ID**: La base de datos específica dentro del schema (para instancias de aplicaciones).

El contexto se extrae del token JWT (claims validados por FEATURE-015/016) y se propaga mediante un middleware dedicado (`TenantResolutionMiddleware`) hacia:
- Capa de aplicación (Use Cases)
- Capa de infraestructura (DbContexts, Repositorios)
- Sistema de logging y auditoría

## Alcance

- [ ] Crear interfaz `ITenantContext` con propiedades `OrganizationId`, `InstanceId`, `DeploymentType`.
- [ ] Implementar `TenantResolutionMiddleware` que lee claims del usuario autenticado.
- [ ] Registrar contexto como scoped service en DI container.
- [ ] Propagar contexto a través de `AsyncLocal<T>` para acceso en capas profundas.
- [ ] Validar que todo request autenticado tenga claims de tenant válidos.
- [ ] Manejar casos edge: usuarios super-admin sin tenant específico.

## Fuera de alcance

- UI de selección de organización (se asume seleccionada antes del login o vía claim).
- Lógica de creación de organizaciones (cubierta en EPIC-006).
- Provisión dinámica de bases de datos (cubierta en FEATURE-021).

## Dependencias

- FEATURE-015 (Keycloak Integration): Claims deben estar presentes en el token.
- FEATURE-016 (JWT Validation): Token debe estar validado antes de resolver tenant.
- ADR-011 (Multi-Tenancy Strategy): Define modelo híbrido Schema-per-Org + DB-per-Instance.

## Criterios de aceptación

### Scenario 1 — Request con tenant válido

**Given** un usuario autenticado con claims `org_id=123` e `instance_id=456`
**When** realiza una petición a cualquier endpoint protegido
**Then** el `TenantContext` está disponible en toda la pipeline con esos valores

### Scenario 2 — Request sin claims de tenant

**Given** un usuario autenticado sin claims de organización/instancia
**When** intenta acceder a un endpoint que requiere tenant
**Then** el middleware retorna HTTP 403 Forbidden con error "Tenant context missing"

### Scenario 3 — Propagación en capas internas

**Given** un request con tenant válido
**When** se ejecuta un Use Case que accede a repositorios
**Then** todas las capas pueden acceder al mismo `TenantContext` sin pasarlo explícitamente

## Consideraciones técnicas

- **Patrón**: Middleware + Scoped Service + AsyncLocal.
- **Claims esperados**: `farutech_org_id`, `farutech_instance_id`, `farutech_deployment_type` (shared/dedicated).
- **Thread Safety**: Usar `AsyncLocal<TenantContext>` para evitar problemas en código async/await.
- **Performance**: Resolución debe ocurrir una vez por request, no por operación interna.

## Referencias

- EPIC-004
- ADR-011 (Multi-Tenancy Strategy)
- FEATURE-015, FEATURE-016
