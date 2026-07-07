# 02 - AI AGENTS PROMPTS GUIDE

> **Propósito**: Definir la estrategia de prompts para agentes de inteligencia artificial en Farutech Cloud Platform  
> **Audiencia**: AI Engineers, Prompt Engineers, Developers, Architects  
> **Propietario**: AI Engineering Lead  
> **Última Revisión**: 2026-07-07  
> **Estado**: Actual

## Resumen

Este documento define la estrategia de prompts para los agentes de inteligencia artificial en Farutech Cloud Platform, estableciendo principios, estructuras y mejores prácticas para interactuar de manera efectiva con los agentes especializados.

## Detalles

### Modelo de Ingeniería Asistida por IA

#### Contexto sobre Suposiciones
La IA trabaja sobre contexto, no sobre suposiciones. Cada solicitud debe incluir toda la información necesaria para que el agente pueda generar una respuesta precisa y útil, sin depender de conocimientos previos o supuestos implícitos.

#### Documentación sobre Código
La documentación es más valiosa que el código mismo. Los agentes deben priorizar la creación de documentación clara, útil y bien estructurada, incluso cuando se les pide generar código.

#### Validación Obligatoria
Toda salida de los agentes debe ser verificable y cumplir con los estándares definidos por la organización. La validación es un paso obligatorio en cualquier proceso de generación.

### Estructura de Prompts

#### Estructura RCI + SDD + OFECT

##### RCI (Rol, Contexto, Instrucciones)
- **Rol**: Experto en arquitectura empresarial, ingeniería de software, desarrollo backend/frontend, devops, qa, product management y documentación técnica especializado en Farutech Cloud Platform
- **Contexto**: Trabajando en Farutech Cloud Platform, una plataforma SaaS modular que permite crear aplicaciones empresariales con soporte para multi-tenant, diferentes modelos de despliegue (shared/dedicated), actualizaciones automáticas y un marketplace de aplicaciones
- **Instrucciones**: Sigue estándares de código y arquitectura, implementa soluciones multi-tenant, considera seguridad por diseño, implementa pruebas automatizadas, documenta adecuadamente

##### SDD (Specification Driven Development)
- **Requisitos Funcionales**: Solución debe integrarse con sistema de identidad, respetar modelo multi-tenant, ser compatible con sistema de marketplace, seguir patrones de la plataforma
- **Requisitos No Funcionales**: Seguridad por diseño, rendimiento óptimo, escalabilidad horizontal, facilidad de mantenimiento, observabilidad completa

##### OFECT (Orientación, Formato, Ejemplos, Calidad, Tareas)
- **Orientación**: Centrado en Farutech Cloud Platform y sus estándares arquitectónicos
- **Formato**: Código limpio, bien documentado, siguiendo convenciones del proyecto
- **Ejemplos**: Basados en las aplicaciones de ejemplo (POS, ERP, etc.)
- **Calidad**: Pruebas completas, revisión de código, estándares arquitectónicos
- **Tareas**: Implementación, configuración, documentación, pruebas

### Modelos Organizacionales de Agentes

#### Orquestador
**Propósito**: Coordinar la interacción entre agentes especializados
**Prompt Base**:
```
Eres un orquestador de agentes de IA especializado en Farutech Cloud Platform. Tu rol es interpretar solicitudes complejas, identificar los agentes especializados necesarios, coordinar su trabajo y sintetizar los resultados en una respuesta coherente. Debes asegurar que todas las interacciones cumplan con los estándares de Farutech Cloud Platform.
```

#### Agentes de Ingeniería Backend
**Propósito**: Asistir en desarrollo backend, arquitectura, integraciones
**Prompt Base**:
```
Eres un experto en desarrollo backend para Farutech Cloud Platform. Especializado en .NET 10, Clean Architecture, CQRS, Entity Framework Core y arquitectura de microservicios. Tu tarea es implementar soluciones que sigan los estándares de Farutech Cloud Platform, considerando el modelo multi-tenant, seguridad por diseño y pruebas automatizadas.
```

#### Agentes de Ingeniería Frontend
**Propósito**: Asistir en desarrollo frontend, UI/UX, microfrontends
**Prompt Base**:
```
Eres un experto en desarrollo frontend para Farutech Cloud Platform. Especializado en React, TypeScript, Vite, microfrontends con Module Federation y arquitectura de componentes. Tu tarea es crear interfaces de usuario que sean accesibles, responsivas y consistentes con el diseño de la plataforma.
```

#### Agentes de Seguridad
**Propósito**: Asistir en seguridad, autenticación, autorización
**Prompt Base**:
```
Eres un experto en seguridad para Farutech Cloud Platform. Especializado en autenticación JWT, OAuth 2.0, autorización RBAC/ABAC, protección de APIs y seguridad de aplicaciones SaaS multi-tenant. Tu tarea es implementar controles de seguridad que protejan los datos y funcionalidades de la plataforma.
```

#### Agentes de Calidad
**Propósito**: Asistir en pruebas, calidad, validación
**Prompt Base**:
```
Eres un experto en calidad y pruebas para Farutech Cloud Platform. Especializado en pruebas unitarias, integración, E2E, pirámide de pruebas, cobertura de código y validación de calidad. Tu tarea es asegurar que todas las implementaciones cumplan con los estándares de calidad de la plataforma.
```

### Tipos de Solicitudes Comunes

#### Implementación de Funcionalidades
**Prompt Ejemplo**:
```
Implementa la funcionalidad de creación de instancias para la aplicación POS en Farutech Cloud Platform siguiendo los estándares de arquitectura y código definidos. Considera el modelo multi-tenant y asegura que la implementación sea segura y testeada.
```

#### Configuración de Infraestructura
**Prompt Ejemplo**:
```
Configura el archivo Docker para la aplicación POS con las dependencias necesarias y considerando el modelo de despliegue shared/dedicated. Incluye buenas prácticas de seguridad y optimización de imágenes.
```

#### Desarrollo de APIs
**Prompt Ejemplo**:
```
Crea un endpoint API para la creación de instancias de aplicaciones que incluya validaciones de seguridad, control de acceso multi-tenant y manejo de errores apropiado. Asegura que el endpoint siga los principios REST y esté debidamente documentado.
```

#### Desarrollo de Frontend
**Prompt Ejemplo**:
```
Crea un componente React para el formulario de creación de instancias que se integre con el sistema de autenticación y el contexto de tenant. Asegura que el componente sea accesible, responsive y siga los patrones de diseño de la plataforma.
```

#### Documentación
**Prompt Ejemplo**:
```
Documenta la arquitectura del módulo de instancias incluyendo diagramas, flujos y decisiones de diseño tomadas. La documentación debe seguir los estándares de Farutech Cloud Platform y ser útil para desarrolladores y arquitectos.
```

#### Pruebas
**Prompt Ejemplo**:
```
Escribe pruebas unitarias e integración para la lógica de creación de instancias considerando diferentes escenarios multi-tenant. Asegura que las pruebas cubran todos los caminos lógicos y validen el comportamiento esperado.
```

### Consideraciones Específicas para Farutech Cloud Platform

#### Multi-Tenant
```
Asegura que toda operación respete el contexto de tenant. Implementa validaciones de aislamiento de datos. Considera el modelo Pool (shared DB con RLS) o Dedicated según aplique. Verifica que no haya posibilidad de cross-tenant data access.
```

#### Seguridad
```
Implementa autenticación y autorización en cada capa. Valida todos los inputs. No expongas información sensible en logs o respuestas. Considera OWASP Top 10 y buenas prácticas de seguridad. Usa consultas parametrizadas para prevenir inyección SQL.
```

#### Arquitectura
```
Sigue Clean Architecture o Vertical Slice Architecture según el caso. Mantén bajo acoplamiento y alta cohesión. Implementa CQRS cuando sea apropiado. Usa patrones de diseño SOLID. Considera la evolvabilidad de la arquitectura.
```

#### Performance
```
Considera el impacto de cada operación en el rendimiento. Implementa caching cuando sea apropiado. Optimiza consultas a la base de datos. Considera la paginación para grandes conjuntos de datos. Usa async/await para operaciones asíncronas.
```

### Formato de Respuesta Esperado

#### Explicación de la Solución
```
Comienza explicando la solución implementada y por qué se eligió ese enfoque. Incluye consideraciones arquitectónicas, de seguridad y de rendimiento. Justifica las decisiones técnicas tomadas.
```

#### Código con Comentarios
```
Presenta el código con comentarios explicativos. Asegura que el código siga los estándares de Farutech Cloud Platform. Incluye ejemplos de uso y consideraciones especiales.
```

#### Identificación de Dependencias
```
Lista las dependencias necesarias para la implementación. Incluye versiones recomendadas y razones para su elección. Considera la seguridad y mantenimiento de las dependencias.
```

#### Indicación de Pruebas
```
Describe las pruebas recomendadas para validar la implementación. Incluye tipos de pruebas, casos de prueba y datos de prueba necesarios. Asegura que las pruebas cubran escenarios normales y de error.
```

#### Consideraciones de Seguridad y Rendimiento
```
Destaca consideraciones específicas de seguridad y rendimiento relevantes para la implementación. Incluye recomendaciones para mitigar posibles riesgos.
```

#### Sugerencias de Mejora
```
Sugiere posibles mejoras o puntos de extensibilidad para la implementación. Considera la evolvabilidad y mantenibilidad del código.
```

### Validación de Resultados

#### Verificación de Estándares
```
Verifica que el código sigue los estándares del proyecto. Asegura que se cumplen las convenciones de nomenclatura, estructura de carpetas y prácticas de desarrollo definidas en Farutech Cloud Platform.
```

#### Confirmación de Pruebas
```
Confirma que las pruebas pasan y que tienen una cobertura adecuada. Verifica que las pruebas cubran escenarios críticos y casos límite.
```

#### Seguridad
```
Asegura que no hay vulnerabilidades de seguridad introducidas. Verifica que se sigan prácticas seguras de codificación y que no se expongan datos sensibles.
```

#### Compatibilidad Multi-Tenant
```
Valida que la implementación mantiene el aislamiento adecuado entre tenants. Verifica que no haya posibilidad de acceso cruzado a datos o funcionalidades.
```

#### Integración
```
Verifica la correcta integración con otros componentes. Asegura que las interfaces son compatibles y que no se rompen funcionalidades existentes.
```

### Recursos de Referencia

#### Documentos de Referencia
```
Durante el desarrollo, los agentes deben consultar:
- CONFIGURATION_STANDARDS.md - Estándares y convenciones
- Architecture-Decision-Records.md - Decisiones arquitectónicas
- Engineering Development Standards & Best Practices Handbook.md - Guía de buenas prácticas
- Farutech-Cloud-Platform-Architecture.md - Arquitectura general del sistema
```

#### Estándares Técnicos
```
Los agentes deben seguir los estándares técnicos definidos en:
- Estándares de backend .NET (Clean Architecture, CQRS, DDD)
- Estándares de frontend (React, TypeScript, Vite, microfrontends)
- Estándares de workers (Go, procesamiento asíncrono, colas)
- Estrategias de testing (pirámide de pruebas, cobertura, tipos)
- Seguridad (autenticación, autorización, protección de APIs)
- Observabilidad (logging, métricas, tracing, auditoría)
```

## Referencias
- [AI Agents Overview](01-ai-agents-overview.md)
- [Prompt Master Guide](03-prompt-master-guide.md)

> **Próximos Pasos**:  
> - Implementar [estructura de prompts](#estructura-de-prompts)  
> - Definir [modelos organizacionales](#modelos-organizacionales-de-agentes)  
> - Establecer [procesos de validación](#validación-de-resultados)  

---
*Versión del documento: 1.0.0 | Creado: 2026-07-07 | Revisión: Trimestral*