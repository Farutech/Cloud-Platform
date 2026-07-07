# Farutech Cloud Platform
## Documento Fundacional Completo

---

# Tabla de Contenidos

1. [Visión del Producto](#visión-del-producto)
2. [Modelo de Negocio](#modelo-de-negocio)
3. [Arquitectura Conceptual](#arquitectura-conceptual)
4. [Modelo Multi-Tenant](#modelo-multi-tenant)
5. [Estructura del Ecosistema](#estructura-del-ecosistema)
6. [Gestión de Aplicaciones](#gestión-de-aplicaciones)
7. [Seguridad y Acceso](#seguridad-y-acceso)
8. [Modelo de Despliegue](#modelo-de-despliegue)
9. [Estrategia de Repositorios](#estrategia-de-repositorios)
10. [Equipo y Organización](#equipo-y-organización)
11. [Ciclo de Vida del Desarrollo](#ciclo-de-vida-del-desarrollo)
12. [Evolución Futura](#evolución-futura)

---

## Visión del Producto

Farutech Cloud Platform es una plataforma tecnológica diseñada para permitir la creación, operación, distribución y evolución continua de aplicaciones empresariales bajo un modelo SaaS (Software as a Service).

La plataforma tiene como objetivo transformar la manera tradicional de desarrollar software a medida, permitiendo que las soluciones construidas por Farutech puedan:

- Ser reutilizadas
- Evolucionar continuamente
- Ser comercializadas a múltiples organizaciones
- Mantener separación entre clientes
- Reducir costos de desarrollo y mantenimiento
- Permitir crecimiento progresivo desde pequeñas empresas hasta clientes empresariales

### Objetivos Estratégicos

1. **Reutilización**: Toda funcionalidad común debe convertirse en componente reutilizable
2. **Independencia**: Cada aplicación debe poder evolucionar sin bloquear otras
3. **Seguridad**: Toda operación sensible debe quedar controlada y auditada
4. **Escalabilidad**: La plataforma debe poder crecer desde pocos clientes hasta operación empresarial
5. **Automatización**: Los procesos repetitivos deben ser gestionados mediante herramientas automáticas
6. **Evolución continua**: La plataforma debe permitir mejorar sin reconstrucciones completas

---

## Modelo de Negocio

### Tipos de Aplicaciones

#### 1. Aplicaciones estándar Farutech
- Productos creados por Farutech
- Disponibles para múltiples clientes
- Evolución continua
- Publicadas en catálogo
- Con paquetes comerciales

#### 2. Aplicaciones desarrolladas para clientes
- Originan de requerimientos específicos
- Pueden convertirse en productos reutilizables
- Pueden permanecer como privadas

##### Aplicaciones reutilizables
- El cliente permite que Farutech pueda comercializarla
- Se convierte en producto Farutech futuro

##### Aplicaciones privadas
- Solución pertenece únicamente al cliente
- Disponible solamente para organización específica
- Arquitectura sigue siendo la misma; cambia la visibilidad y comercialización

### Modelo de Paquetes

Las aplicaciones se estructuran en:
```
Aplicación
├── Paquetes
│   ├── Módulos
│       ├── Funcionalidades
```

Ejemplo:
- Aplicación: POS Restaurante
- Paquete Básico: Ventas, Productos, Usuarios
- Paquete Profesional: Ventas, Productos, Inventario, Reportes
- Paquete Enterprise: Todo + Integraciones, Automatizaciones

---

## Arquitectura Conceptual

### Jerarquía Principal

```
Usuario
├── Organización
    ├── Instancia
        ├── Aplicación
            ├── Paquete
                ├── Módulos
                    ├── Permisos
```

### Componentes del Ecosistema

#### 1. Plataforma administrativa
- Centro de control del ecosistema
- Acceso: portal.farutech.com
- Funcionalidades:
  - Crear organizaciones
  - Administrar usuarios
  - Crear instancias
  - Contratar aplicaciones
  - Administrar paquetes
  - Gestionar permisos
  - Administrar facturación
  - Gestionar soporte
  - Auditar operaciones

#### 2. Catálogo de aplicaciones y provisioning
- No es una tienda tradicional
- Catálogo donde una organización puede seleccionar una aplicación y crear una nueva instancia configurada
- Flujo: Explorar → Seleccionar → Configurar → Desplegar

#### 3. Aplicaciones SaaS
- Productos funcionales utilizados por los usuarios finales
- Cada aplicación es independiente
- Incluye: Frontend, Backend, Worker, Modelo de datos, Versionamiento

#### 4. Servicios compartidos de plataforma
- Capacidades comunes que evitan reinventar funcionalidades
- Ejemplos: Identidad, Autenticación, Autorización, Usuarios, Organizaciones, Auditoría, Notificaciones, Facturación, Mensajería

---

## Modelo Multi-Tenant

### Instancia SaaS

La instancia es la unidad operativa principal:
- Representa una instalación concreta de una aplicación
- Tiene identificador único, configuración propia, usuarios asignados
- Soporta múltiples instancias por organización

Ejemplo:
- Organización: Restaurantes ABC
- Instancias: POS Restaurante Centro, POS Restaurante Norte, ERP Administrativo

### Modelos de Despliegue

#### Shared Mode
- Varias organizaciones utilizan la misma infraestructura
- PostgreSQL con schemas por organización
- Ventajas: Menor costo, Mayor eficiencia, Ideal para clientes pequeños

#### Dedicated Mode
- Una instancia tiene infraestructura exclusiva
- Container y base de datos propios
- Ventajas: Mayor aislamiento, Mayor control, Mayor capacidad

### Acceso a Aplicaciones

Formato: `{instanceId}.{organizationId}.farutech.app`

Ejemplo: `ins92832.org77282.farutech.app`

---

## Estructura del Ecosistema

### Acceso y Experiencia

1. Usuario accede a `portal.farutech.com`
2. Selecciona instancia
3. Sistema redirige a `{instanceId}.{organizationId}.farutech.app`
4. Aplicación carga su microfrontend correspondiente

### Actualizaciones Automáticas

Farutech opera bajo modelo SaaS administrado:
- Las organizaciones no administran versiones
- Las actualizaciones se aplican automáticamente
- Notificación a clientes sobre cambios importantes

---

## Gestión de Aplicaciones

### Arquitectura de Aplicaciones

Cada aplicación sigue la estructura:
```
app-name/
├── src/
│   ├── frontend/     # React + Vite + TypeScript
│   ├── backend/      # .NET 10
│   └── worker/       # Go
├── tests/
│   ├── unit/
│   ├── integration/
│   └── e2e/
├── docs/
├── docker/
└── deploy/
```

### Tecnologías Estándar

#### Frontend
- React
- TypeScript
- Vite
- Microfrontends con Module Federation

#### Backend
- .NET 10
- C#
- Clean Architecture o Vertical Slice Architecture

#### Workers
- Go
- Procesamiento asíncrono
- Colas y eventos

#### Base de Datos
- PostgreSQL (transaccional)
- Soporte para schemas multi-tenant

### Comunicación entre Aplicaciones

No se recomienda API directa, sino:
- Aplicación A → Evento → Message Broker → Worker → Aplicación B
- Uso de contratos compartidos para interoperabilidad

---

## Seguridad y Acceso

### Autenticación
- Tokens JWT firmados asimétricamente
- Soporte para proveedores externos (Microsoft, Google)

### Autorización
- RBAC (Role-Based Access Control) + ABAC (Attribute-Based Access Control)
- Validaciones precisas por contexto de tenant
- Políticas a nivel de registro

### Protección de Datos
- Row-Level Security (RLS) en PostgreSQL
- Filtrado automático por tenant_id
- Auditoría completa de operaciones sensibles

---

## Modelo de Despliegue

### Infraestructura Inicial
- VPS con Coolify en Hostinger
- Docker Compose
- PostgreSQL único con schemas

### Futura Migración
- Azure Container Apps
- Kubernetes (AKS)
- Managed PostgreSQL
- Service Bus
- Azure Key Vault

### CI/CD Pipeline
1. Commit/Pre-Push: Formateo y validación
2. Build Phase: Compilación y empaquetado
3. Security Gates: Análisis de vulnerabilidades
4. Quality Checks: Pruebas y arquitectura
5. Deploy: Blue/Green Deployment
6. Observability: OpenTelemetry

---

## Estrategia de Repositorios

### Organización GitHub
```
github.com/Farutech/

├── cloud-platform          # Plataforma administrativa
├── website                 # Sitio web público
├── demos                   # Demostraciones gratuitas
├── app-pos                 # Sistema POS
├── app-erp                 # Sistema ERP
├── app-hotels              # Gestión hotelera
├── app-restaurants         # Gestión de restaurantes
├── packages-frontend       # Paquetes frontend
├── packages-dotnet         # Paquetes backend
├── packages-shared-contracts # Contratos compartidos
├── service-identity        # Servicio de identidad
├── service-billing         # Servicio de facturación
├── worker-platform         # Plataforma de workers
└── documentation           # Documentación
```

### Principios de Separación
- Cada repositorio representa una capacidad o producto independiente
- Equipos diferentes pueden trabajar sin bloquearse
- Pipelines independientes
- Versionamiento independiente

---

## Equipo y Organización

### Modelos de Equipo

#### Platform Team
- Responsable del core, seguridad, infraestructura y estándares

#### Product Teams
- Equipo POS, Equipo ERP, etc.
- Responsables de producto, código y evolución

#### Enablement Teams
- QA, DevOps, Arquitectura, Automatización

### Principio de Autonomía
Cada equipo debe poder:
- Desarrollar
- Probar
- Publicar
- Desplegar
Sin esperar cambios manuales de otros equipos

---

## Ciclo de Vida del Desarrollo

### Jerarquía de Trabajo
```
Visión
├── Epic
    ├── Feature
        ├── User Story
            ├── Task
                └── Subtask
```

### Definition of Ready (DoR)
Una tarea solo inicia cuando:
- Objetivo claro
- Alcance definido
- Criterios de aceptación
- Diseño aprobado
- Dependencias identificadas
- Riesgos conocidos

### Definition of Done (DoD)
Una tarea está terminada cuando:
- Código implementado y revisado
- Pruebas unitarias e integración completas
- Sin vulnerabilidades críticas
- Documentación actualizada
- Pipeline exitoso
- Criterios de aceptación cumplidos

---

## Evolución Futura

### Escalabilidad de Recursos
- Monitoreo de consumo
- Detección de necesidades
- Recomendación de crecimiento
- Ajuste automático de recursos

### Futuras Capacidades
- Soporte multi-vendedor en marketplace
- Self-service para clientes
- Integración con más proveedores de identidad
- Advanced analytics y reporting
- Mobile-first experience

---

## Estándares Técnicos

### Principios de Diseño
- Clean Code: Código legible y auto-explicativo
- SOLID: Principios de diseño orientado a objetos
- DRY: No repetir lógica innecesaria
- KISS: Mantener la simplicidad
- YAGNI: No agregar funcionalidades no necesarias
- Separation of Concerns: Separar preocupaciones lógicas

### Arquitectura Backend
- Modular Monolith como base
- Clean Architecture o Vertical Slice Architecture
- CQRS con implementación explícita (sin MediatR)
- Garantías de idempotencia en APIs
- Pruebas de arquitectura automatizadas

### Arquitectura Frontend
- Microfrontends con Module Federation
- React + TypeScript + Vite
- Aislamiento de estilos
- Comunicación mediante eventos
- Tipado estricto

### Workers en Go
- Worker Pools para procesamiento concurrente
- Fan-out/Fan-in para distribución de tareas
- Contextual cancellation y graceful shutdown
- Patrón Transactional Outbox para mensajería

---

## Seguimiento y Gestión

### Documentación Obligatoria
Cada aplicación debe tener:
- README.md: Propósito, ejecución, arquitectura
- ARCHITECTURE.md: Componentes e integraciones
- CHANGELOG.md: Historial de cambios
- DECISIONS.md: Registro de decisiones técnicas (ADRs)

### Gestión de Decisiones
Formato ADR (Architecture Decision Record):
```
ADR-001
Decisión: Usar PostgreSQL
Motivo: Multi tenant mediante schemas
Fecha: 2026-07
```

---

## Conclusión

Farutech Cloud Platform representa una arquitectura moderna, escalable y segura diseñada para soportar la evolución continua de aplicaciones empresariales. Con su enfoque en reutilización, autonomía de equipos y estándares técnicos rigurosos, la plataforma está posicionada para crecer desde pequeños clientes hasta operaciones empresariales complejas.

La combinación de un modelo de repositorios bien estructurado, tecnologías estándar y procesos ágiles permite la creación de un ecosistema robusto donde múltiples aplicaciones pueden convivir bajo una misma capa administrativa, de seguridad, identidad, facturación y operación.