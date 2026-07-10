# Archive — Documentación legacy previa a la SSOT

> **Propósito**: Esta carpeta contiene los archivos duplicados de la raíz de `docs/`
> (nomenclatura `PascalCase` / `UPPER_SNAKE_CASE` y documentos de proceso/churn) que fueron
> desplazados del árbol activo durante la reorganización de gobernanza documental
> (rama `docs/governance-reorg`, 2026-07).
>
> **Estado**: `En reconciliación` — NO es parte de la SSOT activa.
>
> **Política de retención**:
> 1. El árbol activo de la SSOT son las carpetas numeradas `00-meta/` … `10-requirements/`.
> 2. Los archivos aquí preservados SÓLO existen como red de seguridad de rollback y para
>    reconciliar contenido único que no haya sido migrado fielmente a su hogar numerado.
> 3. Una vez confirmada la paridad de contenido (tras el paso de reconciliación), esta
>    carpeta `_archive/` será eliminada con su propio commit.
>
> **Rollback**: todos los archivos aquí fueron movidos con `git mv`, por lo que su historial
> se conserva. Para restaurar cualquiera: `git show <commit>:<ruta>` o `git revert <commit>`.

## Estructura
- `legacy-roots/` — duplicados de la raíz (`*Guide.md`, `IA-Agents.md`, `KNOWLEDGE_ARCHITECTURE.md`, etc.)
- `meta-churn/` — documentos de proceso/auditoría internos (`CLEANUP_*`, `PHASE_*`, `FILES_TO_DELETE`, etc.)

## Manifiesto de purga (Sprint 0)
| Archivo archivado | Hogar SSOT numerado | Acción |
|-------------------|---------------------|--------|
| IA-Agents.md | 09-ai-agents/01-ai-agents-overview.md | reconciliar + remover |
| AI_AGENTS_PROMPTS_GUIDE.md | 09-ai-agents/02-ai-agents-prompts.md | reconciliar + remover |
| KNOWLEDGE_ARCHITECTURE.md | 03-architecture-and-standards/12-knowledge-architecture.md | reconciliar + remover |
| DATA_GOVERNANCE_GUIDE.md | 03-architecture-and-standards/11-data-governance.md | remover (subset) |
| DEPENDENCIES_SECURITY_GUIDE.md | 05-security/02-dependencies-security.md | remover (subset) |
| DEPLOYMENT_OPERATIONS_GUIDE.md | 04-development-lifecycle/02-deployment-operations.md | remover (subset) |
| MONITORING_OBSERVABILITY_GUIDE.md | 04-development-lifecycle/04-monitoring-observability.md | reconciliar + remover |
| TECHNICAL_GOVERNANCE_GUIDE.md | 03-architecture-and-standards/08-technical-governance.md | reconciliar + remover |
| TECHNICAL_SUSTAINABILITY_GUIDE.md | 03-architecture-and-standards/10-technical-sustainability.md | reconciliar + remover |
| TESTING_QUALITY_GUIDE.md | 04-development-lifecycle/03-testing-quality.md | reconciliar + remover |
| (resto de *Guide.md / *GUIDE.md) | carpetas numeradas correspondientes | remover (subset/vacío) |
| REQUIREMENTS_MIGRATION_*.md | — (proceso) | remover |
| meta-churn/* | — (proceso) | remover |
