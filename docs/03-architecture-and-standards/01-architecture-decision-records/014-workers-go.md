# ADR-014: Tecnología para Workers — Go

> **Propósito**: Documentar la decisión de utilizar Go para los workers y el procesamiento asíncrono de Farutech Cloud Platform  
> **Audiencia**: Arquitectos, ingenieros de backend, operaciones  
> **Propietario**: Lead Architect  
> **Última Revisión**: 2026-07-07  
> **Estado**: Aprobado

## Resumen

La plataforma necesita procesamiento asíncrono, manejo de colas, procesamiento de eventos y tareas en segundo plano de alta concurrencia. Se adopta **Go** como tecnología principal para los workers y el procesamiento asíncrono, en complemento al backend en .NET 10.

## Detalles

### Contexto
La plataforma necesita procesamiento asíncrono, manejo de colas, procesamiento de eventos y tareas en segundo plano de alta concurrencia.

### Alternativas Evaluadas

#### Opción 1: .NET Background Services
- **Ventajas**:
  - Reutiliza el stack .NET
- **Desventajas**:
  - Menor eficiencia en concurrencia masiva
  - Acopla los workers al ciclo de vida de la app principal

#### Opción 2: Node.js Workers
- **Ventajas**:
  - Ecosistema amplio
- **Desventajas**:
  - Modelo de concurrencia menos eficiente para CPU-bound

#### Opción 3: Python Celery
- **Ventajas**:
  - Maduro para tareas
- **Desventajas**:
  - Rendimiento y tipado inferiores para alta concurrencia

#### Opción 4: Rust
- **Ventajas**:
  - Máximo rendimiento
- **Desventajas**:
  - Curva de aprendizaje y menor velocidad de desarrollo

### Decisión
Elegimos **Go** como tecnología principal para los workers y procesamiento asíncrono.

### Consecuencias
- **Positivas**:
  - Excelente rendimiento en operaciones concurrentes
  - Bajo consumo de recursos
  - Buen soporte para procesamiento paralelo
  - Fácil creación de servicios ligeros
- **Negativas**:
  - Curva de aprendizaje para desarrolladores no familiarizados
  - Menos herramientas de desarrollo que otros ecosistemas

### Impacto
- Los workers de alta concurrencia se implementan en Go
- Se comunican con el backend .NET 10 vía el message broker (ver ADR correspondiente)
- Node.js queda eliminado como opción de workers

## Referencias
- [Backend .NET 10](005-backend-dotnet10.md)

> **Próximos Pasos**:
> - Definir el contrato de mensajes workers ↔ backend
> - Establecer el modelo de despliegue de los workers Go

---
*Versión del documento: 1.0.0 | Creado: 2026-07-07 | Revisión: Según sea necesario*
