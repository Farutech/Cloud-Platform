# Farutech Cloud Platform
## Resumen de Documentación

---

### **Marco de Gobernanza Estratégica**

*Esta documentación se alinea con el marco de gobernanza a largo plazo definido en el documento fundacional de 4275 líneas, que establece los cimientos para los próximos 10 años de evolución de la plataforma.*

**Principios Fundamentales:**
- **Producto-Ingeniería Alineados:** Toda documentación refleja mecanismos de colaboración
- **Estrategia Multi-Repositorio:** Estructura clara de repositorios y responsabilidades
- **Definición Unificada de Hecho (DoD):** Criterios consistentes en todo el ecosistema
- **Gestión de Componentes Reutilizables:** Estrategia clara para librerías y paquetes
- **Líneas Base Estratégicas:** Seguridad, despliegue, testing y monitoreo estandarizados

---

## Documentación Principal

### [1. Documento Fundacional Completo](./Farutech-Cloud-Platform-Fundamentals.md)
Visión completa del proyecto, arquitectura conceptual, modelo de negocio, estructura del ecosistema, seguridad, modelo de despliegue, estrategia de repositorios, equipo y organización, ciclo de vida del desarrollo y evolución futura.

### [2. Arquitectura de la Plataforma](./Farutech-Cloud-Platform-Architecture.md)
Documentación detallada de la arquitectura técnica, decisiones arquitectónicas clave y estándares técnicos.

### [3. Épicas y Features](./Epics-And-Features.md)
Documentación detallada de épicas principales, features, historias de usuario, tareas técnicas y definiciones de listo para el desarrollo ágil.

### [4. Agentes de IA](./IA-Agents.md)
Arquitectura de agentes especializados, prompts maestros RCI+SDD+OFECT, flujo de trabajo con agentes y prompts específicos por especialidad.

### [5. Roadmap y Tareas](./Roadmap-Tasks.md)
Fases de desarrollo (MVP, Multi-Tenant, Facturación, Escalabilidad), tareas prioritarias por fase, tareas técnicas generales, desarrollo de agentes de IA, métricas de éxito y riesgos con mitigaciones.

---

## Documentación Técnica

### [1. Decisiones Arquitectónicas](./Architecture-Decision-Records.md)
Registro de decisiones arquitectónicas clave (ADRs) desde la elección de arquitectura modular hasta infraestructura inicial, incluyendo tecnologías backend/frontend, base de datos, modelo de aislamiento multi-tenant y estrategia de repositorios.

### [2. Estándares de Desarrollo](./Engineering Development Standards & Best Practices Handbook.md)
Guía completa de estándares técnicos, principios de ingeniería, arquitectura SaaS multi-tenant, estándares de backend .NET, frontend React, workers Go, estrategias de testing, seguridad DevOps y prompt engineering para desarrollo asistido por IA.

### [3. Guía de Estándares y Convenciones](../CONFIGURATION_STANDARDS.md)
Convenciones de nomenclatura, estructura de proyectos, estándares de código, pruebas, seguridad, observabilidad, despliegue, documentación y revisión de código.

### [4. Guía de Prompt Maestro](../PROMPT_MASTER_GUIDE.md)
Estructura RCI+SDD+OFECT para trabajar con Qoder, tipos de tareas comunes, consideraciones específicas para Farutech Cloud Platform y formato de respuesta esperado.

---

## Guías Especializadas

### **Gestión Estratégica**

### [1. Guía de Organización de Equipos y Repositorios](./TEAM_ORGANIZATION_GUIDE.md)
Estructura de repositorios, modelos de equipo, principios de autonomía y comunicación entre equipos.

### [2. Guía del Ciclo de Vida del Desarrollo](./DEVELOPMENT_LIFECYCLE_GUIDE.md)
Jerarquía de trabajo, Definition of Ready/Definition of Done, fases del ciclo de vida y métricas de éxito.

### [3. Guía de Gestión de la Innovación](./INNOVATION_MANAGEMENT_GUIDE.md)
Principios, procesos, métricas y roles para la gestión integral de la innovación organizacional.

### [4. Guía de Gestión de la Gobernanza Técnica](./TECHNICAL_GOVERNANCE_GUIDE.md)
Principios, estructuras, procesos y métricas para la gestión integral de la gobernanza técnica.

### [5. Guía de Gestión de la Sostenibilidad Técnica](./TECHNICAL_SUSTAINABILITY_GUIDE.md)
Principios, indicadores, procesos y roles para la gestión integral de la sostenibilidad técnica.

### **Operaciones y Calidad**

### [6. Guía de Estrategia de Seguridad y Acceso](./SECURITY_ACCESS_GUIDE.md)
Modelo de identidad y acceso, autenticación, autorización, protección de datos y operaciones sensibles.

### [7. Guía de Estrategia de Despliegue y Operación](./DEPLOYMENT_OPERATIONS_GUIDE.md)
Infraestructura inicial, migración a Azure, estrategia de despliegue, monitoreo y gestión de incidentes.

### [8. Guía de Gestión de Incidentes](./INCIDENT_MANAGEMENT_GUIDE.md)
Procedimientos, roles, responsabilidades y métricas para la gestión de incidentes.

### [9. Guía de Estrategia de Pruebas y Calidad](./TESTING_QUALITY_GUIDE.md)
Pirámide de pruebas, tipos especializados, cobertura, proceso de pruebas y métricas de calidad.

### [10. Guía de Gestión de la Calidad del Software](./SOFTWARE_QUALITY_MANAGEMENT_GUIDE.md)
Principios, procesos, métricas y roles para la gestión integral de la calidad del software.

### **Componentes y Dependencias**

### [11. Guía de Estrategia de Paquetes y Bibliotecas Reutilizables](./PACKAGES_LIBRARY_GUIDE.md)
Estructura de paquetes, convenciones de nombres, proceso de creación, versionamiento y gestión de dependencias.

### [12. Guía de Estrategia de Gestión de Versiones y Releases](./VERSIONING_RELEASES_GUIDE.md)
Estrategia de versionamiento, tipos de releases, proceso de release, gestión por componente y métricas.

### [13. Guía de Estrategia de Gestión de Dependencias y Seguridad](./DEPENDENCIES_SECURITY_GUIDE.md)
Gestión de dependencias, capas de seguridad, prácticas de seguridad y métricas.

### [14. Guía de Gestión de la Deuda Técnica](./TECHNICAL_DEBT_MANAGEMENT_GUIDE.md)
Principios, procesos, métricas y roles para la gestión proactiva de la deuda técnica.

### **Conocimiento e IA**

### [15. Guía de Estrategia de Documentación y Conocimiento](./DOCUMENTATION_KNOWLEDGE_GUIDE.md)
Tipos de documentación, estructura, proceso de documentación, herramientas y métricas.

### [16. Guía de Gestión del Conocimiento](./KNOWLEDGE_MANAGEMENT_GUIDE.md)
Principios, procesos, métricas y roles para la gestión integral del conocimiento organizacional.

### [17. Guía de Estrategia de Agentes de IA y Prompts](./AI_AGENTS_PROMPTS_GUIDE.md)
Arquitectura de agentes, estructura de prompts, tipos comunes, proceso de trabajo y estándares de calidad.

### [18. Guía de Gestión de la Experiencia del Desarrollador](./DEVELOPER_EXPERIENCE_GUIDE.md)
Principios, procesos, métricas y roles para la gestión integral de la experiencia del desarrollador.

### **Migración y Revisión**

### [19. Guía de Migración de Requisitos](./REQUIREMENTS_MIGRATION_GUIDE.md)
Plan detallado para migrar el contenido del directorio requiments/ a la estructura documental oficial.

### [20. Resumen del Directorio requiments/](./requiments/REQUIREMENTS_SUMMARY.md)
Estado actual del directorio requiments/, contenido de los archivos y cronograma de migración.

### [21. Plan de Acción para Migración de Requisitos](./REQUIREMENTS_MIGRATION_PLAN.md)
Cronograma detallado, responsabilidades, métricas de éxito y mitigaciones de riesgos para la migración completa.

### [22. Reporte Final de Revisión Documental](./DOCUMENTATION_REVIEW_REPORT.md)
Resumen ejecutivo, hallazgos principales, estado actual y recomendaciones finales para la documentación.

### [23. Checklist para Migración de Requisitos](./REQUIREMENTS_MIGRATION_CHECKLIST.md)
Checklist detallado para guiar a los equipos de desarrollo durante la migración de requisitos.

### **Gobernanza de Datos**

### [24. Guía de Gobernanza de Datos](./DATA_GOVERNANCE_GUIDE.md)
Principios, estructuras, procesos y métricas para la gestión integral de la gobernanza de datos.

---

## Guía de Organización

### [1. Guía de Documentación](./DOCUMENTATION_GUIDE.md)
Estructura de la documentación, categorías, estándares y convenciones para mantener la documentación organizada y coherente.

---

## Alineación con el Marco de Gobernanza a Largo Plazo

Esta documentación completa y organizada refleja fielmente el marco de gobernanza a largo plazo definido en el documento fundacional de 4275 líneas. Cada documento contribuye a los siguientes pilares estratégicos:

- **Alineación Producto-Ingeniería:** Las guías de organización de equipos y ciclo de vida del desarrollo establecen mecanismos claros de colaboración
- **Estrategia Multi-Repositorio:** La guía de organización de equipos y repositorios define la estructura clara de responsabilidades
- **Definición Unificada de Hecho (DoD):** La guía del ciclo de vida del desarrollo establece criterios consistentes
- **Gestión de Componentes Reutilizables:** Las guías de paquetes y bibliotecas reutilizables y gestión de versiones proporcionan una estrategia clara
- **Líneas Base Estratégicas:** Las guías de seguridad, despliegue, testing y monitoreo establecen estándares estandarizados

---

## Última Actualización
2026-07-02