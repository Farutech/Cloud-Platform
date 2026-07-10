# Farutech Cloud Platform
## Guía de Estrategia de Agentes de IA y Prompts

---

## Visión General

La estrategia de agentes de IA está diseñada para aprovechar la inteligencia artificial como un socio técnico que amplifica la capacidad de los equipos humanos. Los agentes no reemplazan a los ingenieros, sino que los potencian para enfocarse en problemas de mayor valor.

### Principios Clave

- **Asistencia, no sustitución:** Los agentes son asistentes técnicos
- **Especialización:** Cada agente tiene dominio específico
- **Orquestación:** Un agente líder coordina el trabajo especializado
- **Responsabilidad humana:** Todos los resultados requieren revisión humana
- **Seguridad por diseño:** Ningún agente tiene acceso directo a producción

---

## Arquitectura de Agentes

```
User → Orchestrator Agent → Specialist Agents
                          ↓
                  [Backend Agent]
                  [Frontend Agent]
                  [DevOps Agent]
                  [QA Agent]
                  [Security Agent]
                  [Documentation Agent]
```
$$
### Agentes Especializados

| Agente | Responsabilidad | Tecnologías |
|--------|-----------------|-------------|
| **Orchestrator** | Interpretar tareas, asignar a especialistas, validar resultados | Prompt Engineering, RCI+SDD+OFECT |
| **Backend** | .NET, C#, APIs, PostgreSQL, Entity Framework | .NET 10, PostgreSQL, EF Core |
| **Frontend** | React, TypeScript, Vite, Microfrontends | React, TypeScript, Vite |
| **DevOps** | CI/CD, Docker, Kubernetes, Azure | GitHub Actions, Docker, Azure |
| **QA** | Pruebas unitarias, integración, E2E, seguridad | Jest, xUnit, Playwright, OWASP ZAP |
| **Security** | Análisis de vulnerabilidades, cumplimiento, cifrado | SonarQube, OWASP Top 10, NIST |
| **Documentation** | Generación de documentación técnica, ADRs, guías | Markdown, Mermaid, OpenAPI |

---

## Estructura de Prompts

### RCI + SDD + OFECT

#### RCI (Rol, Contexto, Instrucciones)

**Rol:** Experto en [área específica]

**Contexto:** Trabajas en Farutech Cloud Platform con [tecnologías específicas]

**Instrucciones:** 
- Sigue los estándares definidos en [documentación]
- Implementa principios de [principios relevantes]
- Considera [consideraciones específicas]

#### SDD (Specification Driven Development)

**Requisitos Funcionales:**
- [Lista de requisitos]

**Requisitos No Funcionales:**
- [Lista de requisitos]

#### OFECT (Orientación, Formato, Ejemplos, Calidad, Tareas)

**Orientación:** [Enfoque específico]
**Formato:** [Formato esperado]
**Ejemplos:** [Ejemplos relevantes]
**Calidad:** [Criterios de calidad]
**Tareas:** [Acciones específicas]

---

## Tipos de Prompts Comunes

### 1. Implementación de Funcionalidades

**Prompt Ejemplo:**
"Implementa la funcionalidad de creación de instancias para la aplicación POS en Farutech Cloud Platform siguiendo los estándares de arquitectura y código definidos."

### 2. Configuración de Infraestructura

**Prompt Ejemplo:**
"Configura el archivo Docker para la aplicación POS con las dependencias necesarias y considerando el modelo de despliegue shared/dedicated."

### 3. Desarrollo de APIs

**Prompt Ejemplo:**
"Crea un endpoint API para la creación de instancias de aplicaciones que incluya validaciones de seguridad, control de acceso multi-tenant y manejo de errores apropiado."

### 4. Desarrollo de Frontend

**Prompt Ejemplo:**
"Crea un componente React para el formulario de creación de instancias que se integre con el sistema de autenticación y el contexto de tenant."

### 5. Documentación

**Prompt Ejemplo:**
"Documenta la arquitectura del módulo de instancias incluyendo diagramas, flujos y decisiones de diseño tomadas."

### 6. Pruebas

**Prompt Ejemplo:**
"Escribe pruebas unitarias e integración para la lógica de creación de instancias considerando diferentes escenarios multi-tenant."

---

## Proceso de Trabajo con Agentes

### 1. Definición de Tarea
- Usuario define tarea clara y específica
- Proporciona contexto relevante
- Especifica expectativas de resultado

### 2. Asignación por Orchestrator
- Orchestrator interpreta la tarea
- Asigna a agente especializado más adecuado
- Proporciona contexto adicional si es necesario

### 3. Ejecución por Especialista
- Agente especializado implementa solución
- Sigue estándares y convenciones
- Genera código, pruebas y documentación

### 4. Validación y Revisión
- Orchestrator valida resultados
- Verifica cumplimiento de estándares
- Confirma que todos los requisitos están cubiertos

### 5. Entrega al Usuario
- Resultados presentados en formato claro
- Explicación de la solución
- Código con comentarios explicativos
- Dependencias identificadas
- Pruebas recomendadas
- Consideraciones de seguridad y rendimiento

---

## Estándares de Calidad para Agentes

✅ **Precisión técnica:** Solución correcta y funcional
✅ **Cumplimiento de estándares:** Sigue CONFIGURATION_STANDARDS.md
✅ **Seguridad:** Sin vulnerabilidades conocidas
✅ **Documentación:** Código bien comentado y documentado
✅ **Pruebas:** Incluye pruebas adecuadas
✅ **Rendimiento:** Considera impacto en performance
✅ **Mantenibilidad:** Código limpio y bien estructurado

---

## Evolución Futura

### Agentes Autónomos

- Capacidad para ejecutar tareas completas sin intervención humana
- Integración con sistemas de monitoreo para corrección automática
- Aprendizaje continuo basado en feedback

### Gestión Inteligente

- Selección automática de agentes según complejidad de la tarea
- Optimización de recursos computacionales
- Priorización dinámica de tareas

### Integración Avanzada

- Con herramientas de desarrollo (VS Code extensions)
- Con sistemas de gestión de proyectos (Jira, Linear)
- Con repositorios de código (GitHub, GitLab)

---

## Documentación de Referencia

- [CONFIGURATION_STANDARDS.md](../CONFIGURATION_STANDARDS.md): Estándares de configuración
- [Engineering Development Standards & Best Practices Handbook.md](./Engineering Development Standards & Best Practices Handbook.md): Guía técnica
- [Architecture-Decision-Records.md](./Architecture-Decision-Records.md): Decisiones arquitectónicas
- [Farutech-Cloud-Platform-Architecture.md](./Farutech-Cloud-Platform-Architecture.md): Arquitectura general