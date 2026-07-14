# Farutech Cloud Platform — Acta de Decisiones Ejecutivas y Plan de Gobernanza

> **Estado**: Vigente · **Owner**: CPO / Principal PM (Feifei) · **Aprobación**: Principal PM + Architecture Board
> **Fuente**: Resolución ejecutiva del PM sobre la auditoría de documentación (§21) + Plan Maestro de Gobernanza Documental. Extraído fielmente del transcript de sesión; ver `docs/_archive/legacy-roots/pm-artifacts-source.md`.

## A. Resolución Ejecutiva de Preguntas (Auditoría §21)

1. **Naturaleza del proyecto:** Es un **Producto B2B Multi-tenant SaaS real**. La "arquitectura de referencia" o demos (como `finanzas_personales`) serán solo los primeros casos de uso para validar la plataforma.
2. **Alcance V1:** Dentro: Core multi-tenant, IAM centralizado, ruteo y un módulo base testeable. Fuera: Módulos de facturación (billing), IA orientada al cliente final.
3. **MediatR:** **Se descarta completamente.** Para garantizar latencias bajas y alto rendimiento comercial, usaremos arquitectura CQRS nativa con inyección de dependencias en .NET 10. Evitaremos el sobrecosto de rendimiento (overhead de reflexión) que genera MediatR.
4. **Modelo de identidad:** **Keycloak** (Open Source, OIDC/OAuth2 + MFA). Es gratuito, altamente escalable y elimina el riesgo de gestionar JWT asimétricos manualmente.
5. **Mapa de repositorios:** El mapa definido en `Part02.md` será el canónico. `Part09/11.md` serán deprecados y eliminados.
6. **Objetivos de negocio (KPIs):** Latencia <200ms en el 95% de las peticiones; Uptime de 99.9%; Tiempo de onboarding de nuevos tenants < 5 minutos.
7. **IA Nativa:** Para la V1, la IA será exclusivamente interna (Agentes de desarrollo/Qoder). En la V2 se expondrá como funcionalidad de producto.
8. **Stack Agentes IA:** Se adopta **Go (Golang)** para los workers por su superioridad en procesamiento concurrente y bajo consumo. Node.js queda eliminado de este pipeline.
9. **DoR / DoD Canónico:** Se establecerá un único estándar basado en pruebas automatizadas y BDD. Ninguna historia pasa a "Done" sin cobertura de automatización UI/API.
10. **ADR-001:** El archivo `001-modular-monolith.md` será el único canónico. El resto se elimina.
11. **Part12–15:** Si están vacíos, se eliminan inmediatamente para reducir ruido.
12. **BuenasPracticas:** Se auditará y convertirá en un repositorio de estándares técnicos gobernado, indexado y de cumplimiento obligatorio. No será una carpeta de referencias personales.
13. **Compliance:** Cumplimiento Top 10 OWASP estricto desde la V1. Las certificaciones formales ISO 27001/SOC 2 se auditarán en V2 para no frenar el Time-to-Market.
14. **Timeline:** MVP (Mes 1-3), V1 (Mes 4-6), V2 (Mes 7-9).
15. **Owners:** La "Architecture Office" recaerá en el Lead Architect y mi rol será CPO / Principal PM.
16. **RACI Gobernanza:** El Architecture Board aprueba estándares técnicos. Product Management (mi rol) aprueba los PRD y prioriza el backlog.
17. **EPIC-006 (Seguridad):** Se dividirá inmediatamente en Epics atómicos y testeables (Gestión IAM, Logging, Control de Acceso).

## B. Plan Maestro de Gobernanza Documental

Para detener el "meta-churn" reportado, ejecutaremos este plan de saneamiento (Sprint 0) antes del desarrollo:

1. **Purga de Duplicados (Día 1-2):** Eliminar todos los archivos duplicados byte-a-byte y las nomenclaturas dobles (PascalCase vs UPPERCASE). `FINAL_VERIFICATION.md` pasa a status "Superseded".
2. **Consolidación SSOT (Día 3-5):** Unificar la arquitectura en la estructura numerada definitiva. Se implementa el script `validate_structure.sh` en el pipeline de CI/CD para que cualquier PR que rompa los enlaces o duplique información sea rechazado automáticamente.
3. **Estandarización de Calidad (Día 6-7):** Establecer los pipelines de integración continua (CI) para validar que el DoD se cumpla obligatoriamente mediante automatización (Playwright para flujos E2E y pruebas de integración API).

## RACI (decisión A.16)

| Ámbito | Responsable | Aprueba |
|---|---|---|
| Estándares técnicos / ADRs | Lead Architect + Architecture Board | Architecture Board |
| PRD y priorización de backlog | CPO / Principal PM (Feifei) | Product Management |

## Artefactos de producto derivados (Vigentes V1)

- PRD: `docs/02-product-management/00-prd-core.md`
- Épicas: `docs/02-product-management/01-epics-and-features.md` (EPIC-001 Gobernanza/SSOT, EPIC-002 Core Multi-Tenancy, EPIC-003 IAM/Keycloak)
- Roadmap: `docs/02-product-management/02-roadmap-tasks.md` (MVP / V1 / V2)
- User Stories + AC (BDD): `docs/02-product-management/05-user-stories.md` (US-1.1, US-2.1, US-2.2, US-3.1, US-3.2)

## Actualizaciones (posteriores a la resolución inicial)

- **BuenasPracticas (A.12):** Auditado y **purgado como ruido personal (Opción 1)** — los 563 archivos personales fueron preservados en `docs/_archive/meta-churn/BuenasPracticas` (0 estándares técnicos encontrados). Ver `01-buenaspracticas-audit.md` y `03-buenaspracticas-purge.md`.
- **6 raíces divergentes reconciliadas** (commits `d0f8e5b`, `ca829db`): el contenido único de cada raíz fue fusionado en su hogar numerado canónico en lugar de eliminarse.
  - IA-Agents → `09-ai-agents/01-ai-agents-overview.md`, `09-ai-agents/02-ai-agents-prompts.md`
  - Monitoring → `04-development-lifecycle/04-monitoring-observability.md`
  - Testing → `04-development-lifecycle/03-testing-quality.md`
  - Technical Governance → `08-technical-governance.md`
  - Technical Sustainability → `10-technical-sustainability.md`
  - Knowledge → `12-knowledge-architecture.md`, `07-knowledge-and-innovation/01-knowledge-management.md`, `08-documentation/02-documentation-knowledge.md`
- **Manifiesto `_archive`** actualizado a "Reconciliado (paridad confirmada)" con trazabilidad de commits.

## Próximos Pasos (ejecutados)

1. ✅ **Integrar `validate_structure.sh` en CI** (Plan B.2) — workflow `.github/workflows/validate-docs-structure.yml` dispara en push/PR (incluye merge a `main`) y semanal; rechaza PRs con duplicados/enlaces rotos.
2. ✅ **Refinar EPIC-006 (Seguridad)** en épicas atómicas — formalizadas como **EPIC-005 (Logging & Audit)** y **EPIC-006 (Access Control)** en `01-epics-and-features.md`.
3. ✅ **Cerrar AC de US-2.2** — criterios BDD definidos por PM en `05-user-stories.md` (anclados a EPIC-002, KPI A.6, US-2.1, EPIC-005).
4. ✅ **Definir workers como EPIC-004** — épica **EPIC-004 (Async Workers, Go)** en `01-epics-and-features.md`, referencia ADR-014 / ADR-013.

## Trazabilidad de commits

- `8561ced`: Artefactos PM (PRD, Épicas, Roadmap, User Stories) + índice + archivo.
- `d0f8e5b`: Reconciliación IA-Agents.
- `8b554fe`: Auditoría BuenasPracticas (A.12).
- `ca829db`: Reconciliación tópicos 2–6.
- `7084135`: Actualización manifiesto `_archive`.
- `9c45e37`: Reporte ejecutivo de 22 secciones.
- `d83a1c1`: Documentación purga BuenasPracticas (A.12, Opción 1).
