# Farutech Cloud Platform - Estándares de Codificación

> **Propósito**: Establecer los estándares de codificación para todos los componentes de Farutech Cloud Platform  
> **Audiencia**: Desarrolladores backend, frontend y workers  
> **Propietario**: Lead Architect  
> **Última Revisión**: 2026-07-07  
> **Estado**: Actual

## Resumen

Este documento establece los estándares de codificación que deben seguirse en todos los componentes de Farutech Cloud Platform. Incluye convenciones para .NET, TypeScript/JavaScript, y Go, así como principios generales de calidad de código.

## Detalles

### .NET / C# Standards

#### Convenciones de Nomenclatura
- **Clases**: PascalCase (`UserService`, `OrderRepository`)
- **Variables locales y parámetros**: camelCase (`userName`, `orderId`)
- **Constantes**: PascalCase (`MaxRetries`, `DefaultTimeout`)
- **Campos privados**: camelCase con underscore (`_logger`, `_cache`)
- **Interfaces**: I + PascalCase (`IUserService`, `IEmailProvider`)

#### Buenas Prácticas
- Usar `var` cuando el tipo sea obvio: `var user = new User();`
- Usar expresiones lambda cuando sea conciso: `users.Where(u => u.IsActive)`
- Implementar interfaces explícitamente cuando sea necesario para evitar ambigüedad
- Usar async/await para operaciones asíncronas: `public async Task<User> GetUserAsync(int id)`
- Implementar disposables correctamente con `using` statements o `await using`
- Usar attributes para validación y documentación

#### Principios de Diseño
- Seguir principios SOLID
- Implementar DRY (Don't Repeat Yourself)
- Aplicar KISS (Keep It Simple, Stupid)
- Evitar YAGNI (You Aren't Gonna Need It)
- Separar responsabilidades claramente

### TypeScript/JavaScript Standards

#### Convenciones de Nomenclatura
- **Variables, funciones, métodos**: camelCase (`getUser`, `isValid`)
- **Clases, interfaces, tipos**: PascalCase (`UserService`, `UserInterface`)
- **Archivos**: kebab-case (`user-service.ts`, `utils.ts`)
- **Constantes**: UPPER_SNAKE_CASE (`MAX_RETRIES`, `DEFAULT_TIMEOUT`)

#### Buenas Prácticas
- Usar interfaces en lugar de tipos cuando sea posible
- Usar generics para componentes y funciones reutilizables
- Implementar memoización con `useMemo` y `useCallback` cuando sea necesario
- Usar hooks personalizados para lógica compartida
- Implementar manejo de errores global
- Usar Zod para validación de esquemas
- Evitar `any` salvo en casos excepcionales justificados

#### React Specific
- Usar functional components con hooks
- Separar lógica de presentación
- Usar barrel exports para simplificar imports
- Implementar Error Boundaries para manejo de errores
- Seguir principios de componentes atómicos

### Go Standards

#### Convenciones de Nomenclatura
- **Funciones, variables, estructuras, interfaces**: CamelCase (`GetUser`, `userRepository`)
- **Exportados**: Mayúscula inicial (`GetUser`, `UserRepository`)
- **No exportados**: Minúscula inicial (`getUser`, `userRepository`)
- **Archivos**: snake_case (`user_repository.go`, `utils.go`)

#### Buenas Prácticas
- Usar error handling explícito: `if err != nil { return err }`
- Implementar graceful shutdown
- Usar context para cancelación y timeouts
- Implementar worker pools para tareas concurrentes
- Usar estructuras de datos thread-safe cuando sea necesario
- Documentar funciones públicas con comentarios

### Principios Generales de Calidad de Código

#### Legibilidad
- Nombres de variables y funciones descriptivos
- Funciones cortas con una sola responsabilidad
- Comentarios solo cuando sea necesario para explicar el "por qué"
- Evitar código duplicado

#### Mantenibilidad
- Separar responsabilidades claramente
- Usar abstracciones apropiadas
- Implementar pruebas automatizadas
- Seguir principios de diseño arquitectónico
- Documentar decisiones importantes

#### Rendimiento
- Considerar el impacto de cada operación en el rendimiento
- Implementar caching cuando sea apropiado
- Optimizar consultas a la base de datos
- Considerar la paginación para grandes conjuntos de datos
- Evitar operaciones costosas en bucles

## Referencias
- [Engineering Standards](02-engineering-standards.md)
- [Architecture Decision Records](01-architecture-decision-records/)
- [Configuration Standards](05-configuration-standards.md)

> **Próximos Pasos**:  
> - Aplicar [convenciones en el código](../../04-development-lifecycle/)  
> - Configurar [herramientas de análisis de código](02-engineering-standards.md#devops-y-cicd)  

---
*Versión del documento: 1.0.0 | Creado: 2026-07-07 | Revisión: Trimestral*