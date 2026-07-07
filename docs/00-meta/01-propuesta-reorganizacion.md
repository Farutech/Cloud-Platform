# 01 - PROPUESTA DE REORGANIZACIÓN DE DOCUMENTACIÓN FARUTECH CLOUD PLATFORM

## 1. Objetivo de la Reorganización

Transformar la estructura actual de documentación dispersa y con duplicados en una estructura clara, jerárquica y profesional con nomenclatura consistente y alineada con los principios de Clean Architecture en un solo proyecto (Modular Monolith).

## 2. Árbol de Directorios Propuesto

```
docs/
├── 00-meta/
│   ├── 00-diagnostico.md
│   ├── 01-propuesta-reorganizacion.md
│   └── 02-reorganizacion-completada.md
│
├── 01-vision-and-fundamentals/
│   ├── 01-product-vision.md
│   ├── 02-platform-fundamentals.md
│   └── 03-platform-architecture.md
│
├── 02-product-management/
│   ├── 01-roadmap.md
│   ├── 02-epics-and-features.md
│   ├── 03-task-management.md
│   └── 04-team-organization.md
│
├── 03-architecture-and-standards/
│   ├── 01-architecture-decision-records/
│   │   ├── 001-modular-monolith.md
│   │   ├── 002-postgresql-database.md
│   │   ├── 003-multi-tenant-model.md
│   │   ├── 004-microfrontends-architecture.md
│   │   ├── 005-backend-dotnet10.md
│   │   └── 006-react-frontend.md
│   ├── 02-engineering-standards.md
│   ├── 03-coding-standards.md
│   ├── 04-namespace-conventions.md
│   ├── 05-configuration-standards.md
│   ├── 06-packages-library.md
│   ├── 07-versioning-releases.md
│   ├── 08-technical-governance.md
│   ├── 09-technical-debt-management.md
│   ├── 10-technical-sustainability.md
│   ├── 11-data-governance.md
│   └── 12-knowledge-architecture.md
│
├── 04-development-lifecycle/
│   ├── 01-development-lifecycle.md
│   ├── 02-deployment-operations.md
│   ├── 03-testing-quality.md
│   ├── 04-monitoring-observability.md
│   ├── 05-incident-management.md
│   └── 06-software-quality.md
│
├── 05-security/
│   ├── 01-security-access.md
│   └── 02-dependencies-security.md
│
├── 06-developer-experience/
│   └── 01-developer-experience.md
│
├── 07-knowledge-and-innovation/
│   ├── 01-knowledge-management.md
│   └── 02-innovation-management.md
│
├── 08-documentation/
│   ├── 01-documentation-guide.md
│   └── 02-documentation-knowledge.md
│
├── 09-ai-agents/
│   ├── 01-ai-agents-overview.md
│   ├── 02-ai-agents-prompts.md
│   └── 03-prompt-master-guide.md
│
├── 10-requirements/
│   ├── 00-requirements-summary.md
│   ├── 01-requirements-part01.md
│   ├── 02-requirements-part02.md
│   ├── 03-requirements-part03.md
│   ├── 04-requirements-part04.md
│   ├── 05-requirements-part05.md
│   ├── 06-requirements-part06.md
│   ├── 07-requirements-part07.md
│   ├── 08-requirements-part08.md
│   ├── 09-requirements-part09.md
│   ├── 10-requirements-part10.md
│   ├── 11-requirements-part11.md
│   ├── 12-migration-plan.md
│   ├── 13-migration-guide.md
│   └── 14-migration-checklist.md
│
└── 11-templates/
    ├── 01-epic-template.md
    ├── 02-feature-template.md
    ├── 03-user-story-template.md
    ├── 04-task-template.md
    ├── 05-adr-template.md
    ├── 06-guide-template.md
    ├── 07-requirement-template.md
    └── 08-code-structure-template.md
```

## 3. Nomenclatura Estándar Definida

- **Prefijos numéricos** para orden: `01-`, `02-`, etc.
- **kebab-case** para nombres: `coding-standards.md`
- **Sufijos descriptivos**: `-guide.md`, `-standard.md`, `-template.md`
- **Evitar espacios y caracteres especiales**
- **Nombres en inglés** para consistencia técnica
- **TODO en minúsculas** (no UPPER_SNAKE_CASE ni PascalCase)

## 4. Tabla de Mapeo de Reorganización

| ID Original | Archivo Existente | Acción | Nuevo Nombre y Ubicación | Justificación |
|-------------|------------------|--------|-------------------------|----------------|
| 01.01 | Farutech-Cloud-Platform-Fundamentals.md | Mover | 01-vision-and-fundamentals/02-platform-fundamentals.md | Consolidación de visión y fundamentos |
| 01.02 | Farutech-Cloud-Platform-Architecture.md | Mover | 01-vision-and-fundamentals/03-platform-architecture.md | Consolidación de arquitectura |
| 01.03 | SUMMARY.md | Mover | 01-vision-and-fundamentals/04-documentation-index.md | Renombrado y reubicado |
| 01.04 | index.md | Mover | 01-vision-and-fundamentals/05-entry-point.md | Renombrado y reubicado |
| 02.01 | Epics-And-Features.md | Mover | 02-product-management/02-epics-and-features.md | Consolidación de gestión de producto |
| 02.02 | Roadmap-Tasks.md | Mover | 02-product-management/01-roadmap.md | Renombrado para claridad |
| 02.03 | TaskManagementGuide.md | Mover | 02-product-management/03-task-management.md | Eliminar duplicado UPPER |
| 02.04 | TeamOrganizationGuide.md | Mover | 02-product-management/04-team-organization.md | Eliminar duplicado UPPER |
| 03.01 | Architecture-Decision-Records.md | Dividir | 03-architecture-and-standards/01-architecture-decision-records/ | Convertir en múltiples ADRs |
| 03.02 | Engineering Development Standards & Best Practices Handbook.md | Mover | 03-architecture-and-standards/02-engineering-standards.md | Renombrado |
| 03.03 | CONFIGURATION_STANDARDS.md | Mover | 03-architecture-and-standards/05-configuration-standards.md | Renombrado |
| 03.04 | PackagesLibraryGuide.md | Mover | 03-architecture-and-standards/06-packages-library.md | Eliminar duplicado UPPER |
| 03.05 | VersioningReleasesGuide.md | Mover | 03-architecture-and-standards/07-versioning-releases.md | Eliminar duplicado UPPER (vacío) |
| 03.06 | TechnicalGovernanceGuide.md | Mover | 03-architecture-and-standards/08-technical-governance.md | Eliminar duplicado UPPER |
| 03.07 | TechnicalDebtManagementGuide.md | Mover | 03-architecture-and-standards/09-technical-debt-management.md | Eliminar duplicado UPPER |
| 03.08 | TechnicalSustainabilityGuide.md | Mover | 03-architecture-and-standards/10-technical-sustainability.md | Eliminar duplicado UPPER |
| 03.10 | KnowledgeArchitecture.md | Mover | 03-architecture-and-standards/12-knowledge-architecture.md | Eliminar duplicado UPPER |
| 04.01 | DevelopmentLifecycleGuide.md | Mover | 04-development-lifecycle/01-development-lifecycle.md | Eliminar duplicado UPPER (vacío) |
| 04.02 | (Vacío) DEPLOYMENT_OPERATIONS_GUIDE.md | Crear | 04-development-lifecycle/02-deployment-operations.md | Crear archivo vacío |
| 04.03 | TestingQualityGuide.md | Mover | 04-development-lifecycle/03-testing-quality.md | Eliminar duplicado UPPER |
| 04.04 | MonitoringObservabilityGuide.md | Mover | 04-development-lifecycle/04-monitoring-observability.md | Eliminar duplicado UPPER |
| 04.05 | IncidentManagementGuide.md | Mover | 04-development-lifecycle/05-incident-management.md | Eliminar duplicado UPPER |
| 04.06 | SoftwareQualityManagementGuide.md | Mover | 04-development-lifecycle/06-software-quality.md | Eliminar duplicado UPPER |
| 05.01 | SecurityAccessGuide.md | Mover | 05-security/01-security-access.md | Eliminar duplicado UPPER |
| 05.02 | (Vacío) DEPENDENCIES_SECURITY_GUIDE.md | Crear | 05-security/02-dependencies-security.md | Crear archivo vacío |
| 06.01 | DeveloperExperienceGuide.md | Mover | 06-developer-experience/01-developer-experience.md | Eliminar duplicado UPPER (vacío) |
| 07.01 | KnowledgeManagementGuide.md | Mover | 07-knowledge-and-innovation/01-knowledge-management.md | Eliminar duplicado UPPER |
| 07.02 | InnovationManagementGuide.md | Mover | 07-knowledge-and-innovation/02-innovation-management.md | Eliminar duplicado UPPER |
| 08.01 | DocumentationGuide.md | Mover | 08-documentation/01-documentation-guide.md | Eliminar duplicado UPPER (vacío) |
| 08.02 | DocumentationKnowledgeGuide.md | Mover | 08-documentation/02-documentation-knowledge.md | Eliminar duplicado UPPER (vacío) |
| 08.03 | DocumentationReviewReport.md | Mover | 08-documentation/03-documentation-review.md | Eliminar duplicado UPPER (vacío) |
| 09.01 | IA-Agents.md | Mover | 09-ai-agents/01-ai-agents-overview.md | Renombrado |
| 09.02 | AI_AGENTS_PROMPTS_GUIDE.md | Mover | 09-ai-agents/02-ai-agents-prompts.md | Renombrado |
| 09.03 | PROMPT_MASTER_GUIDE.md | Mover | 09-ai-agents/03-prompt-master-guide.md | Renombrado |
| 10.01 | requirements/REQUIREMENTS_SUMMARY.md | Mover | 10-requirements/00-requirements-summary.md | Reubicado |
| 10.02 | requirements/Part01.md | Mover | 10-requirements/01-requirements-part01.md | Reubicado |
| 10.03 | requirements/Part02.md | Mover | 10-requirements/02-requirements-part02.md | Reubicado |
| 10.04 | requirements/Part03.md | Mover | 10-requirements/03-requirements-part03.md | Reubicado |
| 10.05 | requirements/Part04.md | Mover | 10-requirements/04-requirements-part04.md | Reubicado |
| 10.06 | requirements/Part05.md | Mover | 10-requirements/05-requirements-part05.md | Reubicado |
| 10.07 | requirements/Part06.md | Mover | 10-requirements/06-requirements-part06.md | Reubicado |
| 10.08 | requirements/Part07.md | Mover | 10-requirements/07-requirements-part07.md | Reubicado |
| 10.09 | requirements/Part08.md | Mover | 10-requirements/08-requirements-part08.md | Reubicado |
| 10.10 | requirements/Part09.md | Mover | 10-requirements/09-requirements-part09.md | Reubicado |
| 10.11 | requirements/Part10.md | Mover | 10-requirements/10-requirements-part10.md | Reubicado |
| 10.12 | requirements/Part11.md | Mover | 10-requirements/11-requirements-part11.md | Reubicado |
| 10.17 | REQUIREMENTS_MIGRATION_PLAN.md | Mover | 10-requirements/12-migration-plan.md | Reubicado |
| 10.18 | REQUIREMENTS_MIGRATION_GUIDE.md | Mover | 10-requirements/13-migration-guide.md | Reubicado |
| 10.19 | REQUIREMENTS_MIGRATION_CHECKLIST.md | Mover | 10-requirements/14-migration-checklist.md | Reubicado |

## 5. Resolución de Duplicados

### 5.1 Archivos PascalCase vs UPPER_SNAKE_CASE
- **Conservar:** Versión PascalCase (tiene contenido en la mayoría de los casos)
- **Eliminar:** Versión UPPER_SNAKE_CASE (vacía o duplicada)
- **Especial:** TESTING_QUALITY_GUIDE.md contiene ambos documentos combinados, se debe revisar para contenido único antes de eliminar

### 5.2 Archivos Vacíos
- **DEPLOYMENT_OPERATIONS_GUIDE.md**: Crear archivo nuevo con contenido basado en Part08.md
- **DEPENDENCIES_SECURITY_GUIDE.md**: Crear archivo nuevo con contenido sobre seguridad de dependencias

## 6. Archivos Nuevos a Crear

### 6.1 Archivos de Implementación
- `00-diagnostico.md` - Copia del diagnóstico realizado en Fase 2
- `02-reorganizacion-completada.md` - Reporte de la reorganización completada
- `04-development-lifecycle/02-deployment-operations.md` - Basado en Part08.md
- `05-security/02-dependencies-security.md` - Nuevo contenido sobre seguridad de dependencias

### 6.2 Templates Profesionales
- `11-templates/01-epic-template.md` - Plantilla para épicas
- `11-templates/02-feature-template.md` - Plantilla para features
- `11-templates/03-user-story-template.md` - Plantilla para historias de usuario
- `11-templates/04-task-template.md` - Plantilla para tareas técnicas (con sección de estructura de código alineada con Clean Architecture single-project)
- `11-templates/05-adr-template.md` - Plantilla para decisiones arquitectónicas
- `11-templates/06-guide-template.md` - Plantilla para guías técnicas
- `11-templates/07-requirement-template.md` - Plantilla para requerimientos
- `11-templates/08-code-structure-template.md` - Plantilla específica para estructura de código alineada con Modular Monolith

### 6.3 ADRs Separados
Convertir el archivo único `Architecture-Decision-Records.md` en múltiples ADRs:
- `001-modular-monolith.md` - Decisión sobre arquitectura de monolito modular
- `002-postgresql-database.md` - Decisión sobre PostgreSQL como base de datos
- `003-multi-tenant-model.md` - Decisión sobre modelo de multi-tenant
- `004-microfrontends-architecture.md` - Decisión sobre arquitectura de microfrontends
- `005-backend-dotnet10.md` - Decisión sobre backend en .NET 10
- `006-react-frontend.md` - Decisión sobre frontend en React

## 7. Alineación con Clean Architecture Single-Project

La nueva estructura refleja los principios de Clean Architecture en un solo proyecto (Modular Monolith) según el artículo de Nikola Tech:

1. **Modular Monolith Structure**: La organización por temas (visión, arquitectura, desarrollo, etc.) permite mantener una estructura lógica sin necesidad de múltiples proyectos físicos.

2. **Vertical Slices Approach**: La estructura por categorías permite que cada "feature" o "vertical slice" pueda ser comprendida en su contexto completo.

3. **Namespace Convention**: La estructura de carpetas apoya el uso de namespaces lógicos como `WebApi.Features.Users`, `WebApi.Domain`, `WebApi.Business`, etc.

4. **Logical Separation**: La separación por carpetas mantiene la separación lógica de responsabilidades sin la complejidad de múltiples proyectos físicos.

## 8. Convenciones de Documentación

### 8.1 Estructura de Documentos
Cada documento seguirá la plantilla oficial:

```markdown
# [Número] - [Título del Documento]

> **Propósito**: [Descripción del propósito del documento]
> **Audiencia**: [Audiencia objetivo]
> **Propietario**: [Responsable del mantenimiento]
> **Última Revisión**: [Fecha YYYY-MM-DD]
> **Estado**: [Actual/Obsoleto/En Revisión]

## Resumen
[Resumen de 2-3 párrafos del contenido principal]

## Detalles
[Contenido detallado organizado en secciones lógicas]

## Referencias
- [Documento relacionado](ruta/al/documento.md)
- [Recurso externo](https://ejemplo.com)

> **Próximos Pasos**:
> - [Acción con enlace a documento relacionado](ruta)
> - [Alternativa para audiencias diferentes](ruta)

---
*Versión del documento: 1.0.0 | Creado: [YYYY-MM-DD] | Revisión: Trimestral*
```

### 8.2 Convenciones de Enlaces
- Todos los enlaces internos usarán rutas relativas
- Los enlaces tendrán texto descriptivo que indique el contenido
- Se evitarán enlaces rotos mediante validación automática

## 9. Proceso de Implementación

### Fase 1: Preparación
- Crear copia de seguridad completa
- Validar todos los documentos existentes
- Preparar scripts de migración

### Fase 2: Migración
- Mover archivos según tabla de mapeo
- Crear nuevos directorios
- Eliminar duplicados UPPER_SNAKE_CASE
- Crear archivos nuevos

### Fase 3: Validación
- Verificar integridad de todos los documentos
- Validar todos los enlaces internos
- Actualizar SUMMARY.md y otros índices
- Confirmar que no hay contenido perdido

### Fase 4: Documentación
- Crear `02-reorganizacion-completada.md` con reporte completo
- Actualizar README.md principal
- Documentar proceso para futuras referencias

## 10. Validación Post-Migración

- Todos los documentos accesibles y con contenido intacto
- No duplicados ni archivos vacíos innecesarios
- Estructura jerárquica clara y lógica
- Nomenclatura consistente con convenciones definidas
- Alineación con principios de Clean Architecture single-project
- Templates disponibles para futuros documentos
- ADRs separados para mejor gestión

---

**Esta propuesta establece la base para una estructura documental profesional, escalable y alineada con los principios de Clean Architecture en un solo proyecto, resolviendo los problemas identificados en la fase de diagnóstico.**