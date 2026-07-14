# Farutech Cloud Platform — Épicas y Features

> **Estado**: Vigente V1 · **Owner**: CPO / Principal PM (Feifei) · **Aprobación**: Product Management + Architecture Board
> **Fuente**: Artefacto de producto obligatorio del PM. Extraído fielmente del transcript de sesión; ver `docs/_archive/legacy-roots/pm-artifacts-source.md`.
> **Resolución de colisión de IDs**: Las épicas previas (EPIC-001..006, archivo legado en `docs/_archive/legacy-roots/02-product-management/01-epics-and-features.md`) quedan **suprimidas** por las siguientes. El conjunto canónico post-decisión ejecutiva (§A) es **EPIC-001 … EPIC-006** (001 Gobernanza/SSOT, 002 Core Multi-Tenancy, 003 IAM/Keycloak, 004 Async Workers, 005 Logging & Audit, 006 Access Control).

## Épicas Principales (Canónicas)

### EPIC-001: Implementación de Gobernanza y SSOT Documental

Normalización del repositorio, purga de duplicados e implementación de validaciones en pipelines (CI).

**Alcance clave**:
- Purga de duplicados byte-a-byte y nomenclaturas dobles (PascalCase vs UPPERCASE).
- Consolidación SSOT en estructura numerada definitiva.
- `validate_structure.sh` en CI/CD (rechaza PRs con enlaces rotos o información duplicada).
- Establecimiento de pipelines CI para validar el DoD obligatoriamente (Playwright E2E + pruebas de integración API).

### EPIC-002: Core Multi-Tenancy Foundation

Infraestructura base de aislamiento lógico, inyección de dependencias y CQRS nativo de alto rendimiento.

**Alcance clave**:
- Aislamiento lógico por `Tenant_ID` en PostgreSQL (Shared/Dedicated híbrido).
- CQRS nativo vía inyección de dependencias en .NET 10 (sin MediatR — ADR-012).
- Inyección y validación del contexto de tenant en el middleware de la aplicación.
- API de creación de estructuras de tenant (onboarding < 5 min).

### EPIC-003: Centralized Identity Management (IAM)

Implementación y configuración de Keycloak como proveedor de OIDC/OAuth2 y MFA.

**Alcance clave**:
- Despliegue de Keycloak (Open Source) como IdP central.
- Redirección e integración nativa login/logout.
- Gestión de roles y MFA forzado por Tenant Admin.
- Emisión de JWT firmados asimétricamente (ADR-011).

### EPIC-004: Async Workers (Go)

Procesamiento asíncrono de trabajos en segundo plano mediante workers en Go, desacoplando operaciones largas del ciclo de request/response.

**Alcance clave**:
- Consumo de la cola de mensajes (RabbitMQ — ADR-013) por workers en Go (ADR-014).
- Handlers idempotentes y confirmación de mensajes (ack/nack) con reintentos acotados.
- Graceful shutdown y tolerancia a caídas (consumo desde el último offset válido).
- Observabilidad de workers: métricas de cola, latencia de procesamiento y trazas distribuidas.

**Fase**: V2 (post-MVP). Depende de EPIC-002 (CQRS nativo) y del broker definido en ADR-013.

### EPIC-005: Security — Centralized Logging & Audit

Trazabilidad centralizada, inmutable y consultable de eventos de seguridad y operación de la plataforma.

**Alcance clave**:
- Logging estructurado en JSON con contexto de `Tenant_ID` en cada entrada.
- Registro de auditoría de operaciones sensibles (login, cambios de rol, creación de tenant).
- Retención y hashing de logs para integridad (preparación ISO 27001 / SOC 2 en V2).
- Detección de anomalías y alertas P1–P4 (ver `04-monitoring-observability.md`).

**Fase**: V2 (post-MVP). Habilita el cumplimiento OWASP y la trazabilidad post-incidente.

### EPIC-006: Security — Access Control

Control de acceso fino, autorización por recurso y segregación de privilegios más allá de la autenticación IAM.

**Alcance clave**:
- RBAC granular con roles por tenant y permisos por recurso.
- Validación de autorización en cada request (no solo autenticación — ver US-2.1).
- Segregación de privilegios (admin de plataforma vs admin de tenant vs usuario).
- Auditoría de cambios de permisos y revisión periódica de accesos.

**Fase**: V2 (post-MVP). Complementa EPIC-003 (IAM) cerrando el lado de autorización.

---

## Notas de Gobernanza (no alteran el alcance canónico)

### División de Seguridad (decisión A.17) — COMPLETADA

La épica legada **EPIC-006 (Seguridad y Auditoría)** quedó descompuesta en épicas atómicas y testeables:
- **Gestión IAM** → absorbida por **EPIC-003** (Keycloak, ADR-011).
- **Logging** → formalizada como **EPIC-005 (Centralized Logging & Audit)**.
- **Control de Acceso** → formalizada como **EPIC-006 (Access Control)**.

El conjunto canónico de épicas es ahora **EPIC-001 … EPIC-006**. Las dos últimas (005, 006) y los workers (**EPIC-004**) se ejecutan en fase V2 (post-MVP) según el roadmap.

### Features y Tareas Técnicas

Las features detalladas (FEATURE-001..006) y tareas técnicas (TASK-001..005) del legado se archivan en `docs/_archive/legacy-roots/02-product-management/01-epics-and-features.md` y se red erivan a partir de las épicas canónicas antes del inicio de cada sprint.

## Definition of Ready (DoR) — Canónico

Una historia inicia cuando:
- [ ] Tiene un objetivo claro y alcance definido.
- [ ] Tiene criterios de aceptación definidos (formato BDD *Given/When/Then*).
- [ ] Tiene diseño aprobado (cuando aplica).
- [ ] Tiene dependencias identificadas y resueltas.
- [ ] Tiene riesgos conocidos y mitigados.
- [ ] Tiene estimación realizada.
- [ ] Tiene asignación de recursos.
- [ ] **Incluye plan de pruebas automatizadas (UI/API)** — ninguna historia pasa a "Ready" sin cobertura de automatización definida.

## Definition of Done (DoD) — Canónico

Una historia está terminada cuando:

**Código:**
- [ ] Implementado según especificaciones.
- [ ] Revisado por al menos un par (Code Review).
- [ ] Cumple con estándares de calidad.

**Testing:**
- [ ] Pruebas unitarias implementadas y pasando.
- [ ] Pruebas de integración implementadas y pasando.
- [ ] Pruebas E2E (Playwright) implementadas cuando aplica y pasando.
- [ ] Cobertura de pruebas aceptable (objetivo > 85% E2E en CI).

**Calidad:**
- [ ] Sin vulnerabilidades de seguridad críticas (OWASP Top 10 estricto desde V1).
- [ ] Documentación actualizada.
- [ ] No hay deuda técnica acumulada.

**Operación:**
- [ ] Pipeline CI/CD exitoso (incluye `validate_structure.sh`).
- [ ] Artefacto desplegable.
- [ ] Cumple con estándares arquitectónicos.

**Producto:**
- [ ] Criterios de aceptación (BDD) cumplidos.
- [ ] Aprobado por el responsable de producto.
- [ ] Pruebas de usuario completadas cuando aplica.

> **Estándar único (decisión A.9)**: Ninguna historia pasa a "Done" sin cobertura de automatización UI/API. BDD es obligatorio en todos los criterios de aceptación.
