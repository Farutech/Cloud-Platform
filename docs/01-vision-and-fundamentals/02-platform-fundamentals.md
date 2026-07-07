# Farutech Cloud Platform - Fundamentals

## 1. Introducción

Farutech Cloud Platform es una plataforma tecnológica diseñada para permitir la creación, operación, distribución y evolución continua de aplicaciones empresariales bajo un modelo SaaS (Software as a Service).

La plataforma tiene como objetivo transformar la manera tradicional de desarrollar software a medida, permitiendo que las soluciones construidas por Farutech puedan:
- Ser reutilizadas
- Evolucionar continuamente
- Ser comercializadas a múltiples organizaciones
- Mantener separación entre clientes
- Reducir costos de desarrollo y mantenimiento
- Permitir crecimiento progresivo desde pequeñas empresas hasta clientes empresariales

La plataforma no se plantea como una aplicación única, sino como un **ecosistema donde múltiples aplicaciones independientes pueden convivir bajo una misma capa administrativa, de seguridad, identidad, facturación y operación**.

## 2. Visión del Producto

Actualmente muchas empresas requieren soluciones digitales específicas:
- Sistemas administrativos
- POS
- ERP
- Gestión hotelera
- Sistemas financieros
- Aplicaciones internas
- Automatizaciones

Tradicionalmente, cada desarrollo personalizado genera un problema:
- Código duplicado
- Diferentes arquitecturas
- Alto costo de mantenimiento
- Dificultad para actualizar clientes
- Dependencia del equipo que creó la solución

Farutech Cloud Platform busca cambiar este modelo mediante un enfoque donde:

> Una solución desarrollada para un cliente puede convertirse, cuando sea viable, en una capacidad reutilizable para otros clientes.

### Ejemplo:
Un cliente solicita: "Necesito un sistema para hoteles"

Se desarrolla: Hotel Platform

Posteriormente esa solución puede evolucionar a:
```
Hotel Platform
├── Paquete Básico
├── Paquete Profesional
└── Paquete Enterprise
```
y ser ofrecida a otros clientes.

## 3. Qué es Farutech Cloud Platform

Farutech Cloud Platform es una plataforma compuesta por cuatro grandes capacidades:

### 3.1 Plataforma administrativa
Es el centro de control del ecosistema.

Permite:
- Crear organizaciones
- Administrar usuarios
- Crear instancias
- Contratar aplicaciones
- Administrar paquetes
- Gestionar permisos
- Administrar facturación
- Gestionar soporte
- Auditar operaciones

Acceso: `portal.farutech.com`

### 3.2 Catálogo de aplicaciones y provisioning
El concepto de Marketplace dentro de Farutech no representa una tienda tradicional donde se descarga software.
Representa un catálogo donde una organización puede seleccionar una aplicación y crear una nueva instancia configurada.

Flujo:
```
Organización
    ↓
Explora aplicaciones
    ↓
Selecciona aplicación
    ↓
Selecciona paquete
    ↓
Configura parámetros
    ↓
Selecciona modalidad de despliegue
    ↓
Sistema crea instancia
    ↓
Aplicación disponible
```

### 3.3 Aplicaciones SaaS
Son los productos funcionales utilizados por los usuarios finales.
Ejemplos:
- POS
- ERP
- Restaurantes
- Hoteles
- Finanzas
- Gestión documental

Cada aplicación es independiente y cuenta con:
- Frontend
- Backend
- Worker cuando aplica
- Modelo de datos
- Versionamiento
- Pruebas
- Ciclo de vida

### 3.4 Servicios compartidos de plataforma
Son capacidades comunes que evitan que cada aplicación tenga que reinventar funcionalidades.
Ejemplos:
- Identidad
- Autenticación
- Autorización
- Usuarios
- Organizaciones
- Auditoría
- Notificaciones
- Facturación
- Mensajería
- Integraciones

## 4. Modelo conceptual de la plataforma

La relación principal dentro del ecosistema es:
```
Usuario → Organización → Instancia → Aplicación → Paquete → Módulos → Permisos
```

Cada elemento tiene una responsabilidad diferente.

## 5. Componentes del Modelo

### 5.1 Usuario
Representa una persona que accede a la plataforma.
Un usuario puede:
- Pertenecer a una o varias organizaciones
- Tener diferentes roles
- Tener diferentes permisos según la organización
- Acceder a diferentes instancias

### 5.2 Organización
Una organización representa una empresa, cliente o entidad que utiliza Farutech.
Ejemplo: Coca-Cola Colombia

Una organización administra:
- Usuarios
- Roles
- Suscripciones
- Instancias
- Configuraciones

Una organización puede tener múltiples aplicaciones y múltiples instancias.

### 5.3 Instancia SaaS
La instancia es la unidad operativa principal.
Representa una instalación concreta de una aplicación.

Ejemplo:
- Organización: Restaurantes ABC
- Instancias:
  - POS Restaurante Centro
  - POS Restaurante Norte
  - ERP Administrativo

Aunque sean la misma aplicación, son instancias diferentes.
Cada instancia tiene:
- Identificador único
- Configuración propia
- Usuarios asignados
- Paquetes contratados
- Módulos habilitados
- Recursos asignados
- Modelo de despliegue

### 5.4 Aplicaciones
Una aplicación representa un producto funcional.
Ejemplo:
- POS Restaurante
- ERP Empresarial
- Hotel Management

Una aplicación contiene:
- Código
- Versiones
- Paquetes
- Módulos
- Reglas
- Integraciones

## 6. Modelo de aplicaciones Farutech

### 6.1 Aplicaciones estándar Farutech
Son productos creados por Farutech.
Características:
- Disponibles para múltiples clientes
- Evolución continua
- Publicadas en catálogo
- Con paquetes comerciales

### 6.2 Aplicaciones desarrolladas para clientes
Una aplicación puede originarse desde un requerimiento específico.
Existen dos caminos:

#### Aplicación reutilizable
El cliente permite que Farutech pueda comercializarla.
Resultado: Cliente inicial + Producto Farutech futuro

#### Aplicación privada
La solución pertenece únicamente al cliente.
Resultado: Disponible solamente para: Organización específica
La arquitectura sigue siendo la misma; cambia la visibilidad y comercialización.

## 7. Paquetes, módulos y funcionalidades

Las aplicaciones no se comercializan como bloques rígidos.
Se estructuran:
```
Aplicación → Paquetes → Módulos → Funcionalidades
```

Ejemplo:
- Aplicación: POS Restaurante
- Paquete Básico: Ventas, Productos, Usuarios
- Paquete Profesional: Ventas, Productos, Inventario, Reportes
- Paquete Enterprise: Todo + Integraciones + Automatizaciones

## 8. Modelo Shared y Dedicated

La infraestructura pertenece a la instancia, no a la organización.
Esto permite que una organización tenga diferentes modelos por instancia:
```
Organización
├── POS Norte (Shared)
└── ERP Corporativo (Dedicated)
```

### 8.1 Shared Mode
Modelo SaaS compartido.
Varias organizaciones utilizan la misma infraestructura.
Ventajas: Menor costo, mayor eficiencia, ideal para clientes pequeños.

### 8.2 Dedicated Mode
Modelo empresarial.
Una instancia tiene infraestructura exclusiva.
Ventajas: Mayor aislamiento, mayor control, mayor capacidad.

## 9. Escalabilidad de recursos

Los recursos no son fijos. Una instancia puede evolucionar:
- Inicial: Dedicated Small (2 CPU, 4GB RAM, 50GB Storage)
- Después: Dedicated Large (8 CPU, 32GB RAM, 500GB Storage)

La plataforma debe permitir monitorear consumo, detectar necesidades, recomendar crecimiento y ajustar recursos.

## 10. Acceso a aplicaciones

Las aplicaciones operativas tendrán su propio dominio con formato: `{instanceId}.{organizationId}.farutech.app`

Ejemplo: `ins92832.org77282.farutech.app`

Este dominio representa: qué instancia es, a qué organización pertenece, qué aplicación debe cargar.

## 11. Actualizaciones automáticas

Farutech opera bajo modelo SaaS administrado.
Las organizaciones no administran versiones.
Cuando Farutech libera una actualización:
```
Nueva versión → Validaciones → Despliegue → Actualización instancias → Notificación cliente
```

## 12. Principios fundamentales de diseño

- **Reutilización**: Toda funcionalidad común debe convertirse en componente reutilizable
- **Independencia**: Cada aplicación debe poder evolucionar sin bloquear otras
- **Seguridad**: Toda operación sensible debe quedar controlada y auditada
- **Escalabilidad**: La plataforma debe poder crecer desde pocos clientes hasta operación empresarial
- **Automatización**: Los procesos repetitivos deben ser gestionados mediante herramientas automáticas
- **Evolución continua**: La plataforma debe permitir mejorar sin reconstrucciones completas