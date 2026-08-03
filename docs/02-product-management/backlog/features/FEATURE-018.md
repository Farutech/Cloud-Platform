# FEATURE-018 — Granular RBAC System

## Epic

[EPIC-003](../epics/EPIC-003.md) — Identity & Access Management

## Objetivo

Implementar un sistema de control de acceso basado en roles (RBAC) granular que permita definir permisos específicos por recurso y acción, asignables a roles dentro de cada organización/tenant.

## Descripción

Esta feature construye el modelo de autorización que permite a las organizaciones definir roles personalizados con combinaciones específicas de permisos (ej: `sales.order.create`, `inventory.product.read`). Los permisos se evalúan en runtime basándose en los claims del token JWT y el contexto del tenant.

## Alcance

- Definición de modelo de datos: `Role`, `Permission`, `RolePermission`
- Seed inicial de permisos estándar del sistema
- API para gestión de roles y permisos por tenant
- Evaluación de permisos mediante policy handler en .NET
- Claims transformation para incluir permisos en el token
- UI administrativa para asignación de roles (futuro, solo backend ahora)
- Tests de autorización para todos los escenarios

## Fuera de alcance

- Roles a nivel de plataforma (solo roles por tenant)
- ABAC (Attribute-Based Access Control) avanzado
- Delegación de roles entre usuarios

## Dependencias

- **Bloqueada por:** [FEATURE-017](FEATURE-017.md) - API Gateway Middleware
- **Bloquea a:** EPIC-006 (Organization Management features)

## Criterios de aceptación

- [ ] Tablas `Roles`, `Permissions`, `RolePermissions` creadas en schema de tenant
- [ ] Seed de 20+ permisos estándar (CRUD por entidad principal)
- [ ] Endpoint `POST /roles` crea rol con permisos asociados
- [ ] Endpoint `GET /permissions` lista permisos disponibles
- [ ] Policy handler evalúa `RequirePermission("sales.order.create")`
- [ ] Token JWT incluye claim `permissions` con lista plana
- [ ] Requests sin permiso adecuado retornan 403 Forbidden
- [ ] Tests unitarios cubren todas las combinaciones de roles/permisos
- [ ] Tests de integración validan flujo completo de autorización

## Consideraciones técnicas

- **Modelo:** RBAC jerárquico por tenant
- **Claims:** Array de strings en claim `permissions`
- **Evaluación:** `IAuthorizationHandler` personalizado en .NET
- **Cache:** Permisos cacheados por role_id (5 min TTL)
- **ADR Referenciado:** ADR-009 (Identity & Access Management)

## Referencias

- [ADR-009](../../03-architecture-and-standards/01-architecture-decision-records/ADR-009-identity-access-management.md)
- [Engineering Standards](../../03-architecture-and-standards/02-engineering-standards.md)
- [EPIC-003](../epics/EPIC-003.md)
- [FEATURE-017](FEATURE-017.md)
