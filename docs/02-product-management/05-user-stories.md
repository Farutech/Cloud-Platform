# Farutech Cloud Platform — User Stories & Acceptance Criteria (BDD)

> **Estado**: Vigente V1 · **Owner**: CPO / Principal PM (Feifei) · **Aprobación**: Product Management
> **Fuente**: Artefacto de producto obligatorio del PM. Extraído fielmente del transcript de sesión; ver `docs/_archive/legacy-roots/pm-artifacts-source.md`.
> **Estándar (decisión A.9)**: Toda historia usa criterios de aceptación en formato BDD (*Given/When/Then*). Ninguna historia pasa a "Done" sin cobertura de automatización UI/API.

## De EPIC-001 (Gobernanza y SSOT)

### US-1.1 — Validación documental en CI

> As a Lead Architect, I want the CI pipeline to automatically execute structural validations on documentation, So that duplicate files and broken links are prevented from being merged.

**Acceptance Criteria (BDD)**

- **Given** a developer opens a Pull Request modifying the `docs/` folder
- **When** the CI/CD pipeline is triggered
- **Then** the `validate_structure.sh` script must run successfully
- **And** the build must fail if any byte-to-byte duplicate files are detected.

## De EPIC-002 (Core Multi-Tenancy)

### US-2.1 — Inyección de contexto de tenant

> **Historia de sistema (no de usuario final)** — refleja una capacidad interna de la plataforma. Redactada en el artefacto fuente como *"As a Platform Component, I want to automatically inject and validate the Tenant ID..."*; se registra aquí como historia de sistema para evitar un persona de usuario inválido (ver ambigüedad R-5).
>
> As a Platform Component, I want to automatically inject and validate the Tenant ID from the request headers, So that database context is strictly scoped to the active tenant.

**Acceptance Criteria (BDD)**

- **Given** an incoming API request
- **When** the request is processed by the application middleware
- **Then** the system must extract the `X-Tenant-ID` header
- **And** validate that the current user's token contains claims for that specific Tenant
- **And** return a `403 Forbidden` if the user is attempting to access a different Tenant's context.

### US-2.2 — Creación de tenant vía API

> As a Platform Admin, I want to create a new Tenant structure via an API endpoint, So that I can onboard new B2B clients immediately.

**Acceptance Criteria (BDD)**

- ⚠️ **Gap del artefacto fuente**: el artefacto del PM no incluye criterios de aceptación para US-2.2. No se inventan aquí; pendiente de definición por Product Management antes del inicio del sprint correspondiente (DoR canónico exige AC definidos).

## De EPIC-003 (IAM / Keycloak)

### US-3.1 — Autenticación con Keycloak

> As a Tenant User, I want to authenticate via a centralized Keycloak portal, So that my credentials are secure and I receive a valid OIDC token.

**Acceptance Criteria (BDD)**

- **Given** an unauthenticated user navigates to the platform
- **When** they attempt to access a protected route
- **Then** the system must redirect them to the Keycloak login screen
- **And** upon entering correct credentials, redirect them back with a valid OAuth2 token payload.

### US-3.2 — MFA obligatorio

> As a Tenant Admin, I want to force all my organizational users to set up MFA, So that our internal data complies with baseline security policies.

**Acceptance Criteria (BDD)**

- **Given** a Tenant with the "MFA Required" policy active
- **When** a user from that Tenant logs in successfully with their password
- **Then** Keycloak must interrupt the flow and require a TOTP code
- **And** access to the platform must not be granted until the correct code is provided.
