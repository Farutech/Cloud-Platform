# FEATURE-017 — API Gateway Authentication Middleware

## Epic

[EPIC-003](../epics/EPIC-003.md) — Identity & Access Management

## Objetivo

Implementar el middleware de autenticación en el API Gateway (o capa de entrada de la plataforma) que centralice la validación de identidad, inyección de contexto de usuario y tenant, y protección de endpoints para todas las solicitudes entrantes.

## Descripción

Esta feature desarrolla el componente middleware que intercepta cada request HTTP entrante, valida el token JWT, extrae la información de identidad y tenant, y establece el contexto de ejecución para el resto del pipeline. Actúa como el guardián único de entrada a la plataforma.

## Alcance

- Creación de middleware `TenantResolutionMiddleware` en .NET
- Extracción de `tenant_id` desde claims del token
- Validación de presencia de tenant en cada request (excepto endpoints públicos)
- Inyección de `ITenantContext` en el scope de la request
- Protección de endpoints con atributos `[Authorize]`
- Configuración de endpoints públicos (health checks, webhook entry points)
- Logging estructurado de cada request con tenant context
- Manejo de errores de autenticación estandarizado

## Fuera de alcance

- Rate limiting por tenant (se aborda en FEATURE-024)
- Transformación de requests/responses
- Enrutamiento dinámico a microservicios

## Dependencias

- **Bloqueada por:** [FEATURE-016](FEATURE-016.md) - JWT Validation
- **Bloquea a:** FEATURE-018, FEATURE-020

## Criterios de aceptación

- [ ] Middleware registrado en pipeline de ASP.NET Core
- [ ] Extracción de `tenant_id` desde claim `tenant_id` o `org_id`
- [ ] `ITenantContext` disponible vía dependency injection
- [ ] Requests sin tenant válido retornan 403 Forbidden
- [ ] Endpoints marcados con `[AllowAnonymous]` omiten validación
- [ ] Logs incluyen `TenantId` en todas las entradas
- [ ] Tests de integración verifican flujo completo de autenticación
- [ ] Documentación de uso de middleware publicada

## Consideraciones técnicas

- **Patrón:** Middleware de ASP.NET Core
- **Interface:** `ITenantContext` con propiedad `TenantId` (Guid)
- **Scope:** Scoped por request
- **ADR Referenciado:** ADR-009 (IAM), ADR-011 (Multi-Tenancy)

## Referencias

- [ADR-009](../../03-architecture-and-standards/01-architecture-decision-records/ADR-009-identity-access-management.md)
- [ADR-011](../../03-architecture-and-standards/01-architecture-decision-records/ADR-011-multi-tenancy-strategy.md)
- [Engineering Standards](../../03-architecture-and-standards/02-engineering-standards.md)
- [EPIC-003](../epics/EPIC-003.md)
- [FEATURE-016](FEATURE-016.md)
