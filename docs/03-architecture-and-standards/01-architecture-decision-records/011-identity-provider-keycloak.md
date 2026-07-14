# ADR-011: Proveedor de Identidad — Keycloak (OIDC / OAuth 2.0 + MFA)

> **Propósito**: Documentar la decisión de utilizar Keycloak como proveedor de identidad (IdP) para Farutech Cloud Platform  
> **Audiencia**: Arquitectos de seguridad, ingenieros de plataforma, cumplimiento  
> **Propietario**: Lead Security Architect  
> **Última Revisión**: 2026-07-07  
> **Estado**: Aprobado

## Resumen

Farutech Cloud Platform requiere autenticación y autorización centralizadas, multi-tenant y conformes con OWASP Top 10 desde V1. Se adopta **Keycloak** (solución open-source) como IdP, exponiendo identidad vía OIDC / OAuth 2.0 con MFA, emitiendo tokens JWT firmados asimétricamente.

## Detalles

### Contexto
La plataforma maneja múltiples tenants con datos sensibles y debe cumplir controles estrictos de seguridad (OWASP Top 10 desde V1, ISO 27001 / SOC 2 en V2). Se requiere un IdP que soporte multi-tenancy, federación, MFA y emisión de tokens para el ecosistema de microfrontends y APIs.

### Alternativas Evaluadas

#### Opción 1: Keycloak (adoptado)
- **Ventajas**:
  - Open-source, sin costo de licencia
  - Soporte nativo de OIDC / OAuth 2.0, SAML
  - MFA y políticas de acceso por realm/tenant
  - Emite tokens JWT (firma asimétrica RS256)
  - Gestión de usuarios, roles y federación
- **Desventajas**:
  - Operar otro componente de infraestructura
  - Curva de configuración de realms multi-tenant

#### Opción 2: Identity Server (comercial / Duende)
- **Ventajas**:
  - Integración con ecosistema .NET
- **Desventajas**:
  - Modelo de licenciamiento de pago
  - Menor flexibilidad fuera de .NET

#### Opción 3: JWT autogestionado sin IdP
- **Ventajas**:
  - Sin componente externo
- **Desventajas**:
  - Reimplementación de MFA, federación y gestión de usuarios
  - Mayor superficie de error de seguridad

### Decisión
Se adopta **Keycloak** como IdP. La identidad se expone mediante OIDC / OAuth 2.0 con MFA obligatoria; Keycloak emite tokens JWT firmados asimétricamente que son consumidos por las APIs (.NET) y los microfrontends (React).

### Consecuencias
- **Positivas**:
  - Centralización de autenticación/autorización (SSO)
  - MFA y políticas por tenant listas para OWASP V1
  - Tokens JWT estándar, consumibles por backend y frontend
  - Evolutiva hacia federación empresarial
- **Negativas**:
  - Debe operarse y respaldarse Keycloak como componente crítico
  - Configuración de realms multi-tenant

### Impacto
- El login y la emisión de tokens ocurren en Keycloak, no en la aplicación
- Las APIs validan JWT (firma asimétrica) y aplican RBAC/ABAC (ver [ADR-009](009-security-architecture.md))
- MFA habilitada desde V1
- Sustituye cualquier referencia previa a "Identity Server" o a JWT autogestionado

## Referencias
- [Arquitectura de Seguridad (Zero Trust)](009-security-architecture.md)
- [Modelo de Aislamiento Multi-Tenant](006-multi-tenant-model.md)

> **Próximos Pasos**:
> - Definir el modelo de realms/tenants en Keycloak
> - Especificar el esquema de claims y el mapeo a RBAC/ABAC

---
*Versión del documento: 1.0.0 | Creado: 2026-07-07 | Revisión: Según sea necesario*
