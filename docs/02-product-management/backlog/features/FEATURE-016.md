# FEATURE-016 — JWT Validation & Token Management

## Epic

[EPIC-003](../epics/EPIC-003.md) — Identity & Access Management

## Objetivo

Implementar el sistema de validación de tokens JWT emitidos por Keycloak, gestionando la verificación de firmas, expiración, claims requeridos y renovación de tokens para garantizar sesiones seguras y válidas.

## Descripción

Esta feature desarrolla los componentes backend que validan cada token JWT entrante en las APIs de la plataforma, asegurando que provenga de Keycloak, no haya expirado, contenga los claims mínimos requeridos y esté correctamente firmado. Incluye mecanismos de cacheo de claves JWKS y manejo de refresh tokens.

## Alcance

- Implementación de middleware de validación JWT en .NET
- Configuración de parámetros de validación (issuer, audience, signing keys)
- Cacheo de JWKS con invalidación automática
- Manejo de expiración y renovación de tokens (access + refresh)
- Extracción y normalización de claims estándar y personalizados
- Logging de eventos de validación fallida
- Tests unitarios y de integración para todos los escenarios

## Fuera de alcance

- Emisión de tokens propios (solo se consumen tokens de Keycloak)
- Almacenamiento de sesiones server-side (stateless por diseño)
- Validación de scopes específicos de aplicaciones (se aborda en FEATURE-018)

## Dependencias

- **Bloqueada por:** [FEATURE-015](FEATURE-015.md) - Keycloak Integration
- **Bloquea a:** FEATURE-017, FEATURE-018

## Criterios de aceptación

- [ ] Middleware `JwtBearerAuthentication` configurado y operativo
- [ ] Validación de firma con JWKS de Keycloak funcionando
- [ ] Verificación de issuer (`iss`) igual a `https://keycloak.farutech.com/realms/farutech-platform`
- [ ] Verificación de audience (`aud`) igual a `platform-api`
- [ ] Cache de JWKS con TTL de 1 hora y refresh automático
- [ ] Manejo correcto de tokens expirados (401 Unauthorized)
- [ ] Soporte de refresh token flow documentado y testeado
- [ ] Claims `sub`, `email`, `roles`, `tenant_id` extraídos y disponibles
- [ ] Tests unitarios cubren 100% de lógica de validación
- [ ] Tests de integración con Keycloak real pasando

## Consideraciones técnicas

- **Librerías:** `Microsoft.AspNetCore.Authentication.JwtBearer`, `System.IdentityModel.Tokens.Jwt`
- **Cache:** IMemoryCache para JWKS con Polly para retry
- **Claims:** Mapeo de `realm_access.roles` a claims de .NET
- **ADR Referenciado:** ADR-009 (Identity & Access Management)

## Referencias

- [ADR-009](../../03-architecture-and-standards/01-architecture-decision-records/ADR-009-identity-access-management.md)
- [Engineering Standards](../../03-architecture-and-standards/02-engineering-standards.md)
- [EPIC-003](../epics/EPIC-003.md)
- [FEATURE-015](FEATURE-015.md)
