# ADR-002: Uso de PostgreSQL como Motor de Base de Datos

> **Propósito**: Documentar la decisión de utilizar PostgreSQL como motor de base de datos principal para Farutech Cloud Platform  
> **Audiencia**: Arquitectos, desarrolladores backend, ingenieros de datos  
> **Propietario**: Lead Database Engineer  
> **Última Revisión**: 2026-07-07  
> **Estado**: Aprobado

## Resumen

Se decide utilizar PostgreSQL como motor de base de datos principal para Farutech Cloud Platform debido a su robustez, funcionalidades avanzadas y excelente soporte para el modelo de multi-tenancy requerido por la plataforma.

## Detalles

### Contexto
Farutech Cloud Platform requiere un motor de base de datos que soporte:
- Multi-tenancy a nivel de schema
- Funcionalidades avanzadas de seguridad
- Escalabilidad horizontal y vertical
- Buen rendimiento para operaciones OLTP
- Compatibilidad con Entity Framework Core

### Problema
Necesitamos elegir un motor de base de datos que pueda soportar el modelo de multi-tenancy híbrido (shared/dedicated) y que proporcione las funcionalidades necesarias para una plataforma SaaS empresarial.

### Alternativas Evaluadas

#### Opción 1: PostgreSQL
- **Ventajas**: 
  - Soporte nativo para schemas
  - Row Level Security (RLS)
  - Extensiones útiles (PostGIS, Full-text search)
  - Gran rendimiento y estabilidad
  - Licencia open-source amigable
  - Buen soporte para JSON

- **Desventajas**: 
  - Curva de aprendizaje para algunos desarrolladores
  - Algunas limitaciones en ciertos escenarios de BI

#### Opción 2: SQL Server
- **Ventajas**: 
  - Buen soporte para .NET
  - Contenido rico en seguridad y multi-tenancy
  - Soporte empresarial

- **Desventajas**: 
  - Costo elevado
  - Menos flexible en términos de licenciamiento

#### Opción 3: MySQL
- **Ventajas**: 
  - Amplia adopción
  - Buen rendimiento
  - Licencia open-source

- **Desventajas**: 
  - Menos funcionalidades avanzadas
  - Limitaciones en multi-tenancy

### Decisión
Se adopta **PostgreSQL** como motor de base de datos principal para Farutech Cloud Platform.

### Consecuencias
- **Positivas**: 
  - Excelente soporte para multi-tenancy mediante schemas
  - Funcionalidades avanzadas de seguridad (RLS)
  - Buen rendimiento y estabilidad
  - Flexibilidad para futuras extensiones
  - Costo total de propiedad favorable

- **Negativas**: 
  - Posible curva de aprendizaje para algunos desarrolladores
  - Requiere inversión en capacitación

### Impacto
- La plataforma utilizará PostgreSQL 16+ como base de datos principal
- Se implementará multi-tenancy mediante schemas
- Se utilizará Row Level Security para aislamiento adicional
- Se aprovecharán extensiones como Full-text search para funcionalidades avanzadas
- Se integrará con Entity Framework Core para ORM

## Referencias
- [Platform Architecture](../03-platform-architecture.md)
- [Multi-tenant Model ADR](003-multi-tenant-model.md)

> **Próximos Pasos**:  
> - Configurar [estrategia de multi-tenancy](003-multi-tenant-model.md)  
> - Definir [convenciones de base de datos](../03-coding-standards.md#base-de-datos)  

---
*Versión del documento: 1.0.0 | Creado: 2026-07-07 | Revisión: Según sea necesario*