# 08 - CODE STRUCTURE TEMPLATE

> **Propósito**: Plantilla para estructura de código alineada con Clean Architecture single-project en Farutech Cloud Platform  
> **Audiencia**: Developers, Tech Leads, Architects  
> **Propietario**: Lead Architect  
> **Última Revisión**: 2026-07-07  
> **Estado**: Actual

## Resumen

Plantilla para estructura de código que sigue los principios de Clean Architecture en un solo proyecto (Modular Monolith), alineada con los estándares de Farutech Cloud Platform y el enfoque de Vertical Slice Architecture.

## Detalles

### Estructura de Proyecto (Modular Monolith)

```
src/
├── Farutech.WebApi/                    # Capa de presentación
│   ├── Controllers/                    # Controladores MVC/WebAPI
│   │   ├── IdentityController.cs
│   │   ├── TenantsController.cs
│   │   └── [Feature]Controller.cs
│   ├── Endpoints/                      # Minimal APIs
│   │   ├── IdentityEndpoints.cs
│   │   ├── TenantEndpoints.cs
│   │   └── [Feature]Endpoints.cs
│   ├── Middleware/                     # Middleware personalizados
│   │   ├── TenantMiddleware.cs
│   │   ├── SecurityMiddleware.cs
│   │   └── CorrelationMiddleware.cs
│   ├── Filters/                        # Filtros de acción
│   │   ├── ValidationFilter.cs
│   │   └── ExceptionFilter.cs
│   ├── Extensions/                     # Extensiones de servicios
│   │   ├── ServiceCollectionExtensions.cs
│   │   └── ApplicationBuilderExtensions.cs
│   ├── Properties/                     # Configuración de proyecto
│   ├── wwwroot/                        # Recursos estáticos
│   ├── Program.cs                      # Punto de entrada
│   └── appsettings.json                # Configuración de aplicación
│
├── Farutech.Application/               # Capa de aplicación (CQRS)
│   ├── Features/                       # Características organizadas verticalmente
│   │   ├── Identity/
│   │   │   ├── Commands/
│   │   │   │   ├── CreateUser/
│   │   │   │   │   ├── CreateUserCommand.cs
│   │   │   │   │   ├── CreateUserCommandHandler.cs
│   │   │   │   │   └── CreateUserValidator.cs
│   │   │   │   ├── UpdateUser/
│   │   │   │   │   ├── UpdateUserCommand.cs
│   │   │   │   │   ├── UpdateUserCommandHandler.cs
│   │   │   │   │   └── UpdateUserValidator.cs
│   │   │   │   └── DeleteUser/
│   │   │   │       ├── DeleteUserCommand.cs
│   │   │   │       ├── DeleteUserCommandHandler.cs
│   │   │   │       └── DeleteUserValidator.cs
│   │   │   ├── Queries/
│   │   │   │   ├── GetUser/
│   │   │   │   │   ├── GetUserQuery.cs
│   │   │   │   │   └── GetUserQueryHandler.cs
│   │   │   │   └── GetUsers/
│   │   │   │       ├── GetUsersQuery.cs
│   │   │   │       └── GetUsersQueryHandler.cs
│   │   │   ├── DTOs/
│   │   │   │   ├── UserDto.cs
│   │   │   │   ├── CreateUserRequest.cs
│   │   │   │   └── UpdateUserRequest.cs
│   │   │   └── Services/
│   │   │       └── IUserService.cs
│   │   │
│   │   ├── Tenants/
│   │   │   ├── Commands/
│   │   │   ├── Queries/
│   │   │   ├── DTOs/
│   │   │   └── Services/
│   │   │
│   │   └── [FeatureName]/
│   │       ├── Commands/
│   │       ├── Queries/
│   │       ├── DTOs/
│   │       └── Services/
│   │
│   ├── Common/                         # Código común de aplicación
│   │   ├── Behaviors/                  # Comportamientos de MediatR
│   │   │   ├── ValidationBehavior.cs
│   │   │   ├── LoggingBehavior.cs
│   │   │   └── TransactionBehavior.cs
│   │   ├── Exceptions/                 # Excepciones de aplicación
│   │   │   ├── ValidationException.cs
│   │   │   └── BusinessException.cs
│   │   ├── Interfaces/                 # Interfaces comunes
│   │   │   ├── ICommand.cs
│   │   │   ├── IQuery.cs
│   │   │   └── IRequestHandler.cs
│   │   └── Models/                     # Modelos comunes
│   │       ├── Result.cs
│   │       ├── PagedResult.cs
│   │       └── ValidationError.cs
│   │
│   ├── Extensions/                     # Extensiones de aplicación
│   │   └── MediatorExtensions.cs
│   └── Farutech.Application.csproj     # Archivo de proyecto
│
├── Farutech.Domain/                    # Capa de dominio
│   ├── Entities/                       # Entidades de dominio
│   │   ├── User.cs
│   │   ├── Tenant.cs
│   │   └── [EntityName].cs
│   ├── ValueObjects/                   # Objetos de valor
│   │   ├── EmailAddress.cs
│   │   ├── Money.cs
│   │   └── [ValueObjectName].cs
│   ├── Enums/                          # Enumeraciones de dominio
│   │   ├── UserRole.cs
│   │   └── [EnumName].cs
│   ├── Interfaces/                     # Interfaces de dominio
│   │   ├── Repositories/
│   │   │   ├── IUserRepository.cs
│   │   │   └── ITenantRepository.cs
│   │   ├── Services/
│   │   │   ├── IEmailService.cs
│   │   │   └── IPasswordHasher.cs
│   │   └── Specifications/
│   │       └── IUserSpecification.cs
│   ├── Exceptions/                     # Excepciones de dominio
│   │   ├── UserNotFoundException.cs
│   │   ├── BusinessRuleValidationException.cs
│   │   └── [DomainException].cs
│   ├── Events/                         # Eventos de dominio
│   │   ├── UserCreatedEvent.cs
│   │   └── [DomainEvent].cs
│   └── Farutech.Domain.csproj          # Archivo de proyecto
│
├── Farutech.Infrastructure/            # Capa de infraestructura
│   ├── Persistence/                    # Persistencia de datos
│   │   ├── Configurations/             # Configuraciones de EF
│   │   │   ├── UserConfiguration.cs
│   │   │   ├── TenantConfiguration.cs
│   │   │   └── [Entity]Configuration.cs
│   │   ├── Repositories/               # Implementaciones de repositorios
│   │   │   ├── UserRepository.cs
│   │   │   ├── TenantRepository.cs
│   │   │   └── [Entity]Repository.cs
│   │   ├── Migrations/                 # Migraciones de base de datos
│   │   ├── Interceptors/               # Interceptores de EF
│   │   │   ├── TenantInterceptor.cs
│   │   │   └── SaveChangesInterceptor.cs
│   │   ├── ApplicationDbContext.cs     # Contexto de base de datos
│   │   └── ApplicationDbContextSeed.cs # Semillas de datos
│   │
│   ├── ExternalServices/               # Servicios externos
│   │   ├── Email/
│   │   │   ├── SmtpEmailService.cs
│   │   │   └── IEmailService.cs
│   │   ├── Payment/
│   │   │   ├── StripePaymentService.cs
│   │   │   └── IPaymentService.cs
│   │   └── [ServiceCategory]/
│   │
│   ├── Services/                       # Servicios de infraestructura
│   │   ├── DateTimeService.cs
│   │   ├── PasswordHasher.cs
│   │   └── [InfrastructureService].cs
│   │
│   ├── Security/                       # Componentes de seguridad
│   │   ├── JwtTokenGenerator.cs
│   │   ├── PasswordHasher.cs
│   │   └── [SecurityComponent].cs
│   │
│   ├── Extensions/                     # Extensiones de infraestructura
│   │   └── ServiceCollectionExtensions.cs
│   └── Farutech.Infrastructure.csproj  # Archivo de proyecto
│
└── Farutech.Tests/                     # Proyectos de pruebas
    ├── Farutech.UnitTests/             # Pruebas unitarias
    │   ├── Features/
    │   │   ├── Identity/
    │   │   │   ├── Commands/
    │   │   │   └── Queries/
    │   │   └── [Feature]/
    │   ├── Domain/
    │   └── Common/
    ├── Farutech.IntegrationTests/      # Pruebas de integración
    │   ├── Persistence/
    │   ├── Features/
    │   └── Fixtures/
    └── Farutech.EndToEndTests/         # Pruebas end-to-end
        ├── Pages/
        ├── Steps/
        └── Fixtures/
```

### Principios de Organización

#### Vertical Slice Architecture
- Agrupación por características/functionales en lugar de por capas técnicas
- Cada feature contiene todos los componentes necesarios para su funcionamiento
- Reducción de dependencias entre componentes

#### Clean Architecture
- Separación clara de responsabilidades
- Independencia de frameworks y herramientas externas
- Inversión de dependencias (dependencias apuntan hacia el dominio)
- Reglas de negocio en la capa de dominio

#### Modular Monolith
- Todo en un solo repositorio/proyecto físico
- Separación lógica mediante namespaces y carpetas
- Despliegue único pero organización modular
- Facilita la evolución hacia microservicios si es necesario

### Convenciones de Nomenclatura

#### Clases y Métodos
- **PascalCase** para clases, métodos, interfaces y propiedades públicas
- **camelCase** para variables locales, parámetros y campos privados
- **Prefijos específicos**: `I` para interfaces, `Exception` para excepciones

#### Archivos
- Mismo nombre que la clase principal en el archivo
- Extensión `.cs` para C#
- Organización por carpetas según funcionalidad

#### Namespaces
```
Farutech.[Layer].[Feature].[SubFeature]
Farutech.Application.Features.Identity.Commands.CreateUser
Farutech.Domain.Entities
Farutech.Infrastructure.Persistence.Repositories
```

### Patrones de Implementación

#### CQRS (Command Query Responsibility Segregation)
```csharp
// Command
public record CreateUserCommand(string Name, string Email) : IRequest<Result<Guid>>;

// Command Handler
public class CreateUserCommandHandler : IRequestHandler<CreateUserCommand, Result<Guid>>
{
    public async Task<Result<Guid>> Handle(CreateUserCommand request, CancellationToken cancellationToken)
    {
        // Lógica de manejo del comando
    }
}

// Query
public record GetUserQuery(Guid Id) : IRequest<Result<UserDto>>;

// Query Handler
public class GetUserQueryHandler : IRequestHandler<GetUserQuery, Result<UserDto>>
{
    public async Task<Result<UserDto>> Handle(GetUserQuery request, CancellationToken cancellationToken)
    {
        // Lógica de manejo de la consulta
    }
}
```

#### Repository Pattern
```csharp
// Interface en capa de dominio
public interface IUserRepository
{
    Task<User?> GetByIdAsync(Guid id, CancellationToken cancellationToken = default);
    Task<User?> GetByEmailAsync(string email, CancellationToken cancellationToken = default);
    Task AddAsync(User user, CancellationToken cancellationToken = default);
    Task UpdateAsync(User user, CancellationToken cancellationToken = default);
}

// Implementación en capa de infraestructura
public class UserRepository : IUserRepository
{
    private readonly ApplicationDbContext _context;
    
    public async Task<User?> GetByIdAsync(Guid id, CancellationToken cancellationToken = default)
    {
        return await _context.Users.FindAsync(new object[] { id }, cancellationToken);
    }
    
    // Otras implementaciones...
}
```

#### DTOs y Mapeo
```csharp
// DTO en capa de aplicación
public class UserDto
{
    public Guid Id { get; set; }
    public string Name { get; set; } = string.Empty;
    public string Email { get; set; } = string.Empty;
    public DateTime CreatedAt { get; set; }
}

// Mapeo en manejador
var userDto = new UserDto
{
    Id = user.Id,
    Name = user.Name,
    Email = user.Email,
    CreatedAt = user.CreatedAt
};
```

### Validación de Entrada

#### FluentValidation
```csharp
public class CreateUserValidator : AbstractValidator<CreateUserCommand>
{
    public CreateUserValidator()
    {
        RuleFor(x => x.Name)
            .NotEmpty()
            .MaximumLength(100);
            
        RuleFor(x => x.Email)
            .NotEmpty()
            .EmailAddress();
    }
}
```

#### Manejo de Errores
```csharp
// Result pattern para manejo de errores
public class Result<T>
{
    public T? Value { get; private set; }
    public bool IsSuccess { get; private set; }
    public string ErrorMessage { get; private set; } = string.Empty;
    
    public static Result<T> Success(T value) => new() { Value = value, IsSuccess = true };
    public static Result<T> Failure(string errorMessage) => new() { ErrorMessage = errorMessage, IsSuccess = false };
}
```

### Multi-Tenancy Implementation

#### Tenant Context
```csharp
public interface ITenantContext
{
    Guid TenantId { get; }
    string TenantName { get; }
}

public class TenantContext : ITenantContext
{
    public Guid TenantId { get; private set; }
    public string TenantName { get; private set; } = string.Empty;
    
    public void SetTenant(Guid tenantId, string tenantName)
    {
        TenantId = tenantId;
        TenantName = tenantName;
    }
}
```

#### Row Level Security (RLS)
```csharp
// Interceptor para aplicar filtro de tenant
public class TenantInterceptor : SaveChangesInterceptor
{
    private readonly ITenantContext _tenantContext;
    
    public override InterceptionResult<int> SavingChanges(
        DbContextEventData eventData, 
        InterceptionResult<int> result)
    {
        ApplyTenantFilter(eventData.Context);
        return base.SavingChanges(eventData, result);
    }
    
    private void ApplyTenantFilter(DbContext context)
    {
        var entries = context.ChangeTracker.Entries<EntityBase>()
            .Where(e => e.State == EntityState.Added || e.State == EntityState.Modified);
        
        foreach (var entry in entries)
        {
            entry.Entity.TenantId = _tenantContext.TenantId;
        }
    }
}
```

### Seguridad

#### Autorización Basada en Reclamos
```csharp
[Authorize(Policy = "RequireTenantAccess")]
public class UsersController : ControllerBase
{
    // Controlador protegido por autorización de tenant
}

// En Program.cs
builder.Services.AddAuthorization(options =>
{
    options.AddPolicy("RequireTenantAccess", policy =>
        policy.RequireClaim("tenant_id"));
});
```

#### Validación de Inputs
```csharp
// En manejadores de comandos
public async Task<Result<Guid>> Handle(CreateUserCommand request, CancellationToken cancellationToken)
{
    // Validar que el usuario no pertenezca a otro tenant
    var existingUser = await _userRepository.GetByEmailAsync(request.Email, cancellationToken);
    if (existingUser != null && existingUser.TenantId != _tenantContext.TenantId)
    {
        return Result<Guid>.Failure("User already exists in another tenant");
    }
    
    // Lógica del dominio...
}
```

## Referencias
- [Engineering Standards](../03-architecture-and-standards/02-engineering-standards.md)
- [Architecture Decision Records](../03-architecture-and-standards/01-architecture-decision-records/)

> **Próximos Pasos**:  
> - Implementar [estructura de feature](#vertical-slice-architecture)  
> - Aplicar [patrones de implementación](#patrones-de-implementación)  
> - Configurar [multi-tenancy](#multi-tenancy-implementation)  

---
*Versión del documento: 1.0.0 | Creado: 2026-07-07 | Revisión: Trimestral*