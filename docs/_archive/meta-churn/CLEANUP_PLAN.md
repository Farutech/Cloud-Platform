# PLAN DE LIMPIEZA DETALLADO PARA DOCUMENTACIÓN FARUTECH CLOUD PLATFORM

## Fecha: 2026-07-07

## Propósito
Eliminar todos los archivos duplicados, desorganizados y temporales para dejar únicamente la estructura organizada y limpia.

## ARCHIVOS DUPLICADOS DENTRO DE LA ESTRUCTURA ORGANIZADA (A ELIMINAR)

### En 00-meta/
- 01-navegacion-aprobar-mantener.md (archivo duplicado o temporal)
- 02-RESUMEN-FINAL.md (archivo duplicado o temporal)

### En 01-vision-and-fundamentals/
- 01-platform-fundamentals.md (duplicado de 02-platform-fundamentals.md)
- 02-platform-architecture.md (duplicado - ya existe en esta ubicación)
- 03-platform-architecture.md (duplicado de 02-platform-architecture.md)
- 03-summary.md (archivo duplicado o temporal)
- 04-index.md (archivo duplicado o temporal)

### En 02-product-management/
- 02-roadmap-tasks.md (posible duplicado de roadmap en otro lugar)

### En 03-architecture-and-standards/
- 01-architecture-decision-records.md (archivo duplicado - los ADRs están en subdirectorio)
- 03-configuration-standards.md (duplicado de 05-configuration-standards.md)

## ARCHIVOS EN DIRECTORIO RAÍZ DE DOCS/ QUE SON DUPLICADOS (A ELIMINAR)

### Archivos PascalCase duplicados:
- DeveloperExperienceGuide.md
- DevelopmentLifecycleGuide.md
- DocumentationGuide.md
- DocumentationKnowledgeGuide.md
- DocumentationReviewReport.md
- IA-Agents.md
- IncidentManagementGuide.md
- InnovationManagementGuide.md
- KnowledgeManagementGuide.md
- MonitoringObservabilityGuide.md
- PackagesLibraryGuide.md
- SecurityAccessGuide.md
- SoftwareQualityManagementGuide.md
- TaskManagementGuide.md
- TeamOrganizationGuide.md
- TechnicalDebtManagementGuide.md
- TechnicalGovernanceGuide.md
- TechnicalSustainabilityGuide.md
- TestingQualityGuide.md
- VersioningReleasesGuide.md

### Archivos UPPER_SNAKE_CASE duplicados:
- AI_AGENTS_PROMPTS_GUIDE.md
- DATA_GOVERNANCE_GUIDE.md
- DEPENDENCIES_SECURITY_GUIDE.md
- DEPLOYMENT_OPERATIONS_GUIDE.md
- DEVELOPER_EXPERIENCE_GUIDE.md
- DEVELOPMENT_LIFECYCLE_GUIDE.md
- DOCUMENTATION_GUIDE.md
- DOCUMENTATION_KNOWLEDGE_GUIDE.md
- DOCUMENTATION_REVIEW_REPORT.md
- INCIDENT_MANAGEMENT_GUIDE.md
- INNOVATION_MANAGEMENT_GUIDE.md
- KNOWLEDGE_ARCHITECTURE.md
- KNOWLEDGE_MANAGEMENT_GUIDE.md
- MONITORING_OBSERVABILITY_GUIDE.md
- PACKAGES_LIBRARY_GUIDE.md
- REQUIREMENTS_MIGRATION_CHECKLIST.md
- REQUIREMENTS_MIGRATION_GUIDE.md
- REQUIREMENTS_MIGRATION_PLAN.md
- SECURITY_ACCESS_GUIDE.md
- SOFTWARE_QUALITY_MANAGEMENT_GUIDE.md
- TECHNICAL_DEBT_MANAGEMENT_GUIDE.md
- TECHNICAL_GOVERNANCE_GUIDE.md
- TECHNICAL_SUSTAINABILITY_GUIDE.md
- TESTING_QUALITY_GUIDE.md
- VERSIONING_RELEASES_GUIDE.md

### Archivos temporales o de auditoría:
- CLEANUP_LOG.md
- COMPREHENSIVE_AUDIT.md
- CONFIRMATION_OF_MIGRATION.md
- FINAL_STRUCTURE.md
- ORGANIZATION_PLAN.md

## DIRECTORIOS COMPLETOS A ELIMINAR

### Directorios duplicados o temporales:
- .migration-backup/ (directorio temporal)
- requirements/ (directorio duplicado - contenido ya migrado a 10-requirements/)

## ESTRUCTURA FINAL DEBERÍA SER:

```
docs/
├── 00-meta/
│   ├── 00-diagnostico.md
│   ├── 01-propuesta-reorganizacion.md
│   ├── 02-reorganizacion-completada.md
│   └── FINAL_VERIFICATION.md
│
├── 01-vision-and-fundamentals/
│   ├── 01-product-vision.md
│   ├── 02-platform-fundamentals.md
│   └── 03-platform-architecture.md
│
├── 02-product-management/
│   ├── 01-roadmap.md (renombrar de 02-roadmap-tasks.md)
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

## ACCIONES REQUERIDAS

1. Eliminar todos los archivos duplicados enumerados arriba
2. Eliminar directorios temporales
3. Renombrar archivos que tienen nombres incorrectos
4. Eliminar archivos vacíos o sin valor
5. Verificar que no queden archivos sueltos en el directorio raíz de docs/
6. Confirmar que todos los enlaces internos sigan funcionando
7. Actualizar README.md para reflejar la estructura final

## PRIORIDAD DE LIMPIEZA

### Alta Prioridad (inmediato):
- Eliminar .migration-backup/
- Eliminar requirements/ (directorio duplicado)
- Eliminar archivos temporales de auditoría

### Media Prioridad:
- Eliminar archivos PascalCase duplicados
- Eliminar archivos UPPER_SNAKE_CASE duplicados
- Eliminar archivos duplicados dentro de subdirectorios

### Baja Prioridad:
- Verificar enlaces internos
- Actualizar README.md
- Validar estructura final