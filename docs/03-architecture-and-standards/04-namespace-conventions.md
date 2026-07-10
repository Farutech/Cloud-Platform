---
title: "Convenciones de Namespace"
date: 2026-07-07
owner: "architecture-team"
status: "approved"
category: "architecture-and-standards"
tags: ["namespace", "conventions", "organization", "structure"]
related_to: 
  - "03-architecture-and-standards/03-coding-standards.md"
  - "03-architecture-and-standards/02-engineering-standards.md"
  - "03-architecture-and-standards/06-packages-library.md"
  - "11-templates/08-code-structure-template.md"
summary: "Convenciones de namespace para la plataforma Farutech Cloud Platform"
version: "1.0"
---

# Farutech Cloud Platform - Convenciones de Namespace

## Propósito

Este documento establece las convenciones de namespaces para mantener la separación lógica de responsabilidades en la arquitectura de monolito modular de Farutech Cloud Platform, alineada con los principios de Clean Architecture.

## Detalles

### Estructura General de Namespaces

En el monolito modular de Farutech Cloud Platform, los namespaces siguen la siguiente estructura general:

```
WebApi.{Capa}.{AreaFuncional}.{Submodulo}
```

Donde:
- **WebApi**: Nombre raíz del proyecto principal
- **{Capa}**: Capa arquitectónica (Domain, Application, Infrastructure, Presentation)
- **{AreaFuncional}**: Área funcional o feature (Users, Orders, Products, Tenants)
- **{Submodulo}**: Submódulo específico (Services, Models, Commands, Queries)

### Capa de Dominio (Domain)

#### Namespace Base
```
WebApi.Domain
```

#### Convenciones Específicas
- `WebApi.Domain.{AreaFuncional}.Entities` - Entidades de dominio
- `WebApi.Domain.{AreaFuncional}.ValueObjects` - Value Objects
- `WebApi.Domain.{AreaFuncional}.Enums` - Enumeraciones de dominio
- `WebApi.Domain.{AreaFuncional}.Errors` - Errores de dominio
- `WebApi.Domain.{AreaFuncional}.Interfaces` - Interfaces de dominio

#### Ejemplos
```csharp
// Entidades
WebApi.Domain.Users.Entities.User
WebApi.Domain.Orders.Entities.Order
WebApi.Domain.Products.Entities.Product

// Value Objects
WebApi.Domain.Users.ValueObjects.Email
WebApi.Domain.Orders.ValueObjects.Money
WebApi.Domain.Tenants.ValueObjects.TenantId

// Errores
WebApi.Domain.Users.Errors.UserErrors
WebApi.Domain.Orders.Errors.OrderErrors
```

### Capa de Aplicación (Application)

#### Namespace Base
```
WebApi.Application
```

#### Convenciones Específicas
- `WebApi.Application.{AreaFuncional}.Commands` - Comandos CQRS
- `WebApi.Application.{AreaFuncional}.Queries` - Queries CQRS
- `WebApi.Application.{AreaFuncional}.Handlers` - Handlers CQRS
- `WebApi.Application.{AreaFuncional}.Validators` - Validadores FluentValidation
- `WebApi.Application.{AreaFuncional}.Services` - Servicios de aplicación
- `WebApi.Application.{AreaFuncional}.DTOs` - DTOs de aplicación

#### Ejemplos
```csharp
// Comandos
WebApi.Application.Users.Commands.CreateUserCommand
WebApi.Application.Orders.Commands.PlaceOrderCommand

// Queries
WebApi.Application.Users.Queries.GetUserQuery
WebApi.Application.Products.Queries.GetProductsQuery

// Handlers
WebApi.Application.Users.Handlers.CreateUserHandler
WebApi.Application.Orders.Handlers.PlaceOrderHandler

// Validadores
WebApi.Application.Users.Validators.CreateUserValidator
```

### Capa de Persistencia (Persistence)

#### Namespace Base
```
WebApi.Persistence
```

#### Convenciones Específicas
- `WebApi.Persistence.Contexts` - DbContexts
- `WebApi.Persistence.Configurations` - Configuraciones de EF Core
- `WebApi.Persistence.Repositories` - Implementaciones de repositorios
- `WebApi.Persistence.Migrations` - Migraciones de base de datos
- `WebApi.Persistence.Seeds` - Seeds de datos iniciales

#### Ejemplos
```csharp
// DbContext
WebApi.Persistence.Contexts.FarutechDbContext

// Configuraciones
WebApi.Persistence.Configurations.UserConfiguration
WebApi.Persistence.Configurations.OrderConfiguration

// Repositorios
WebApi.Persistence.Repositories.UserRepository
WebApi.Persistence.Repositories.OrderRepository
```

### Capa de Infraestructura (Infrastructure)

#### Namespace Base
```
WebApi.Infrastructure
```

#### Convenciones Específicas
- `WebApi.Infrastructure.Authentication` - Componentes de autenticación
- `WebApi.Infrastructure.Authorization` - Componentes de autorización
- `WebApi.Infrastructure.Services` - Servicios de infraestructura
- `WebApi.Infrastructure.Email` - Componentes de email
- `WebApi.Infrastructure.Caching` - Componentes de caching
- `WebApi.Infrastructure.Logging` - Componentes de logging
- `WebApi.Infrastructure.Security` - Componentes de seguridad

#### Ejemplos
```csharp
// Autenticación
WebApi.Infrastructure.Authentication.JwtService
WebApi.Infrastructure.Authentication.TokenGenerator

// Autorización
WebApi.Infrastructure.Authorization.PermissionChecker
WebApi.Infrastructure.Authorization.RoleService

// Servicios
WebApi.Infrastructure.Services.EmailService
WebApi.Infrastructure.Services.FileStorageService
```

### Capa de Presentación (Presentation)

#### Namespace Base
```
WebApi.Presentation
```

#### Convenciones Específicas
- `WebApi.Presentation.Controllers` - Controladores API
- `WebApi.Presentation.Endpoints` - Minimal APIs
- `WebApi.Presentation.Filters` - Filtros de acción
- `WebApi.Presentation.Middleware` - Middleware personalizado
- `WebApi.Presentation.Models` - Modelos de entrada/salida

#### Ejemplos
```csharp
// Controladores
WebApi.Presentation.Controllers.UsersController
WebApi.Presentation.Controllers.OrdersController

// Minimal APIs
WebApi.Presentation.Endpoints.UserEndpoints
WebApi.Presentation.Endpoints.ProductEndpoints
```

### Convenciones para Features Verticales (Vertical Slice Architecture)

Cuando se implementa Vertical Slice Architecture, los namespaces se organizan por feature:

```
WebApi.Features.{FeatureName}.{Componente}
```

#### Ejemplos
```csharp
// Feature de creación de usuarios
WebApi.Features.CreateUser.Command
WebApi.Features.CreateUser.Handler
WebApi.Features.CreateUser.Validator
WebApi.Features.CreateUser.Endpoint

// Feature de listado de productos
WebApi.Features.ListProducts.Query
WebApi.Features.ListProducts.Handler
WebApi.Features.ListProducts.DTOs
```

### Convenciones para Multi-Tenancy

Todos los componentes relacionados con multi-tenancy deben incluir el concepto en sus namespaces:

```csharp
// Servicios de tenant
WebApi.Infrastructure.Tenancy.TenantService
WebApi.Infrastructure.Tenancy.TenantProvider

// Filtros de seguridad por tenant
WebApi.Presentation.Filters.TenantAuthorizationFilter

// Repositorios multi-tenant
WebApi.Persistence.Repositories.MultiTenantRepository
```

### Convenciones para Seguridad

Componentes relacionados con seguridad deben estar en namespaces específicos:

```csharp
// Validación de permisos
WebApi.Application.Security.Permissions.PermissionValidator

// Servicios de seguridad
WebApi.Infrastructure.Security.PasswordHasher
WebApi.Infrastructure.Security.AuditLogger
```

## Referencias
- [Architecture Decision Records](01-architecture-decision-records/)
- [Engineering Standards](02-engineering-standards.md)
- [Coding Standards](03-coding-standards.md)

> **Próximos Pasos**:  
> - Aplicar [namespaces en el código](../../04-development-lifecycle/)  
> - Validar [dependencias entre capas](02-engineering-standards.md#principios-de-diseño)  

---
*Versión del documento: 1.0.0 | Creado: 2026-07-07 | Revisión: Trimestral*