# ADR-010: Infraestructura Inicial

> **Propósito**: Documentar la decisión de comenzar con VPS y Coolify en Hostinger, con planes de migrar a Azure con Kubernetes en el futuro  
> **Audiencia**: Arquitectos de infraestructura, operaciones, finanzas  
> **Propietario**: Lead Infrastructure Engineer  
> **Última Revisión**: 2026-07-02  
> **Estado**: Aprobado

## Resumen

La plataforma necesita una infraestructura inicial para comenzar operaciones con costos controlados, pero preparada para escalar a soluciones más robustas en el futuro. Se comienza con VPS y Coolify en Hostinger, con planes de migrar a Azure con Kubernetes en el futuro.

## Detalles

### Contexto
La plataforma necesita una infraestructura inicial para comenzar operaciones con costos controlados, pero preparada para escalar a soluciones más robustas en el futuro.

### Alternativas Evaluadas

#### Opción 1: Directamente en Azure/AWS desde el inicio
- **Ventajas**:
  - Escalabilidad inmediata
  - Servicios gestionados maduros
- **Desventajas**:
  - Costo inicial elevado para fase temprana

#### Opción 2: Solución completamente serverless
- **Ventajas**:
  - Sin gestión de servidores
- **Desventajas**:
  - Acoplamiento a un proveedor
  - Difícil de depurar en ciertos escenarios

#### Opción 3: Otros proveedores de VPS
- **Ventajas**:
  - Costo competitivo
- **Desventajas**:
  - Herramientas de orquestación menos integradas

### Decisión
Comenzaremos con VPS y Coolify en Hostinger, con planes de migrar a Azure con Kubernetes en el futuro.

### Consecuencias
- **Positivas**:
  - Costos iniciales controlados
  - Simplicidad en la configuración inicial
  - Posibilidad de migración gradual

- **Negativas**:
  - Limitaciones de escalabilidad en el corto plazo
  - Posible necesidad de reconfiguración al migrar

### Impacto
- Infraestructura inicial: VPS + Coolify (Hostinger)
- Trayectoria de evolución: hacia Azure con Kubernetes
- La arquitectura debe mantener portabilidad para facilitar la migración

## Referencias
- [Arquitectura de Monolito Modular](001-modular-monolith.md)

> **Próximos Pasos**:
> - Definir el diagrama de despliegue inicial en Coolify
> - Establecer el plan de migración a Azure/Kubernetes

---
*Versión del documento: 1.0.0 | Creado: 2026-07-02 | Revisión: Según sea necesario*
