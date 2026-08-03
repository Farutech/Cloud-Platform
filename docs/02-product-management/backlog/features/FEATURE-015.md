# FEATURE-015 — Keycloak Integration & OIDC Setup

## Epic

[EPIC-003](../epics/EPIC-003.md) — Identity & Access Management

## Objetivo

Establecer la integración fundamental entre la plataforma Farutech y Keycloak como proveedor de identidad centralizado, configurando el protocolo OIDC para autenticación única (SSO) en todo el ecosistema.

## Descripción

Esta feature implementa la conexión inicial con Keycloak, configurando el realm principal, clients para cada aplicación del ecosistema, y el flujo de autenticación OIDC estándar. Incluye la configuración de conexiones seguras, manejo de discovery endpoints, y validación básica de tokens.

## Alcance

- Configuración de Keycloak en entorno local (Docker) y producción
- Creación de realm `farutech-platform` con configuración base
- Registro de clients para: Platform API, POS App,未来 Apps
- Implementación de OIDC Discovery endpoint validation
- Configuración de redirect URIs dinámicos por entorno
- Setup de certificados JWKS para validación offline de tokens
- Documentación de procedimientos de administración de Keycloak

## Fuera de alcance

- Implementación de MFA (se aborda en FEATURE-019)
- Personalización de temas de login de Keycloak
- Federación de identidades con proveedores externos (Google, Microsoft, etc.)
- Gestión de usuarios desde la plataforma (solo lectura desde Keycloak)

## Dependencias

- **Bloqueada por:** Ninguna (feature fundacional)
- **Bloquea a:** FEATURE-016, FEATURE-017, FEATURE-018

## Criterios de aceptación

- [ ] Keycloak desplegado vía Docker Compose con persistencia de datos
- [ ] Realm `farutech-platform` creado con configuración documentada
- [ ] Client `platform-api` registrado con confidential flow
- [ ] Client `pos-app` registrado con public flow (PKCE)
- [ ] Endpoint `/.well-known/openid-configuration` accesible y validado
- [ ] Certificados JWKS descargados y cacheados correctamente
- [ ] Flow completo de login/logout funcional con redirecciones
- [ ] Tests de integración verifican obtención de token válido
- [ ] Documentación de operación de Keycloak publicada

## Consideraciones técnicas

- **Stack:** .NET 8+, `Microsoft.AspNetCore.Authentication.JwtBearer`
- **Protocolo:** OIDC con PKCE para clientes públicos
- **Almacenamiento:** PostgreSQL para Keycloak (separado de la plataforma)
- **Seguridad:** TLS obligatorio en producción, secrets en Vault/Coolify
- **ADR Referenciado:** ADR-009 (Identity & Access Management)

## Referencias

- [ADR-009](../../03-architecture-and-standards/01-architecture-decision-records/ADR-009-identity-access-management.md)
- [Engineering Standards](../../03-architecture-and-standards/02-engineering-standards.md)
- [EPIC-003](../epics/EPIC-003.md)
