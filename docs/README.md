# Farutech Cloud Platform - Documentación Organizada

Bienvenido a la documentación organizada de Farutech Cloud Platform. Esta estructura ha sido creada siguiendo los principios de Clean Architecture en un solo proyecto (Modular Monolith) con nomenclatura consistente y alineada con estándares profesionales.

## Estructura de Directorios

```
docs/
├── 00-meta/                    # Documentos meta de la organización
│   ├── 00-diagnostico.md      # Diagnóstico inicial de la estructura
│   ├── 01-propuesta-reorganizacion.md  # Propuesta de reorganización
│   └── 02-reorganizacion-completada.md # Informe de reorganización completada
│
├── 01-vision-and-fundamentals/ # Visión y fundamentos del producto
│   ├── 01-product-vision.md   # Visión del producto
│   ├── 02-platform-fundamentals.md  # Fundamentos de la plataforma
│   └── 03-platform-architecture.md  # Arquitectura de la plataforma
│
├── 02-product-management/     # Gestión del producto
│   ├── 01-roadmap.md          # Hoja de ruta
│   ├── 02-epics-and-features.md  # Épicas y características
│   ├── 03-task-management.md  # Gestión de tareas
│   └── 04-team-organization.md # Organización del equipo
│
├── 03-architecture-and-standards/ # Arquitectura y estándares
│   ├── 01-architecture-decision-records/  # Registros de decisiones arquitectónicas
│   │   ├── 001-modular-monolith.md
│   │   ├── 002-postgresql-database.md
│   │   ├── 003-multi-tenant-model.md
│   │   ├── 004-microfrontends-architecture.md
│   │   ├── 005-backend-dotnet10.md
│   │   └── 006-react-frontend.md
│   ├── 02-engineering-standards.md  # Estándares de ingeniería
│   ├── 03-coding-standards.md # Estándares de codificación
│   ├── 04-namespace-conventions.md  # Convenciones de namespace
│   ├── 05-configuration-standards.md  # Estándares de configuración
│   ├── 06-packages-library.md # Biblioteca de paquetes
│   ├── 07-versioning-releases.md  # Versionado y releases
│   ├── 08-technical-governance.md  # Gobierno técnico
│   ├── 09-technical-debt-management.md  # Gestión de deuda técnica
│   ├── 10-technical-sustainability.md  # Sostenibilidad técnica
│   ├── 11-data-governance.md  # Gobierno de datos
│   └── 12-knowledge-architecture.md  # Arquitectura del conocimiento
│
├── 04-development-lifecycle/  # Ciclo de vida de desarrollo
│   ├── 01-development-lifecycle.md  # Ciclo de vida de desarrollo
│   ├── 02-deployment-operations.md  # Operaciones de despliegue
│   ├── 03-testing-quality.md  # Calidad de pruebas
│   ├── 04-monitoring-observability.md  # Monitoreo y observabilidad
│   ├── 05-incident-management.md  # Gestión de incidentes
│   └── 06-software-quality.md # Calidad de software
│
├── 05-security/               # Seguridad
│   ├── 01-security-access.md  # Acceso y seguridad
│   └── 02-dependencies-security.md  # Seguridad de dependencias
│
├── 06-developer-experience/   # Experiencia del desarrollador
│   └── 01-developer-experience.md  # Experiencia del desarrollador
│
├── 07-knowledge-and-innovation/ # Conocimiento e innovación
│   ├── 01-knowledge-management.md  # Gestión del conocimiento
│   └── 02-innovation-management.md  # Gestión de innovación
│
├── 08-documentation/          # Documentación
│   ├── 01-documentation-guide.md  # Guía de documentación
│   └── 02-documentation-knowledge.md  # Conocimiento documental
│
├── 09-ai-agents/              # Agentes de IA
│   ├── 01-ai-agents-overview.md  # Visión general de agentes de IA
│   ├── 02-ai-agents-prompts.md  # Prompts de agentes de IA
│   └── 03-prompt-master-guide.md  # Guía maestra de prompts
│
├── 10-requirements/           # Requerimientos
│   ├── 00-requirements-summary.md  # Resumen de requerimientos
│   ├── 01-requirements-part01.md  # Parte 01: Visión y arquitectura
│   ├── 02-requirements-part02.md  # Parte 02: Organización técnica
│   ├── 03-requirements-part03.md  # Parte 03: Estándares de ingeniería
│   ├── 04-requirements-part04.md  # Parte 04: Modelo operativo
│   ├── 05-requirements-part05.md  # Parte 05: Ingeniería asistida por IA
│   ├── 06-requirements-part06.md  # Parte 06: Arquitectura del conocimiento
│   ├── 07-requirements-part07.md  # Parte 07: Gobierno arquitectónico
│   ├── 08-requirements-part08.md  # Parte 08: Modelo de operación
│   ├── 09-requirements-part09.md  # Parte 09: Kit fundacional
│   ├── 10-requirements-part10.md  # Parte 10: Modelo organizacional
│   ├── 11-requirements-part11.md  # Parte 11: Kit fundacional duplicado
│   ├── 12-migration-plan.md   # Plan de migración
│   ├── 13-migration-guide.md  # Guía de migración
│   └── 14-migration-checklist.md  # Checklist de migración
│
└── 11-templates/              # Plantillas
    ├── 01-epic-template.md    # Plantilla de épicas
    ├── 02-feature-template.md # Plantilla de características
    ├── 03-user-story-template.md  # Plantilla de historias de usuario
    ├── 04-task-template.md    # Plantilla de tareas
    ├── 05-adr-template.md     # Plantilla de ADRs
    ├── 06-guide-template.md   # Plantilla de guías
    ├── 07-requirement-template.md  # Plantilla de requerimientos
    └── 08-code-structure-template.md  # Plantilla de estructura de código
```

## Nomenclatura

La estructura sigue las siguientes convenciones:

- **Prefijos numéricos**: `01-`, `02-`, etc. para orden jerárquico
- **kebab-case**: Todos los nombres en minúsculas con guiones medios
- **Extensión .md**: Para todos los documentos Markdown
- **No se usan**: PascalCase, UPPER_SNAKE_CASE ni espacios

## Propósito

Esta estructura fue creada para:

1. Eliminar duplicados y archivos desorganizados
2. Alinear con los principios de Clean Architecture single-project
3. Facilitar la navegación y búsqueda de información
4. Establecer un estándar profesional de documentación
5. Soportar el modelo de Modular Monolith y Vertical Slice Architecture

## Migración

Los archivos antiguos han sido migrados y organizados siguiendo esta estructura. Los documentos originales en formatos PascalCase y UPPER_SNAKE_CASE han sido consolidados y renombrados para seguir las convenciones estándar.

## Uso

Para encontrar documentación específica:

1. Identifique la categoría principal (arquitectura, desarrollo, seguridad, etc.)
2. Navegue al directorio correspondiente
3. Busque el documento específico usando el número de prefijo o el nombre descriptivo

Para crear nuevos documentos, utilice las plantillas disponibles en `11-templates/`.