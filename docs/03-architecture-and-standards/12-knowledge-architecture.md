# 12 - KNOWLEDGE ARCHITECTURE

> **Propósito**: Establecer la arquitectura de conocimiento para Farutech Cloud Platform como Fuente Única de la Verdad  
> **Audiencia**: Todos los stakeholders (ejecutivos, arquitectos, desarrolladores, QA, DevOps)  
> **Propietario**: Architecture Office  
> **Última Revisión**: 2026-07-07  
> **Estado**: Actual

## Resumen

Este documento establece una arquitectura de conocimiento unificada que sirve como Fuente Única de la Verdad (Single Source of Truth) para Farutech Cloud Platform. La arquitectura eliminará fragmentación, garantizará trazabilidad y proporcionará una ruta de aprendizaje estructurada para todos los stakeholders.

## Detalles

### Objetivo

Establecer un sistema unificado de conocimiento que sirva como Fuente Única de la Verdad para Farutech Cloud Platform. Este sistema permitirá una toma de decisiones informada durante todo el ciclo de vida de la plataforma, desde nuevos desarrolladores hasta liderazgo ejecutivo.

### Principios

La documentación del sistema seguirá estos principios inmutables:

- **Fuente Única de la Verdad**: Un lugar canónico para cada artefacto de conocimiento
- **Documentación como Código**: Control de versiones, revisiones por PR, validación CI
- **Conocimiento Primero**: Contenido organizado por dominio de conocimiento, no por tipo de archivo
- **Cero Duplicación**: Sin información repetida en múltiples documentos
- **Trazabilidad Completa**: Cada decisión se enlaza a requisitos e implementación
- **Mantenibilidad por Diseño**: Estructura modular que permite actualizaciones independientes
- **Evolvibilidad**: Arquitectura que soporta crecimiento sin cambios estructurales
- **Navegación Contextual**: Rutas claras entre conceptos relacionados
- **Conciencia de Audiencia**: Contenido adaptado a lectores específicos
- **Conocimiento Versionado**: Contexto histórico preservado manteniendo la verdad actual

### Arquitectura Documental Propuesta

```
docs/
├── foundation/                # Principios y visión fundamentales
│   ├── vision.md
│   ├── principles.md
│   └── glossary.md
├── product/                   # Lo que es la plataforma
│   ├── overview.md
│   ├── capabilities.md
│   └── marketplace.md
├── architecture/              # Cómo está construida
│   ├── decisions/             # ADRs con versionado
│   │   ├── 001-modular-monolith.md
│   │   └── ...
│   ├── reference/             # Diagramas y modelos
│   └── evolution/             # Decisiones históricas
├── engineering/               # Estándares técnicos
│   ├── standards/             # Estándares base
│   │   ├── coding.md
│   │   ├── testing.md
│   │   └── security.md
│   ├── patterns/              # Soluciones reutilizables
│   └── quality/               # Puertas de calidad
├── development/               # Cómo construir
│   ├── workflow.md
│   ├── tools.md
│   └── contribution.md
├── operations/                # Cómo operarla
│   ├── deployment.md
│   ├── monitoring.md
│   └── troubleshooting.md
├── governance/                # Cómo se toman decisiones
│   ├── decision-process.md
│   ├── review-cycles.md
│   └── compliance.md
├── ai/                        # Conocimiento específico de IA
│   ├── prompt-engineering.md
│   ├── agent-specifications.md
│   └── validation-process.md
├── roadmap/                   # Dirección futura
│   ├── strategic.md
│   ├── epics.md
│   └── version-history.md
├── templates/                 # Estructuras de documentos estándar
│   ├── adr-template.md
│   └── decision-record.md
├── assets/                    # Componentes reutilizables
│   ├── diagrams/
│   └── code-snippets/
└── index.md                   # Navegación raíz
```

#### Innovaciones Clave:
- **Versionado de Decisiones**: ADRs con versionado semántico y rutas de degradación claras
- **Límites de Conocimiento**: Separación estricta entre producto (qué) e ingeniería (cómo)
- **Navegación Contextual**: Cada documento incluye secciones "Próximos Pasos" y "Conocimiento Relacionado"
- **Metadatos de Propiedad**: Cada documento especifica mantenedor primario y frecuencia de revisión
- **Divulgación Progresiva**: Temas complejos usan documentación en capas (resumen → detalles → referencia)

### Taxonomía Oficial

| Categoría | Propósito | Ejemplos |
|----------|-----------|----------|
| **Foundation** | Identidad y principios base | Visión, Principios, Glosario |
| **Product** | Lo que entrega la plataforma | Capacidades, Marketplace, Casos de Uso |
| **Architecture** | Decisiones estructurales de diseño | ADRs, Arquitectura de Referencia, Evolución |
| **Engineering** | Estándares de implementación técnica | Estándares de Codificación, Patrones, Calidad |
| **Development** | Proceso de construcción | Flujo de Trabajo, Herramientas, Contribución |
| **Operations** | Ejecución de la plataforma | Despliegue, Monitoreo, Resolución de Problemas |
| **Governance** | Procesos de toma de decisiones | Proceso de Decisiones, Ciclos de Revisión, Cumplimiento |
| **AI** | Conocimiento específico de inteligencia artificial | Prompt Engineering, Especificaciones de Agente |
| **Roadmap** | Dirección futura | Plan Estratégico, Épicas, Historial de Versiones |
| **Templates** | Estructuras de documentos estándar | Plantilla ADR, Registro de Decisión |
| **Assets** | Componentes reutilizables | Diagramas, Fragmentos de Código |
| **Historical** | Histórico valioso pero obsoleto | ADRs Suplantados, Documentación Heredada |

### Jerarquía Documental

```
RAÍZ: docs/index.md (El Mapa de Conocimiento)
│
├── Nivel 1: Foundation & Product (Comprensión Estratégica)
│   ├── ¿Qué problema estamos resolviendo?
│   ├── ¿Por qué existe esta plataforma?
│   └── ¿Qué capacidades entrega?
│
├── Nivel 2: Architecture & Engineering (Comprensión Técnica)
│   ├── ¿Cómo está estructurada?
│   ├── ¿Qué decisiones se tomaron?
│   └── ¿Qué estándares deben seguirse?
│
├── Nivel 3: Development & Operations (Comprensión de Implementación)
│   ├── ¿Cómo se construye?
│   ├── ¿Cómo se despliega?
│   └── ¿Cómo se mantiene?
│
├── Nivel 4: Governance & AI (Comprensión Especializada)
│   ├── ¿Cómo se toman decisiones?
│   └── ¿Cómo se integra la IA?
│
└── Nivel 5: Roadmap & Historical (Comprensión Contextual)
    ├── ¿A dónde va?
    └── ¿Por qué se tomaron decisiones pasadas?
```

### Orden Oficial de Lectura

#### Ruta para Nuevo Miembro del Equipo:
1. `foundation/vision.md` → 2. `product/overview.md` → 3. `foundation/principles.md` → 4. `architecture/decisions/001-modular-monolith.md` → 5. `engineering/standards/coding.md` → 6. `development/workflow.md`

#### Ruta de Revisión de Arquitectura:
1. `architecture/decisions/index.md` → 2. Filtrar por dominio (ej: `security/`) → 3. Revisar ADRs actuales → 4. Verificar `evolution/` para contexto histórico

#### Ruta para Especialista en IA:
1. `ai/prompt-engineering.md` → 2. `engineering/standards/ai-validation.md` → 3. `governance/ai-review-process.md`

#### Todas las rutas incluyen:
- Documentos fundamentales obligatorios (Nivel 1)
- Documentos técnicos contextuales (Nivel 2-3)
- Conocimiento especializado según necesidad (Nivel 4-5)
- Rutas de "salida" claras a recursos de implementación

### Matriz Documental

| Documento | Propósito | Audiencia | Propietario | Estado | Categoría | Prioridad | Dependencias | Relacionado |
|----------|-----------|-----------|-------------|--------|----------|-----------|--------------|-------------|
| [vision.md](foundation/vision.md) | Define propósito de la plataforma | Ejecutivos, Todos los Equipos | CTO | Actual | Foundation | Crítica | Ninguna | principles.md |
| [001-modular-monolith.md](architecture/decisions/001-modular-monolith.md) | Documenta elección de arquitectura base | Arquitectos, Desarrolladores | Lead Architect | Actual | Architecture | Crítica | Ninguna | 002-technology-choice.md |
| [coding.md](engineering/standards/coding.md) | Define convenciones de codificación | Desarrolladores | Engineering Manager | Actual | Engineering | Alta | Ninguna | testing.md, security.md |
| [prompt-engineering.md](ai/prompt-engineering.md) | Guía para desarrollo asistido por IA | Desarrolladores | AI Lead | Actual | AI | Media | coding.md | ai-validation.md |

*(Matriz completa incluiría los 37 documentos mapeados a la nueva estructura)*

### Convenciones

#### Nomenclatura de Archivos:
- **kebab-case** para todos los archivos de documentación (`prompt-engineering.md`)
- **Versionado ADRs**: `001-titulo-documento-v1.2.0.md`
- **Sin espacios ni caracteres especiales**
- **Todo en minúsculas** (ni UPPER_SNAKE_CASE ni PascalCase)

#### Estructura de Directorios:
- **Profundidad máxima de 3 niveles** para cualquier documento
- **Directorios de categoría nunca en plural**
- **[index.md](file://d:\repo\Farutech\finanzas_personales\node_modules/react-router\docs\index.md)** requerido en todos los directorios

#### Estructura de Documentos:
```markdown
# [Título del Documento]

> **Propósito**: Una-sentencia-descripción-del-propósito-del-documento  
> **Audiencia**: Audiencia-objetivo ([@username](mailto:))  
> **Propietario**: Mantenedor-primario  
> **Última Revisión**: AAAA-MM-DD  
> **Estado**: Actual/Obsoleto/Suplantado  

## Resumen
Explicación concisa de conceptos principales...

## Detalles
Información detallada organizada en secciones lógicas...

## Referencias
- [Documento Relacionado](ruta/al/documento.md)
- [Recurso Externo](https://ejemplo.com)

> **Próximos Pasos**:  
> - [Siguiente paso con enlace](ruta)  
> - [Ruta alternativa para diferentes audiencias](ruta)  
```

#### Navegación:
- Cada documento incluye enlaces "Anterior" y "Siguiente" en pie de página
- Breadcrumbs muestran ruta completa al documento
- Barra lateral "Ir a" para documentos largos

### Plantilla Oficial

```markdown
# [Título del Documento]

> **Propósito**: [Descripción de una oración]  
> **Audiencia**: [Lectores primarios]  
> **Propietario**: [Mantenedor]  
> **Última Revisión**: [AAAA-MM-DD]  
> **Estado**: [Actual/Obsoleto/Suplantado]  

## Resumen
[2-3 párrafos resumiendo los puntos clave]

## Detalles
### [Título de Sección]
[Explicación detallada con ejemplos]

#### Ejemplo
```language
// Ejemplo de código o configuración
```

## Referencias
- [Documento Relacionado](ruta)
- [Recurso Externo](url)

> **Próximos Pasos**:  
> - [Siguiente paso con enlace]  
> - [Ruta alternativa para diferentes audiencias]  

---
*Versión del documento: 1.0.0 | Creado: [AAAA-MM-DD] | Revisión: Trimestral*
```

### Estrategia de Crecimiento

#### Fase 1 (0-3 meses): Establecer estructura base con documentación obligatoria para todas las nuevas funcionalidades

#### Fase 2 (3-6 meses): Implementar validación automatizada (verificación de enlaces, referencias rotas, verificación de propiedad)

#### Fase 3 (6-12 meses): Introducir métricas de salud del conocimiento (puntuación de completitud, índice de frescura, analíticas de uso)

#### Fase 4 (12+ meses): Construir sistema de documentación autocalendara con mantenimiento asistido por IA

#### Principios de Crecimiento:
- Todas las nuevas funcionalidades requieren documento de PR correspondiente
- Deuda documental rastreada junto con deuda técnica
- Auditorías trimestrales de conocimiento para identificar lagunas
- Rotación del rol de "Embajador de Documentación" entre miembros del equipo
- Nuevos documentos deben enlazar al menos a dos artefactos de conocimiento existentes

Esta arquitectura crea un sistema de documentación vivo que escala con la plataforma, donde el conocimiento se trata con la misma rigurosidad que el código. La estructura propuesta elimina la fragmentación actual al tiempo que proporciona rutas claras para que todos los stakeholders comprendan la plataforma a su nivel requerido de profundidad.

## Referencias
- [Documentation Guide](../../08-documentation/01-documentation-guide.md)
- [Engineering Standards](02-engineering-standards.md)

> **Próximos Pasos**:  
> - Implementar [estructura propuesta](#arquitectura-documental-propuesta)  
> - Migrar [documentos existentes](../00-meta/02-reorganizacion-completada.md)  
> - Configurar [validación automatizada](../../08-documentation/02-documentation-knowledge.md)  

---
*Versión del documento: 1.0.0 | Creado: 2026-07-07 | Revisión: Trimestral*