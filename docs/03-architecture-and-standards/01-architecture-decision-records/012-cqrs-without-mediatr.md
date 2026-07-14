# ADR-012: CQRS sin MediatR (Implementación Nativa vía Inyección de Dependencias)

> **Propósito**: Documentar la decisión de implementar CQRS con inyección de dependencias nativa, descartando la biblioteca MediatR  
> **Audiencia**: Arquitectos, desarrolladores backend (.NET)  
> **Propietario**: Lead Architect  
> **Última Revisión**: 2026-07-07  
> **Estado**: Aprobado

## Resumen

Se implementa CQRS (Command Query Responsibility Segregation) utilizando inyección de dependencias nativa de ASP.NET Core y handlers explícitos, **sin la biblioteca MediatR**. La decisión prioriza el rendimiento, la trazabilidad y la reducción de dependencias externas.

## Detalles

### Contexto
CQRS separa comandos de queries para favorecer la escalabilidad y claridad. Existen dos formas comunes de enrutar comandos/queries: un mediator (MediatR) o handlers invocados directamente vía DI. La plataforma necesita decidir el mecanismo.

### Alternativas Evaluadas

#### Opción 1: CQRS con MediatR
- **Ventajas**:
  - Enrutamiento uniforme de comandos/queries
  - Pipelines de behaviors (logging, validación) transversales
- **Desventajas**:
  - Sobrecarga por reflexión en tiempo de ejecución
  - Dependencia externa adicional
  - Menor trazabilidad explícita del flujo

#### Opción 2: CQRS nativo vía DI (adoptado)
- **Ventajas**:
  - Sin sobrecarga de mediator
  - Handlers explícitos y fácilmente testeables
  - Trazabilidad directa del flujo comando→handler
  - Menos dependencias externas
- **Desventajas**:
  - Behaviors transversales se implementan manualmente (filtros/middleware)

### Decisión
Se implementa **CQRS con inyección de dependencias nativa**, descartando MediatR. Los comandos y queries se resuelven mediante handlers registrados en el contenedor de DI y ejecutados de forma explícita.

### Consecuencias
- **Positivas**:
  - Mejor rendimiento (sin indirección de mediator)
  - Menos dependencias externas
  - Código más explícito y trazable
- **Negativas**:
  - Los cross-cutting behaviors (validación, logging) se implementan con filtros/middleware en lugar de pipelines de MediatR

### Impacto
- Los handlers de comando/query se registran y resuelven vía DI de ASP.NET Core
- La validación y el logging transversales se implementan con filtros/middleware (p. ej. FluentValidation en el pipeline de ASP.NET)
- Sustituye cualquier referencia previa que obligue a usar MediatR

## Referencias
- [Backend .NET 10](005-backend-dotnet10.md)
- [Tecnología para Workers (Go)](014-workers-go.md)

> **Próximos Pasos**:
> - Definir la convención de handlers (ICommandHandler / IQueryHandler)
> - Documentar el middleware de validación/logging transversal

---
*Versión del documento: 1.0.0 | Creado: 2026-07-07 | Revisión: Según sea necesario*
