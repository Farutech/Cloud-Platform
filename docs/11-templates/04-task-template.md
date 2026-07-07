# 04 - TASK TEMPLATE

> **Propósito**: Plantilla para crear tareas técnicas en Farutech Cloud Platform  
> **Audiencia**: Developers, Tech Leads, DevOps Engineers  
> **Propietario**: Tech Lead  
> **Última Revisión**: 2026-07-07  
> **Estado**: Actual

## Resumen

Plantilla para crear tareas técnicas que sigan los estándares de Farutech Cloud Platform, asegurando que cada tarea tenga un propósito técnico claro, pasos definidos y consideraciones de implementación alineadas con Clean Architecture single-project.

## Detalles

### Descripción de la Tarea

#### Título de la Tarea
Breve descripción de la tarea en formato de título claro y descriptivo.

#### Descripción Detallada
Descripción completa de la tarea técnica, incluyendo:
- Contexto técnico
- Problema que resuelve
- Solución propuesta
- Relación con historias de usuario/features

### Objetivos Técnicos

#### Objetivo 1
- [ ] Resultado específico 1
- [ ] Resultado específico 2
- [ ] Resultado específico 3

#### Objetivo 2
- [ ] Resultado específico 1
- [ ] Resultado específico 2
- [ ] Resultado específico 3

### Estructura de Código Esperada (Clean Architecture Single-Project)

```
src/
├── Features/
│   └── [FeatureName]/
│       ├── Commands/
│       │   └── [Action][Entity]Command.cs
│       ├── Queries/
│       │   └── [Action][Entity]Query.cs
│       ├── DTOs/
│       │   └── [Entity]Dto.cs
│       ├── Validators/
│       │   └── [Action][Entity]Validator.cs
│       ├── Handlers/
│       │   └── [Action][Entity]Handler.cs
│       └── [Entity]Endpoints.cs
├── Domain/
│   ├── Entities/
│   │   └── [Entity].cs
│   ├── Interfaces/
│   │   └── I[Entity]Repository.cs
│   └── Exceptions/
│       └── [Entity]NotFoundException.cs
├── Infrastructure/
│   └── Persistence/
│       ├── Configurations/
│       │   └── [Entity]Configuration.cs
│       └── Repositories/
│           └── [Entity]Repository.cs
└── WebApi/
    └── Controllers/
        └── [Entity]Controller.cs
```

### Pasos de Implementación

#### Paso 1: Preparación
- [ ] Crear branch desde main
- [ ] Configurar entorno de desarrollo
- [ ] Actualizar dependencias si es necesario

#### Paso 2: Desarrollo Backend
- [ ] Crear entidad de dominio
- [ ] Crear interfaces de repositorio
- [ ] Implementar comando y manejador
- [ ] Implementar consulta y manejador
- [ ] Crear DTOs y validadores
- [ ] Implementar lógica de negocio

#### Paso 3: Desarrollo Frontend
- [ ] Crear componentes de interfaz
- [ ] Implementar lógica de presentación
- [ ] Integrar con APIs
- [ ] Validar UX/UI

#### Paso 4: Pruebas
- [ ] Implementar pruebas unitarias
- [ ] Implementar pruebas de integración
- [ ] Validar funcionalidad
- [ ] Verificar seguridad

#### Paso 5: Validación y Despliegue
- [ ] Revisión de código
- [ ] Validación de estándares
- [ ] Pruebas automatizadas
- [ ] Despliegue a staging
- [ ] Validación final

### Consideraciones Técnicas

#### Arquitectura
- [ ] Seguir principios de Clean Architecture
- [ ] Implementar CQRS si aplica
- [ ] Usar patrones SOLID
- [ ] Mantener bajo acoplamiento

#### Seguridad
- [ ] Validar autenticación
- [ ] Verificar autorización
- [ ] Validar entradas
- [ ] Proteger contra inyecciones

#### Multi-Tenancy
- [ ] Implementar contexto de tenant
- [ ] Validar aislamiento de datos
- [ ] Verificar RLS (Row Level Security)

#### Performance
- [ ] Optimizar consultas
- [ ] Implementar caching si aplica
- [ ] Validar tiempos de respuesta
- [ ] Considerar paginación

### Validación de Calidad

#### Estándares de Código
- [ ] Cumplimiento de convenciones
- [ ] Comentarios apropiados
- [ ] Manejo de errores adecuado
- [ ] Seguridad implementada

#### Pruebas
- [ ] Pruebas unitarias implementadas
- [ ] Cobertura mínima del 80%
- [ ] Pruebas de integración pasando
- [ ] Validación de funcionalidad

#### Seguridad
- [ ] Validación de seguridad estática
- [ ] Validación de seguridad dinámica
- [ ] Verificación de prácticas seguras
- [ ] Validación de acceso

### Recursos Requeridos

#### Herramientas
- [ ] IDE configurado
- [ ] Runtime instalado
- [ ] Base de datos local
- [ ] Contenedores si aplica

#### Dependencias
- [ ] Bibliotecas requeridas
- [ ] Paquetes necesarios
- [ ] Servicios externos
- [ ] APIs de terceros

### Métricas de Éxito

#### Técnica
- [ ] Código cumple estándares
- [ ] Pruebas pasando
- [ ] Sin vulnerabilidades
- [ ] Buen rendimiento

#### Funcional
- [ ] Requisitos cumplidos
- [ ] Criterios de aceptación validados
- [ ] Usuario final satisfecho
- [ ] Integración exitosa

### Riesgos y Mitigaciones

#### Riesgo 1
- **Probabilidad**: [Alta/Media/Baja]
- **Impacto**: [Alto/Medio/Bajo]
- **Mitigación**: Acción preventiva
- **Dueño**: Responsable

#### Riesgo 2
- **Probabilidad**: [Alta/Media/Baja]
- **Impacto**: [Alto/Medio/Bajo]
- **Mitigación**: Acción preventiva
- **Dueño**: Responsable

### Validación Final

#### Checklist Técnico
- [ ] Código revisado por pares
- [ ] Estándares cumplidos
- [ ] Pruebas automatizadas pasando
- [ ] Seguridad verificada
- [ ] Performance validada
- [ ] Multi-tenancy implementado

#### Checklist de Negocio
- [ ] Criterios de aceptación cumplidos
- [ ] Valor de negocio entregado
- [ ] Usuario final validado
- [ ] Documentación actualizada

## Referencias
- [User Story Template](03-user-story-template.md)
- [Feature Template](02-feature-template.md)

> **Próximos Pasos**:  
> - Implementar [pasos de desarrollo](#pasos-de-implementación)  
> - Validar [métricas de éxito](#métricas-de-éxito)  
> - Completar [validación final](#validación-final)  

---
*Versión del documento: 1.0.0 | Creado: 2026-07-07 | Revisión: Trimestral*