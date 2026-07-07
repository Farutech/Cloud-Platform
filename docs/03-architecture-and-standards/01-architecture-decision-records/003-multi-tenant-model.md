# ADR-003: Modelo de Multi-Tenancy Híbrido (Shared/Dedicated)

> **Propósito**: Documentar la decisión de utilizar un modelo de multi-tenancy híbrido con opciones de Shared y Dedicated para Farutech Cloud Platform  
> **Audiencia**: Arquitectos, desarrolladores backend, ingenieros de seguridad  
> **Propietario**: Lead Security Engineer  
> **Última Revisión**: 2026-07-07  
> **Estado**: Aprobado

## Resumen

Se decide implementar un modelo de multi-tenancy híbrido que combine instancias Shared (multi-tenant lógico) y Dedicated (multi-tenant físico) para satisfacer diferentes necesidades de clientes mientras se optimiza el uso de recursos.

## Detalles

### Contexto
Farutech Cloud Platform debe soportar diferentes tipos de clientes:
- Pequeños clientes que prefieren compartir recursos para reducir costos
- Clientes empresariales que requieren aislamiento físico por razones de seguridad/compliance
- Clientes que inician con Shared y pueden migrar a Dedicated en el futuro

### Problema
Necesitamos un modelo de multi-tenancy flexible que permita:
- Optimización de costos para clientes pequeños
- Aislamiento físico para clientes empresariales
- Migración entre modelos según evolucionen las necesidades
- Seguridad y cumplimiento normativo

### Alternativas Evaluadas

#### Opción 1: Multi-tenancy Híbrido (Shared/Dedicated)
- **Ventajas**: 
  - Flexibilidad para diferentes tipos de clientes
  - Optimización de costos para clientes pequeños
  - Aislamiento físico para clientes empresariales
  - Posibilidad de migración entre modelos
  - Modelo escalable

- **Desventajas**: 
  - Mayor complejidad de implementación
  - Necesidad de lógica para manejar ambos modelos

#### Opción 2: Solo Shared
- **Ventajas**: 
  - Simplicidad de implementación
  - Máxima optimización de recursos

- **Desventajas**: 
  - No satisface necesidades de clientes empresariales
  - Limitación de mercado

#### Opción 3: Solo Dedicated
- **Ventajas**: 
  - Máximo aislamiento
  - Cumple con requisitos estrictos de seguridad

- **Desventajas**: 
  - Costos elevados
  - No viable para clientes pequeños
  - Limitación de mercado

### Decisión
Se adopta la **Opción 1: Multi-tenancy Híbrido (Shared/Dedicated)** como modelo de multi-tenancy para Farutech Cloud Platform.

### Consecuencias
- **Positivas**: 
  - Flexibilidad para atender diferentes segmentos de mercado
  - Optimización de costos para clientes pequeños
  - Aislamiento físico para clientes empresariales
  - Posibilidad de crecimiento y evolución
  - Modelo de negocio más robusto

- **Negativas**: 
  - Mayor complejidad de implementación
  - Necesidad de lógica adicional para manejar ambos modelos
  - Mayor complejidad de operación

### Impacto
- La plataforma implementará lógica para soportar ambos modelos (Shared/Dedicated)
- Se creará un sistema de tenancy que determine el modelo para cada instancia
- Se implementará aislamiento lógico (schemas) para Shared y físico (instancias separadas) para Dedicated
- Se desarrollará funcionalidad de migración entre modelos si es necesario
- Se implementará monitoreo específico para cada tipo de tenancy

## Referencias
- [Platform Architecture](../03-platform-architecture.md)
- [PostgreSQL Database ADR](002-postgresql-database.md)

> **Próximos Pasos**:  
> - Implementar [lógica de tenancy](../../04-development-lifecycle/)  
> - Definir [estrategia de seguridad](../../05-security/) para ambos modelos  

---
*Versión del documento: 1.0.0 | Creado: 2026-07-07 | Revisión: Según sea necesario*