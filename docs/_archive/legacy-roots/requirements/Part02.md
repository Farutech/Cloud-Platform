# Documento Fundacional

# Farutech Cloud Platform

# Parte 2 — Organización Técnica, Repositorios y Modelo de Desarrollo

---

# 1. Estrategia general de repositorios

## 1.1 Decisión arquitectónica

Farutech no utilizará un único repositorio gigante con todo el ecosistema.

Aunque un monorepo facilita algunos escenarios, para el modelo planteado presenta problemas:

* Equipos diferentes modificando código no relacionado.
* Pipelines demasiado grandes.
* Dificultad para controlar permisos.
* Mayor riesgo de acoplamiento.
* Versionamiento complejo entre aplicaciones.

Debido a que Farutech tendrá:

* Portal.
* Plataforma core.
* Aplicaciones independientes.
* Paquetes reutilizables.
* Demos.
* Sitio público.
* Servicios.

se utilizará una estrategia:

# Polyrepo organizado dentro de una organización GitHub

La organización será:

```text
github.com/Farutech
```

Cada repositorio representa una capacidad o producto independiente.

---

# 2. Organización GitHub propuesta

Estructura inicial:

```text
Farutech


├── cloud-platform

├── website

├── demos


├── app-pos

├── app-erp

├── app-hotels

├── app-restaurants


├── package-frontend

├── package-dotnet

├── package-shared-contracts


├── service-identity

├── service-notifications

├── service-billing


├── worker-platform


└── documentation

```

---

# 3. Repositorio cloud-platform

Este es el núcleo administrativo de Farutech.

Responsabilidad:

Gestionar la plataforma.

Incluye:

* Portal administrativo.
* Organización.
* Usuarios.
* Instancias.
* Marketplace.
* Provisionamiento.
* Suscripciones.
* Seguridad.

No contiene:

* Código de aplicaciones de negocio.

Estructura:

```text
cloud-platform


/src


   /frontend

       portal administrativo


   /backend


       Identity

       Organizations

       Instances

       Marketplace

       Billing

       Authorization

       Audit


/tests


/docs


/docker


/deploy

```

---

# 4. Repositorio website

Responsabilidad:

Sitio público:

```text
farutech.com
```

Incluye:

* Página comercial.
* Servicios.
* Información.
* Landing pages.
* Contacto.
* Marketing.

No debe conocer:

* lógica SaaS.
* usuarios.
* organizaciones.

Estructura:

```text
website


/src


/assets


/public


/docs


```

---

# 5. Repositorios de aplicaciones

Cada aplicación es independiente.

Ejemplo:

```text
app-pos
```

Representa:

Producto:

POS

Puede contener:

* Frontend.
* Backend.
* Worker.
* Tests.
* Documentación.

Estructura:

```text
app-pos


/src


   /frontend

       React
       Vite
       TypeScript


   /backend

       .NET 10


   /worker

       Go



/tests


   /unit


   /integration


   /e2e



/docs


/docker


/deploy

```

---

# 6. Aplicaciones y equipos

Cada aplicación debe poder tener un equipo independiente.

Ejemplo:

Equipo POS:

```text
Product Owner

Backend Developers

Frontend Developers

QA

DevOps

```

Equipo ERP:

```text
Product Owner

Backend Developers

Frontend Developers

QA

```

No deben bloquearse.

---

# 7. Repositorios de paquetes reutilizables

Todo código común debe vivir fuera de las aplicaciones.

Nunca:

```text
app-pos


/src/shared

```

porque después se duplica.

Debe existir:

```text
package-frontend

package-dotnet

package-contracts

```

---

# 8. Paquetes Frontend

Tecnología:

```text
React

TypeScript

Vite
```

Ejemplo:

```text
package-frontend
```

Contiene:

```text
/src


/ui


   Button

   Table

   Modal


/auth


/api-client


/forms


/theme

```

Publicación:

NPM privado:

```text
@farutech/ui
@farutech/auth
@farutech/sdk

```

---

# 9. Paquetes Backend

Tecnología:

```text
.NET 10
```

Ejemplo:

```text
package-dotnet
```

Contiene:

```text
Farutech.Security

Farutech.Logging

Farutech.Database

Farutech.MultiTenancy

Farutech.Messaging

```

Publicación:

NuGet:

```text
Farutech.Security

Farutech.Tenant

Farutech.Messaging

```

---

# 10. Contratos compartidos

Debido a que existirán comunicaciones entre aplicaciones:

Ejemplo:

POS → ERP

No deben compartir código directamente.

Usarán contratos:

```text
package-shared-contracts

```

Ejemplo:

Evento:

```json
InvoiceCreated


{

 invoiceId:"123",

 customerId:"456",

 total:500

}

```

---

# 11. Comunicación entre aplicaciones

No se recomienda:

```text
POS

|

API directa

|

ERP

```

Porque genera dependencia.

Modelo recomendado:

```text
Aplicación A


     |

Evento


     |

Message Broker


     |

Worker


     |

Aplicación B

```

---

# 12. Worker Platform

Repositorio:

```text
worker-platform
```

Responsabilidad:

* Colas.
* Procesamiento.
* Flujos.
* Reintentos.
* Estados.

Tecnología:

```text
Go
```

Ejemplo:

Proceso:

```text
Factura creada


Estado:

PENDING


Worker procesa


Estado:

PROCESSING


Final:

COMPLETED

```

---

# 13. Documentación

Repositorio:

```text
documentation

```

Debe contener:

```text
documentation


/architecture


/product


/development


/security


/devops


/agents


/tasks


/decisions


```

---

# 14. Documentación obligatoria

Cada aplicación debe tener:

## README.md

Debe explicar:

* Qué hace.
* Cómo ejecutar.
* Arquitectura.
* Dependencias.

---

## ARCHITECTURE.md

Debe explicar:

* Componentes.
* Flujos.
* Integraciones.

---

## CHANGELOG.md

Cambios por versión.

---

## DECISIONS.md

Registro de decisiones técnicas.

Ejemplo:

```text
ADR-001

Decisión:

Usar PostgreSQL

Motivo:

Multi tenant mediante schemas

Fecha:

2026-07

```

---

# 15. Estructura documental general

```text
documentation


01-product


   Vision

   Roadmap

   Marketplace


02-architecture


   Platform

   Security

   MultiTenant


03-development


   Standards

   Coding


04-tasks


   Epics

   Features

   Stories


05-agents


   AI Roles

   Prompts


06-operations


   Deployment

   Monitoring

```

---

# 16. Gestión del trabajo

No se deben crear tareas directamente.

Jerarquía:

```text
Vision


 |

Epic


 |

Feature


 |

User Story


 |

Task


 |

Subtask

```

---

# 17. Epic

Representa una capacidad grande.

Ejemplo:

```text
EPIC:

Sistema de identidad empresarial

```

Incluye:

* Login.
* Usuarios.
* Roles.
* Permisos.
* Seguridad.

---

# 18. Feature

Representa una funcionalidad.

Ejemplo:

```text
Feature:

Login con Microsoft

```

---

# 19. User Story

Formato:

```text
Como:

usuario administrador


Quiero:

crear una instancia


Para:

habilitar una aplicación SaaS

```

---

# 20. Task técnica

Ejemplo:

```text
Implementar endpoint creación instancia


Incluye:

POST /instances


Validaciones

Tests

Documentación

```

---

# 21. Definition of Ready (DoR)

Una tarea solo inicia cuando:

Debe tener:

* Objetivo claro.
* Alcance definido.
* Criterios aceptación.
* Diseño aprobado.
* Dependencias identificadas.
* Riesgos conocidos.

---

# 22. Definition of Done (DoD)

Una tarea está terminada cuando:

Código:

✓ Implementado

✓ Revisado

Testing:

✓ Unit tests

✓ Integration tests

✓ E2E cuando aplique

Calidad:

✓ Sin vulnerabilidades críticas

✓ Documentación actualizada

Operación:

✓ Pipeline exitoso

✓ Desplegable

Producto:

✓ Criterios aceptación cumplidos

---

# 23. Modelo de equipos

Se recomienda un modelo inspirado en:

* SAFe.
* Team Topologies.
* Spotify.

Adaptado:

## Platform Team

Responsable:

* Core.
* Seguridad.
* Infraestructura.
* Estándares.

---

## Product Teams

Ejemplo:

Equipo POS.

Responsable:

* Producto.
* Código.
* Evolución.

---

## Enablement Teams

Responsables:

* QA.
* DevOps.
* Arquitectura.
* Automatización.

---

# 24. Principio de autonomía

Cada equipo debe poder:

* Desarrollar.
* Probar.
* Publicar.
* Desplegar.

Sin esperar cambios manuales de otros equipos.

---

# 25. Estado final de organización

```text
Farutech


cloud-platform

website

demos


app-pos

app-erp

app-hotels


packages


services


workers


documentation

```

---

Con esta Parte 2 queda definido:

✅ estrategia Git
✅ repositorios
✅ separación equipos
✅ aplicaciones
✅ paquetes
✅ documentación
✅ gestión producto-desarrollo
✅ tareas
✅ equipos

La siguiente parte será:

# Parte 3 — Estándares de ingeniería y ejecución

Incluyendo:

* Arquitectura frontend.
* Microfrontend.
* Backend .NET.
* Workers Go.
* PostgreSQL multi-tenant.
* Seguridad.
* Roles/permisos.
* CI/CD.
* Ambientes.
* Docker.
* Coolify.
* Migración futura Azure/Kubernetes.
* Testing.
* Performance.
* Observabilidad.
