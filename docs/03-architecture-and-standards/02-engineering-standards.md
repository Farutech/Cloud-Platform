# Farutech Cloud Platform - Estándares de Ingeniería

## 1. Introducción

Este handbook define los estándares técnicos, principios de ingeniería y mejores prácticas para el desarrollo en Farutech Cloud Platform. El objetivo es garantizar consistencia, calidad y mantenibilidad en todo el código del ecosistema.

## 2. Principios Fundamentales de Ingeniería

### 2.1 Calidad Integrada
La calidad no es una fase posterior al desarrollo, sino un componente integral de cada tarea. Cada línea de código debe cumplir con estándares de calidad desde su creación.

### 2.2 Simplicidad antes que Complejidad
Ante múltiples soluciones, se prefiere la más simple que resuelva el problema de forma efectiva. La simplicidad mejora la mantenibilidad, comprensión y fiabilidad.

### 2.3 Código Limpio
El código debe ser legible, comprensible y bien estructurado. Se seguirán principios como SOLID, DRY, KISS y YAGNI.

### 2.4 Seguridad por Diseño
La seguridad debe considerarse desde la fase de diseño, no como una característica agregada después. Cada componente debe implementar medidas de seguridad apropiadas.

### 2.5 Pruebas Automatizadas
Todo código funcional debe incluir pruebas automatizadas adecuadas. La cobertura de pruebas es fundamental para garantizar calidad y permitir evolución segura.

## 3. Estándares de Backend (.NET 10)

### 3.1 Arquitectura
- Seguir principios de Clean Architecture
- Implementar Domain, Application, Infrastructure y Presentation layers
- Utilizar CQRS para separación de comandos y queries (implementación nativa vía inyección de dependencias, sin MediatR — ver ADR-012)
- Aplicar Domain Driven Design para modelado de dominios complejos

### 3.2 C# Standards
- Usar `var` cuando el tipo sea obvio
- Usar expresiones lambda cuando sea conciso
- Implementar interfaces explícitamente cuando sea necesario
- Usar async/await para operaciones asíncronas
- Implementar disposables correctamente
- Usar attributes para validación y documentación

### 3.3 ASP.NET Core
- Implementar APIs RESTful siguiendo convenciones
- Usar FluentValidation para validación de modelos
- Implementar manejo de errores global
- Usar logging estructurado con Serilog
- Implementar autenticación y autorización basada en JWT y claims

### 3.4 Entity Framework Core
- Usar Code First approach
- Implementar migraciones de forma controlada
- Utilizar raw SQL solo cuando sea necesario
- Implementar patrón Repository cuando aporte valor
- Usar async methods para operaciones de base de datos

## 4. Estándares de Frontend (React/TypeScript/Vite)

### 4.1 TypeScript
- Usar interfaces en lugar de tipos cuando sea posible
- Usar generics para componentes reutilizables
- Implementar manejo de errores tipado
- Usar Zod para validación de esquemas
- Evitar `any` salvo en casos excepcionales justificados

### 4.2 React
- Usar functional components con hooks
- Implementar memoización cuando sea necesario
- Usar hooks personalizados para lógica compartida
- Implementar manejo de errores global con Error Boundary
- Seguir principios de componentes atómicos

### 4.3 Estructura de Proyectos
- Usar enfoque basado en features para organización
- Separar componentes, hooks, utils y types lógicamente
- Usar barrel exports para simplificar imports
- Mantener bajo acoplamiento entre módulos

## 5. Estándares de Workers (Go)

### 5.1 Convenciones
- Usar error handling explícito
- Implementar graceful shutdown
- Usar context para cancelación
- Implementar worker pools para tareas concurrentes
- Usar estructuras de datos thread-safe cuando sea necesario

### 5.2 Estructura
- Separar handlers, models y utils lógicamente
- Implementar logging estructurado
- Usar configuración externa para parámetros
- Implementar métricas y monitoreo

## 6. Estrategia de Pruebas

### 6.1 Pirámide de Pruebas
- 70% pruebas unitarias
- 20% pruebas de integración
- 10% pruebas end-to-end

### 6.2 Pruebas Unitarias
- Cobertura mínima del 80%
- Probar todos los caminos lógicos
- Usar mocks solo cuando sea necesario
- Probar casos límite y de error
- Usar xUnit o NUnit para .NET, Jest para frontend

### 6.3 Pruebas de Integración
- Usar TestContainers para bases de datos
- Probar integraciones con servicios externos
- Validar aislamiento multi-tenant
- Probar flujos completos de negocio

### 6.4 Pruebas E2E
- Probar flujos críticos de usuario
- Usar Playwright o Cypress
- Probar en diferentes navegadores
- Automatizar en CI/CD

## 7. Seguridad

### 7.1 Autenticación
- JWT con firma asimétrica
- Refresh tokens con rotación
- Tiempos de expiración apropiados
- Protección contra CSRF

### 7.2 Autorización
- Validación de tenant en cada request
- Control de acceso basado en roles
- Validación de permisos por recurso
- Auditoría de operaciones sensibles

### 7.3 Datos
- Encriptar datos sensibles en reposo
- Validar y sanitizar entradas
- Prevenir inyección SQL
- Usar consultas parametrizadas

## 8. Observabilidad

### 8.1 Logging
- Logs estructurados en JSON
- Niveles apropiados (debug, info, warn, error)
- Contexto de tenant en logs
- No loggear datos sensibles

### 8.2 Métricas
- Tiempos de respuesta
- Errores por tipo
- Uso de recursos
- Métricas de negocio

### 8.3 Tracing
- Tracing distribuido
- Correlación de requests
- Identificación de cuellos de botella
- Seguimiento de flujos

## 9. DevOps y CI/CD

### 9.1 Validación de Estándares
- Validación de estándares en PR
- Ejecución de pruebas automáticas
- Análisis de seguridad
- Validación de cobertura de pruebas

### 9.2 Despliegue
- Deployment automático a staging
- Approval manual para producción
- Rollback automático en fallos
- Validación post-deployment

## 10. Documentación

### 10.1 Código
- Documentar APIs con comentarios XML
- Usar regiones para organizar código
- Comentarios solo cuando sea necesario
- Nombrar variables y funciones de forma clara

### 10.2 Proyectos
- README con propósito y ejecución
- ARCHITECTURE con diseño y decisiones
- CHANGELOG con historial de cambios
- DOCUMENTATION con guías y tutoriales

## 11. Revisión de Código

### 11.1 Requisitos
- Al menos una aprobación
- Pruebas pasando
- Análisis de seguridad limpio
- Cumplimiento de estándares

### 11.2 Checklist
- [ ] Funcionalidad implementada correctamente
- [ ] Pruebas cubriendo escenarios
- [ ] Cumple con estándares de código
- [ ] Consideraciones de seguridad aplicadas
- [ ] Documentación actualizada
- [ ] No introduce deuda técnica

## 12. Prompt Engineering para Desarrollo Asistido por IA

### 12.1 Estructura de Prompt RCI + SDD + OFECT
- **RCI**: Rol, Contexto, Instrucciones
- **SDD**: Specification Driven Development
- **OFACT**: Orientación, Formato, Ejemplos, Calidad, Tareas

### 12.2 Consideraciones para Farutech
- Implementar considerando modelo multi-tenant
- Asegurar seguridad por diseño
- Considerar rendimiento y escalabilidad
- Implementar pruebas automatizadas
- Documentar adecuadamente