# Farutech Cloud Platform

Bienvenido al repositorio principal de **Farutech Cloud Platform**, una plataforma SaaS modular para la creación, operación y distribución de aplicaciones empresariales.

---

## Visión del Proyecto

Farutech Cloud Platform es una plataforma tecnológica diseñada para permitir la creación, operación, distribución y evolución continua de aplicaciones empresariales bajo un modelo SaaS (Software as a Service).

La plataforma tiene como objetivo transformar la manera tradicional de desarrollar software a medida, permitiendo que las soluciones construidas por Farutech puedan:

- ✅ Ser reutilizadas
- ✅ Evolucionar continuamente
- ✅ Ser comercializadas a múltiples organizaciones
- ✅ Mantener separación entre clientes (multi-tenant)
- ✅ Reducir costos de desarrollo y mantenimiento
- ✅ Permitir crecimiento progresivo desde pequeñas empresas hasta clientes empresariales

---

## Estructura del Repositorio

Este repositorio contiene la documentación fundamental del ecosistema Farutech. La estructura completa del ecosistema se divide en múltiples repositorios:

- **cloud-platform**: Plataforma administrativa central
- **website**: Sitio web público (farutech.com)
- **demos**: Demostraciones gratuitas sin persistencia
- **app-pos**: Sistema de punto de venta
- **app-erp**: Sistema ERP empresarial
- **app-hotels**: Gestión hotelera
- **app-restaurants**: Gestión de restaurantes
- **packages-frontend**: Paquetes frontend reutilizables
- **packages-dotnet**: Paquetes backend .NET reutilizables
- **packages-shared-contracts**: Contratos compartidos
- **service-identity**: Servicio de identidad
- **service-billing**: Servicio de facturación
- **worker-platform**: Plataforma de workers en Go
- **documentation**: Documentación técnica y de producto

---

## Documentación Principal (Estructura Numerada)

La documentación ha sido reorganizada con una estructura numérica para facilitar la navegación y el orden de lectura:

### **00 – Meta / Diagnóstico**
- `docs/00-meta/00-diagnostico.md` – Diagnóstico completo de documentación (este archivo)
- `docs/00-meta/01-propuesta-reorganizacion.md` – Propuesta de reorganización y mapeo

### **01 – Visión y Fundamentos**
- `docs/01-vision-and-fundamentals/01-platform-fundamentals.md` – Visión de la plataforma
- `docs/01-vision-and-fundamentals/02-platform-architecture.md` – Arquitectura de la plataforma
- `docs/01-vision-and-fundamentals/03-summary.md` – Resumen ejecutivo
- `docs/01-vision-and-fundamentals/04-index.md` – Índice principal

### **02 – Gestión de Producto**
- `docs/02-product-management/01-epics-and-features.md` – Épicas y features
- `docs/02-product-management/02-roadmap-tasks.md` – Roadmap y tareas
- `docs/02-product-management/03-task-management.md` – Gestión de tareas
- `docs/02-product-management/04-team-organization.md` – Organización de equipos

### **03 – Arquitectura y Estándares Técnicos**
- `docs/03-architecture-and-standards/01-architecture-decision-records.md` – ADRs
- `docs/03-architecture-and-standards/02-engineering-standards.md` – Estándares de ingeniería
- `docs/03-architecture-and-standards/03-configuration-standards.md` – Estándares de configuración
- `docs/03-architecture-and-standards/06-packages-library.md` – Guía de paquetes/librerías
- `docs/03-architecture-and-standards/07-versioning-releases.md` – Versionado y releases
- `docs/03-architecture-and-standards/08-technical-governance.md` – Gobernanza técnica
- `docs/03-architecture-and-standards/09-technical-debt-management.md` – Gestión de deuda técnica
- `docs/03-architecture-and-standards/10-technical-sustainability.md` – Sostenibilidad técnica
- `docs/03-architecture-and-standards/11-data-governance.md` – Gobernanza de datos
- `docs/03-architecture-and-standards/12-knowledge-architecture.md` – Arquitectura del conocimiento

### **04 – Ciclo de Vida de Desarrollo**
- `docs/04-development-lifecycle/01-development-lifecycle.md` – Ciclo de desarrollo
- `docs/04-development-lifecycle/02-deployment-operations.md` – Operaciones de despliegue
- `docs/04-development-lifecycle/03-testing-quality.md` – Pruebas y calidad
- `docs/04-development-lifecycle/04-monitoring-observability.md` – Monitoreo y observabilidad
- `docs/04-development-lifecycle/05-incident-management.md` – Gestión de incidentes
- `docs/04-development-lifecycle/06-software-quality.md` – Calidad de software

### **05 – Seguridad**
- `docs/05-security/01-security-access.md` – Acceso y seguridad
- `docs/05-security/02-dependencies-security.md` – Seguridad de dependencias

### **06 – Experiencia del Desarrollador**
- `docs/06-developer-experience/01-developer-experience.md` – Developer Experience

### **07 – Conocimiento e Innovación**
- `docs/07-knowledge-and-innovation/01-knowledge-management.md` – Gestión del conocimiento
- `docs/07-knowledge-and-innovation/02-innovation-management.md` – Gestión de innovación

### **08 – Documentación**
- `docs/08-documentation/01-documentation-guide.md` – Guía de documentación
- `docs/08-documentation/02-documentation-knowledge.md` – Conocimiento de documentación

### **09 – Agentes de IA**
- `docs/09-ai-agents/01-ai-agents-overview.md` – Visión general de agentes
- `docs/09-ai-agents/02-ai-agents-prompts.md` – Guía de prompts
- `docs/09-ai-agents/03-prompt-master-guide.md` – Prompt Master Guide

### **10 – Requerimientos**
- `docs/10-requirements/00-requirements-summary.md` – Resumen de requerimientos
- `docs/10-requirements/01-requirements-part01.md` … `15-requirements-part15.md` – Partes 1-15
- `docs/10-requirements/16-migration-plan.md` – Plan de migración
- `docs/10-requirements/17-migration-guide.md` – Guía de migración
- `docs/10-requirements/18-migration-checklist.md` – Checklist de migración

### **11 – Plantillas (Templates)**
- `docs/11-templates/01-epic-template.md` – Template de Épica
- `docs/11-templates/02-feature-template.md` – Template de Feature
- `docs/11-templates/03-user-story-template.md` – Template de Historia de Usuario
- `docs/11-templates/04-task-template.md` – Template de Tarea Técnica
- `docs/11-templates/05-adr-template.md` – Template de ADR
- `docs/11-templates/06-guide-template.md` – Template de Guía
- `docs/11-templates/07-requirement-template.md` – Template de Requerimiento

### **Referencia Visual (Externa)**
- `docs/01-reference/visual-reference.md` – Guía de mejores prácticas visuales (referencia a `G:/Mi unidad/Projects/Farutech/BuenasPracticas/`)

---

## Documentos Fundamentales (Enlaces Directos)

- [Resumen de Requerimientos](./docs/10-requirements/00-requirements-summary.md): Resumen ejecutivo de requerimientos
- [Arquitectura de la Plataforma](./docs/01-vision-and-fundamentals/02-platform-architecture.md): Arquitectura técnica detallada
- [Estándares de Ingeniería](./docs/03-architecture-and-standards/02-engineering-standards.md): Guía completa de estándares técnicos
- [Guía de Agentes IA](./docs/09-ai-agents/03-prompt-master-guide.md): Prompts y patrones para agentes

---

## Contribución

Este proyecto sigue una arquitectura de múltiples repositorios (polyrepo) para permitir la autonomía de los equipos de desarrollo. Cada componente tiene su propio repositorio con sus propias pautas de contribución.

---

## Licencia

Por definir