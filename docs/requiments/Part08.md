# Documento Fundacional

# Cloud Platform

# Parte 8 — Modelo de Operación de la Plataforma (Platform Operations Model)

---

# 1. Introducción

Cloud Platform no es únicamente un conjunto de aplicaciones desplegadas en la nube. Es una plataforma de servicios administrados cuyo propósito es permitir que organizaciones de diferentes tamaños consuman, administren y evolucionen múltiples soluciones de negocio desde un único ecosistema.

La operación de la plataforma debe garantizar que cada organización pueda administrar sus aplicaciones, usuarios, permisos, planes y recursos de forma segura, autónoma y escalable, mientras que Farutech conserva la capacidad de operar, monitorear y evolucionar todo el ecosistema sin afectar la continuidad del servicio.

Este modelo define cómo se administran las organizaciones, las instancias, las aplicaciones, los planes, la infraestructura, la seguridad, el soporte y el ciclo de vida operativo de la plataforma.

---

# 2. Principios Operativos

Toda capacidad operativa deberá respetar los siguientes principios:

* **Autoservicio controlado:** las organizaciones podrán gestionar la mayoría de sus recursos sin intervención de Farutech.
* **Seguridad por defecto:** cualquier operación sensible requerirá mecanismos adicionales de validación.
* **Operación centralizada:** la administración de la plataforma se realiza desde un único portal.
* **Aislamiento lógico:** cada organización y cada instancia estarán completamente aisladas a nivel de datos y configuración.
* **Escalabilidad progresiva:** la plataforma deberá crecer sin requerir rediseños radicales.
* **Automatización primero:** toda tarea repetitiva deberá automatizarse.
* **Observabilidad completa:** toda operación crítica será registrada, monitoreada y auditada.

---

# 3. Componentes Operativos

La operación de la plataforma se estructura en varios dominios funcionales:

* Portal de Administración.
* Gestión de Identidad.
* Gestión de Organizaciones.
* Gestión de Instancias.
* Marketplace.
* Catálogo de Aplicaciones.
* Gestión de Planes.
* Facturación.
* Infraestructura.
* Observabilidad.
* Soporte.
* Seguridad.
* Operaciones Programadas.
* Actualizaciones.
* Continuidad del Negocio.

Cada uno constituye un módulo independiente de la plataforma, con responsabilidades y APIs claramente definidas.

---

# 4. Portal de Administración (`portal.farutech.com`)

El Portal de Administración es el punto central de gestión de la plataforma.

Su responsabilidad es exclusivamente administrativa; no ejecuta la lógica de negocio de las aplicaciones ni carga microfrontends funcionales.

Desde este portal, un usuario podrá:

* registrarse e iniciar sesión;
* autenticarse mediante credenciales locales o proveedores externos (Microsoft, Google y otros futuros);
* crear y administrar organizaciones;
* gestionar usuarios y roles;
* administrar instancias;
* contratar aplicaciones;
* seleccionar planes;
* revisar consumo y facturación;
* consultar auditorías;
* administrar integraciones;
* gestionar soporte;
* revisar notificaciones;
* configurar preferencias de seguridad.

Cuando un usuario accede a una aplicación, el portal resuelve la información de contexto (usuario, organización, instancia, permisos y configuración) y redirige al dominio correspondiente, donde se carga el microfrontend asociado.

---

# 5. Gestión de Organizaciones

La organización representa la entidad administrativa principal del cliente.

Cada organización puede corresponder a una empresa, una fundación, una institución o cualquier otra entidad jurídica.

Las organizaciones podrán estructurarse jerárquicamente, permitiendo escenarios como:

```text
Coca-Cola Global
├── Colombia
│   ├── Bogotá
│   └── Medellín
├── México
└── Venezuela
```

Esta jerarquía facilitará la delegación administrativa, la consolidación de información y la gestión multinacional.

---

# 6. Gestión de Instancias

Una instancia representa una implementación específica de una aplicación dentro de una organización.

Una organización podrá tener múltiples instancias de la misma aplicación.

Ejemplo:

```text
Organización: Restaurante XYZ

POS - Caja Principal

POS - Domicilios

POS - Food Truck

ERP Administrativo
```

Cada instancia tendrá:

* identificador único;
* nombre visible configurable;
* aplicación asociada;
* versión instalada;
* plan contratado;
* modalidad de infraestructura;
* configuración específica;
* recursos asignados;
* estado operativo;
* historial de cambios.

---

# 7. Marketplace

El Marketplace constituye el catálogo central de aplicaciones disponibles.

No debe entenderse como una tienda pública, sino como un asistente para la creación de nuevas instancias.

El flujo general será:

1. Seleccionar organización.
2. Buscar aplicación.
3. Verificar elegibilidad (aplicación pública o privada).
4. Seleccionar plan.
5. Elegir modalidad de infraestructura (Shared o Dedicated).
6. Configurar parámetros iniciales.
7. Aprovisionar la instancia.

Las aplicaciones desarrolladas exclusivamente para un cliente también estarán presentes en el Marketplace, pero únicamente serán visibles para las organizaciones autorizadas.

---

# 8. Gestión de Planes y Funcionalidades

Cada aplicación define uno o más planes comerciales.

Un plan determina:

* módulos habilitados;
* funcionalidades disponibles;
* límites operativos (usuarios, almacenamiento, transacciones, etc.);
* integraciones incluidas;
* capacidad de personalización;
* modalidad de soporte;
* precio.

La habilitación de funcionalidades se realizará mediante capacidades declarativas, evitando lógica condicional distribuida por el código.

---

# 9. Modalidades de Infraestructura

La plataforma ofrecerá inicialmente dos modalidades de despliegue:

### Shared

Las instancias comparten infraestructura física y lógica controlada por la plataforma.

Cada organización mantiene aislamiento mediante:

* esquemas independientes en PostgreSQL;
* configuración propia;
* aislamiento de datos;
* políticas de seguridad.

Esta modalidad optimiza costos y está orientada a la mayoría de los clientes.

### Dedicated

La organización dispone de infraestructura exclusiva para la instancia.

Incluye:

* contenedores dedicados;
* base de datos dedicada;
* recursos independientes;
* posibilidad de escalado personalizado.

Esta modalidad está orientada a clientes con mayores requerimientos de rendimiento, cumplimiento normativo o aislamiento.

La modalidad podrá cambiarse durante el ciclo de vida de una instancia mediante procesos de migración controlados.

---

# 10. Gestión de Identidad y Acceso

La plataforma implementará un modelo de identidad centralizado.

Características principales:

* autenticación única (Single Sign-On);
* proveedores externos de identidad;
* autenticación multifactor;
* sesiones centralizadas;
* revocación de sesiones;
* administración de dispositivos;
* políticas de contraseña configurables.

La autorización combinará modelos RBAC y ABAC, permitiendo asignar permisos mediante roles enriquecidos con atributos contextuales.

---

# 11. Operación de Microfrontends

Cada aplicación se ejecutará en su propio dominio, por ejemplo:

```
<instancia>.<organización>.farutech.app
```

Al acceder desde el portal:

1. se valida la sesión;
2. se resuelve el contexto del usuario;
3. se genera un token de acceso de corta duración;
4. se redirige al dominio de la instancia;
5. el contenedor carga dinámicamente el microfrontend correspondiente.

Si el acceso es directo y no existe una sesión válida, el usuario deberá autenticarse antes de acceder.

---

# 12. Actualizaciones de Plataforma

Todas las instancias reciben actualizaciones automáticas.

Las organizaciones son notificadas previamente cuando el cambio pueda tener impacto funcional.

Las actualizaciones seguirán un proceso controlado:

1. validación automática;
2. despliegue progresivo;
3. monitoreo;
4. verificación posterior;
5. notificación de resultado.

El objetivo es minimizar interrupciones y garantizar la compatibilidad entre versiones.

---

# 13. Observabilidad

La plataforma deberá proporcionar observabilidad integral mediante:

* registros centralizados;
* métricas de rendimiento;
* trazabilidad distribuida;
* monitoreo de infraestructura;
* monitoreo funcional;
* auditoría de acciones críticas;
* alertas automáticas.

Cada evento relevante deberá asociarse a la organización, la instancia y el usuario que lo originó.

---

# 14. Soporte y Acceso Delegado

El acceso del equipo de soporte a una organización estará estrictamente controlado.

El modelo recomendado es el de **acceso delegado bajo aprobación**:

1. el cliente solicita soporte o autoriza una intervención;
2. un usuario con privilegios suficientes aprueba el acceso;
3. se concede un acceso temporal y limitado;
4. todas las acciones quedan auditadas;
5. el acceso se revoca automáticamente al finalizar la intervención.

Este enfoque reduce riesgos y mejora la trazabilidad.

---

# 15. Continuidad del Negocio

La plataforma deberá contemplar mecanismos para garantizar la continuidad del servicio:

* copias de seguridad automatizadas;
* restauración de instancias;
* duplicación de entornos;
* planes de recuperación ante desastres (DRP);
* pruebas periódicas de restauración;
* monitoreo de capacidad;
* escalado controlado.

---

# 16. Objetivo Final

El modelo de operación tiene como propósito ofrecer una plataforma administrada, segura y altamente automatizada, donde las organizaciones puedan concentrarse en el uso de sus aplicaciones mientras Farutech gestiona la complejidad técnica de la infraestructura, la seguridad y la evolución del ecosistema.

La operación debe escalar desde los primeros clientes alojados en una infraestructura basada en Docker Compose y Coolify hasta un entorno empresarial distribuido sobre Kubernetes o servicios administrados en la nube, manteniendo una experiencia consistente para usuarios, equipos de soporte y desarrolladores.

---

## Lo que sigue: Parte 9 — Kit de Arranque de Ejecución

A partir de este punto dejaríamos el plano conceptual y entraríamos en la ejecución. La Parte 9 ya no definiría principios, sino artefactos concretos para comenzar el desarrollo desde el primer día, incluyendo:

* Arquitectura definitiva de repositorios (código, documentación y conocimiento).
* Estructura de directorios de cada repositorio.
* Backlog inicial (épicas, features e historias).
* ADR fundacionales.
* Plantillas para especificaciones, RFC y ADR.
* Pipeline base de GitHub Actions.
* Estrategia de versionado y publicación de paquetes.
* Organización de agentes de IA y prompts base.
* Flujo de trabajo completo en Qoder/Qwen.
* Checklists para crear nuevas aplicaciones, paquetes, integraciones y despliegues.

Esa parte será el puente entre el manual fundacional y el inicio efectivo de la construcción de la plataforma.
