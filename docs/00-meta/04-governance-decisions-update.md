# Farutech Cloud Platform — Actualización de Decisiones Ejecutivas (2026-07-09)

> **Actualización del 9 de Julio de 2026**
> **Owner**: CPO / Principal PM · **Estado**: Vigente

## A. Resolución Ejecutiva de Preguntas (Auditoría §21)

1. **Naturaleza del proyecto:** Producto B2B Multi-tenant SaaS real.
2. **Alcance V1:** Core multi-tenant, IAM centralizado, ruteo y módulo base testeable.
3. **MediatR:** Se descarta completamente.
4. **Modelo de identidad:** Keycloak (Open Source, OIDC/OAuth2 + MFA).
5. **Mapa de repositorios:** Part02.md es canónico, Part09/11.md deprecados.
6. **KPI del proyecto:** Latencia <200ms en el 95% de las peticiones; Uptime 99.9%; Tiempo de onboarding de tenants < 5 minutos.
7. **IA Nativa:** Interna Qoder/V1; IA expuesta como feature V2.
8. **Stack Agentes IA:** Go para workers; Node.js eliminado.
9. **DoR / DoD Canónico:** Fijado, basado en BDD + automatización obligatoria.
10. **ADR-001:** `001-modular-monolith.md` como único canónico.
11. **Part12–15:** Si están vacíos, elimínelos.
12. **BuenasPracticas:** **Purgadas (Opción 1) — decisión A.12 ejecutada**. Conjunto completo de 563 archivos personales ahora reside en `docs/_archive/meta-churn/BuenasPracticas` (0 estándares técnicos encontrados).
13. **Compliance:** OWASP Top 10 estricto V1; certificaciones ISO 27001/SOC 2 V2 postergadas a V2.
14. **Timeline:** MVP (Mes 1-3), V1 (Mes 4-6), V2 (Mes 7-9).
15. **Owners:** Architecture Office en Lead Architect; CPO / PM.
16. **RACI Gobernanza:** El Architecture Board aprueba estándares técnicos. PM aprueba PRD/backlog.
17. **EPIC-006 (Seguridad):** Dividida en épicas atómicas (IAM → EPIC-003; Logging y Control de Acceso pendientes).

## B. Plan Maestro de Gobernanza Documental

**Sprint 0 antes del desarrollo:**
1. Purga de Duplicados (Día 1-2) — completado.
2. Consolidación SSOT (Día 3-5) — completado (script `validate_structure.sh` listo para CI).
3. Estandarización de Calidad (Día 6-7) — completado (pipelines CI validan el DoD con Playwright E2E y pruebas de integración API).

## Artefactos de producto derivados (Vigentes V1)

- **PRD** → `00-prd-core.md`
- **Épicas** → `01-epics-and-features.md`
- **Roadmap** → `02-roadmap-tasks.md`
- **User Stories** → `05-user-stories.md`

## Actualizaciones

- **BuenasPracticas**: Purgadas (A.12 Opt1) — preservadas en `docs/_archive/meta-churn/BuenasPracticas` con historial.
- **6 raíces divergentes reconciliadas** (commits `d0f8e5b`, `ca829db`):
  - Monitoring (`04-monitoring-observability.md`)
  - Testing (`03-testing-quality.md`)
  - Technical Governance (`08-technical-governance.md`)
  - Technical Sustainability (`10-technical-sustainability.md`)
  - Knowledge (`12-knowledge-architecture.md`, `01-knowledge-management.md`, `02-documentation-knowledge.md`)
  - IA-Agents (`01-ai-agents-overview.md`, `02-ai-agents-prompts.md`)
- **Manifiesto `_archive`** actualizado a "Reconciliado (paridad confirmada)" con trazabilidad de commits.

## Próximos Pasos (decisión para hoy)

1. **A.12 completada** (purge).
2. **Integrar `validate_structure.sh` en CI** (opción a) — habilitar rechazo automático de PRs con duplicados/enlaces rotos.
3. **Refinar EPIC-006 (Security)** en épicas atómicas (Logging, Control de Acceso).
4. **Validar triggers CI/CD** para merges a `main`.

> **Decisión ejecutiva (9 de Julio de 2026)**: Purgar `BuenasPracticas` como ruido personal (Opción 1).

*Las contribuciones de chat persistirán en la sesión y el repo de la conversación.*

## Trazabilidad de commits

- `8561ced`: Artefactos PM + índice + archivo.
- `d0f8e5b`: Reconciliación IA-Agents.
- `8b554fe`: Auditoría BuenasPracticas.
- `ca829db`: Reconciliación tópicos 2–6.
- `7084135`: Actualización manifiesto.
- `9c45e37`: Reporte ejecutivo de 22 secciones.
- `d83a1c1`: Documentación purga BuenasPracticas (A.12 Opt1).
