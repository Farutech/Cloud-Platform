# 01 - EPIC TEMPLATE

> **Propósito**: Plantilla para crear épicas en Farutech Cloud Platform  
> **Audiencia**: Product Managers, Tech Leads, Developers  
> **Propietario**: Product Manager  
> **Última Revisión**: 2026-07-07  
> **Estado**: Actual

## Resumen

Plantilla para crear épicas que sigan los estándares de Farutech Cloud Platform, asegurando que cada épica tenga un propósito claro, objetivos medibles y criterios de éxito definidos.

## Detalles

### Descripción del Epic

**Como [tipo de usuario]**, necesito [característica deseada] **para que** [beneficio esperado].

#### Título del Epic
Breve descripción del epic en formato de título claro y descriptivo.

#### Descripción Detallada
Descripción completa del epic, incluyendo:
- Contexto del epic
- Problema que resuelve
- Valor que aporta
- Relación con otros componentes

#### Objetivos del Epic
- [ ] Objetivo 1 medible
- [ ] Objetivo 2 medible
- [ ] Objetivo 3 medible

#### Criterios de Éxito
- [ ] Criterio 1 verificable
- [ ] Criterio 2 verificable
- [ ] Criterio 3 verificable

### Alcance del Epic

#### Funcionalidades Incluidas
- [ ] Funcionalidad 1
- [ ] Funcionalidad 2
- [ ] Funcionalidad 3

#### Funcionalidades Excluidas
- [ ] Funcionalidad excluida 1
- [ ] Funcionalidad excluida 2

#### Dependencias
- [ ] Dependencia 1
- [ ] Dependencia 2
- [ ] Dependencia 3

### Requisitos Técnicos

#### Requisitos Funcionales
- [ ] Requisito funcional 1
- [ ] Requisito funcional 2
- [ ] Requisito funcional 3

#### Requisitos No Funcionales
- [ ] Requisito no funcional 1
- [ ] Requisito no funcional 2
- [ ] Requisito no funcional 3

### Consideraciones de Arquitectura

#### Patrones Relevantes
- [ ] Patrón arquitectónico 1
- [ ] Patrón arquitectónico 2

#### Decisiones de Diseño
- [ ] Decisión de diseño 1
- [ ] Decisión de diseño 2

#### Impacto en la Arquitectura
- [ ] Componente afectado 1
- [ ] Componente afectado 2

### Estructura de Código Esperada (Clean Architecture Single-Project)

```
src/
├── Features/
│   └── [EpicName]/
│       ├── Commands/
│       │   ├── Create/
│       │   ├── Update/
│       │   └── Delete/
│       ├── Queries/
│       │   ├── Get/
│       │   └── List/
│       ├── DTOs/
│       ├── Validators/
│       └── Handlers/
├── Domain/
│   ├── Entities/
│   ├── ValueObjects/
│   ├── Interfaces/
│   └── Exceptions/
├── Application/
│   ├── Services/
│   ├── Common/
│   └── Interfaces/
├── Infrastructure/
│   ├── Persistence/
│   ├── External/
│   └── Services/
└── WebApi/
    ├── Controllers/
    ├── Endpoints/
    └── Middleware/
```

### Seguridad y Acceso

#### Consideraciones de Seguridad
- [ ] Autenticación requerida
- [ ] Autorización específica
- [ ] Validación de entradas
- [ ] Protección contra inyecciones

#### Niveles de Acceso
- [ ] Nivel de acceso 1
- [ ] Nivel de acceso 2

### Pruebas y Calidad

#### Tipos de Pruebas Requeridas
- [ ] Pruebas unitarias
- [ ] Pruebas de integración
- [ ] Pruebas de contrato
- [ ] Pruebas E2E

#### Métricas de Calidad
- [ ] Cobertura mínima del 80%
- [ ] Sin vulnerabilidades críticas
- [ ] Cumplimiento de estándares

### Planificación

#### Estimación de Esfuerzo
- [ ] Sprint 1: Tareas iniciales
- [ ] Sprint 2: Desarrollo principal
- [ ] Sprint 3: Pruebas y validación

#### Recursos Requeridos
- [ ] Desarrollador backend
- [ ] Desarrollador frontend
- [ ] QA Engineer
- [ ] DevOps Engineer

### Validación y Aceptación

#### Criterios de Aceptación
- [ ] Criterio 1 verificable por QA
- [ ] Criterio 2 verificable por usuario
- [ ] Criterio 3 verificable por sistema

#### Validación Técnica
- [ ] Revisión de arquitectura
- [ ] Validación de seguridad
- [ ] Pruebas automatizadas pasando

## Referencias
- [Feature Template](02-feature-template.md)
- [User Story Template](03-user-story-template.md)

> **Próximos Pasos**:  
> - Crear [features](02-feature-template.md) relacionadas  
> - Definir [user stories](03-user-story-template.md)  
> - Planificar [sprints](../04-development-lifecycle/01-development-lifecycle.md)  

---
*Versión del documento: 1.0.0 | Creado: 2026-07-07 | Revisión: Trimestral*