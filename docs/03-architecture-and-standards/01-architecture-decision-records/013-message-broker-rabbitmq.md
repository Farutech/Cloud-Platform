# ADR-013: Message Broker — RabbitMQ

> **Propósito**: Documentar la decisión de utilizar RabbitMQ como message broker para eventos asíncronos y comunicación con los workers  
> **Audiencia**: Arquitectos, ingenieros de backend, operaciones  
> **Propietario**: Lead Architect  
> **Última Revisión**: 2026-07-07  
> **Estado**: Aprobado

## Resumen

Para desacoplar módulos y habilitar procesamiento asíncrono (incluida la integración con los workers en Go), se adopta **RabbitMQ** como message broker. Se descarta Kafka para la fase inicial por simplicidad operativa y suficiencia para los volúmenes esperados.

## Detalles

### Contexto
La plataforma (monolito modular) requiere comunicación asíncrona entre módulos de negocio y con los workers de alta concurrencia en Go, así como propagación de eventos de dominio para integraciones.

### Alternativas Evaluadas

#### Opción 1: RabbitMQ (adoptado)
- **Ventajas**:
  - Maduro, ampliamente adoptado
  - Exchanges/queues flexibles (routing, RPC, pub/sub)
  - Operación sencilla para los volúmenes iniciales
  - Buen soporte de clientes .NET y Go
- **Desventajas**:
  - Menor throughput que Kafka en escala extrema
  - Persistencia depende de configuración

#### Opción 2: Apache Kafka
- **Ventajas**:
  - Alto throughput y replay de eventos
  - Log de eventos inmutable
- **Desventajas**:
  - Mayor complejidad operativa
  - Overkill para la fase inicial

#### Opción 3: Sin broker (in-process)
- **Ventajas**:
  - Sin componente externo
- **Desventajas**:
  - Acopla módulos y dificulta workers externos

### Decisión
Se adopta **RabbitMQ** como message broker para eventos asíncronos y colas de workers.

### Consecuencias
- **Positivas**:
  - Desacoplamiento de módulos y workers
  - Operación y observabilidad sencillas en fase inicial
  - Clientes nativos en .NET y Go
- **Negativas**:
  - Requiere operar un componente adicional
  - Revisar la necesidad de Kafka si el volumen crece drásticamente

### Impacto
- Los eventos de dominio y colas de workers viajan por RabbitMQ
- El backend .NET 10 publica/consume; los workers Go consumen
- Sustituye cualquier referencia previa que dejara el broker indefinido

## Referencias
- [Tecnología para Workers (Go)](014-workers-go.md)
- [Arquitectura de Monolito Modular](001-modular-monolith.md)

> **Próximos Pasos**:
> - Definir el esquema de exchanges/queues y contratos de mensaje
> - Establecer estrategia de reintentos y dead-letter queues

---
*Versión del documento: 1.0.0 | Creado: 2026-07-07 | Revisión: Según sea necesario*
