Tienes toda la razón. Una disculpa por saltar directamente a los artefactos sin antes cerrar formalmente la ambigüedad que la auditoría expuso. Como Principal PM, mi responsabilidad es establecer claridad total (SSOT - Única Fuente de Verdad) y asegurar que el proceso esté gobernado antes de escribir una sola línea de código.

A continuación, resuelvo ejecutivamente las preguntas pendientes de la auditoría basándome en un enfoque de máxima eficiencia, performance (Open Source) y calidad, y establezco el **Plan de Gobernanza Documental**. Luego, reflejo estas decisiones en los artefactos de producto obligatorios.

---

### A. RESOLUCIÓN EJECUTIVA DE PREGUNTAS (Auditoría §21)

1. **Naturaleza del proyecto:** Es un **Producto B2B Multi-tenant SaaS real**. La "arquitectura de referencia" o demos (como `finanzas_personales`) serán solo los primeros casos de uso para validar la plataforma.


2. **Alcance V1:** Dentro: Core multi-tenant, IAM centralizado, ruteo y un módulo base testeable. Fuera: Módulos de facturación (billing), IA orientada al cliente final.
3. **MediatR:** **Se descarta completamente.** Para garantizar latencias bajas y alto rendimiento comercial, usaremos arquitectura CQRS nativa con inyección de dependencias en .NET 10. Evitaremos el sobrecosto de rendimiento (overhead de reflexión) que genera MediatR.
4. **Modelo de identidad:** **Keycloak** (Open Source, OIDC/OAuth2 + MFA). Es gratuito, altamente escalable y elimina el riesgo de gestionar JWT asimétricos manualmente.
5. **Mapa de repositorios:** El mapa definido en `Part02.md` será el canónico. `Part09/11.md` serán deprecados y eliminados.
6. **Objetivos de negocio (KPIs):** Latencia <200ms en el 95% de las peticiones; Uptime de 99.9%; Tiempo de onboarding de nuevos tenants < 5 minutos.
7. **IA Nativa:** Para la V1, la IA será exclusivamente interna (Agentes de desarrollo/Qoder). En la V2 se expondrá como funcionalidad de producto.
8. **Stack Agentes IA:** Se adopta **Go (Golang)** para los workers por su superioridad en procesamiento concurrente y bajo consumo. Node.js queda eliminado de este pipeline.
9. **DoR / DoD Canónico:** Se establecerá un único estándar basado en pruebas automatizadas y BDD. Ninguna historia pasa a "Done" sin cobertura de automatización UI/API.
10. **ADR-001:** El archivo `001-modular-monolith.md` será el único canónico. El resto se elimina.
11. **Part12–15:** Si están vacíos, se eliminan inmediatamente para reducir ruido.
12. **BuenasPracticas:** Se auditará y convertirá en un repositorio de estándares técnicos gobernado, indexado y de cumplimiento obligatorio. No será una carpeta de referencias personales.
13. **Compliance:** Cumplimiento Top 10 OWASP estricto desde la V1. Las certificaciones formales ISO 27001/SOC 2 se auditarán en V2 para no frenar el Time-to-Market.
14. **Timeline:** MVP (Mes 1-3), V1 (Mes 4-6), V2 (Mes 7-9).
15. **Owners:** La "Architecture Office" recaerá en el Lead Architect y mi rol será CPO / Principal PM.
16. **RACI Gobernanza:** El Architecture Board aprueba estándares técnicos. Product Management (mi rol) aprueba los PRD y prioriza el backlog.
17. **EPIC-006 (Seguridad):** Se dividirá inmediatamente en Epics atómicos y testeables (Gestión IAM, Logging, Control de Acceso).

### B. PLAN MAESTRO DE GOBERNANZA DOCUMENTAL

Para detener el "meta-churn" reportado, ejecutaremos este plan de saneamiento (Sprint 0) antes del desarrollo:

1. **Purga de Duplicados (Día 1-2):** Eliminar todos los archivos duplicados byte-a-byte y las nomenclaturas dobles (PascalCase vs UPPERCASE). `FINAL_VERIFICATION.md` pasa a status "Superseded".


2. **Consolidación SSOT (Día 3-5):** Unificar la arquitectura en la estructura numerada definitiva. Se implementa el script `validate_structure.sh` en el pipeline de CI/CD para que cualquier PR que rompa los enlaces o duplique información sea rechazado automáticamente.


3. **Estandarización de Calidad (Día 6-7):** Establecer los pipelines de integración continua (CI) para validar que el DoD se cumpla obligatoriamente mediante automatización (Playwright para flujos E2E y pruebas de integración API).

---

Con la gobernanza y decisiones técnicas estabilizadas, presento la definición formal del producto.

### 1️⃣ PRODUCT REQUIREMENT DOCUMENT (PRD)

**Product Overview**
Farutech Cloud Platform Core es un núcleo fundacional SaaS B2B, basado en un monolito modular, diseñado para soportar aprovisionamiento instantáneo de múltiples clientes (multi-tenant) con un performance excepcional.

**Problem Statement**
El proyecto sufre de una parálisis por análisis y documentación inmanejable. Técnicamente, carece de un sistema base de identidad, aislamiento de datos y procesamiento en segundo plano que sea testeable, seguro y gratuito a nivel de licenciamiento para poder comercializar la plataforma de manera rentable.

**Goals**

* Soportar operaciones multi-tenant seguras y aisladas lógicamente en PostgreSQL.
* Implementar autenticación y gestión de accesos corporativos mediante Keycloak.
* Ejecutar un backend de ultra-bajo tiempo de respuesta utilizando CQRS puro (sin MediatR) en .NET 10 y Go para procesos asíncronos.
* Lograr una base documental y de requerimientos autoverificable en pipelines de CI/CD.



**Non Goals**

* Módulos de facturación (Billing).
* Implementación de IA expuesta a clientes finales en esta fase.
* Certificación oficial de normativas de seguridad (se preparará la arquitectura, pero la auditoría es post-V1).

**Stakeholders**

* Feifei (Principal Product Manager)
* Lead Architect & Architecture Board
* QA Automation Lead

**Users**

* **Platform Admin:** Encargado de la provisión y suspensión de clientes.
* **Tenant Admin:** Cliente B2B que administra usuarios dentro de su compañía.
* **Tenant User:** Consumidor final de los servicios habilitados por el Tenant Admin.

**Functional Requirements**

* **FR-1:** Capacidad de aislar registros por `Tenant_ID` en todas las consultas a bases de datos.
* **FR-2:** Redirección e integración nativa de login/logout con el servidor Keycloak.
* **FR-3:** Gestión de roles y aplicación de MFA forzado por el Tenant Admin.
* **FR-4:** Publicación y consumo de tareas pesadas hacia workers en Go mediante un message broker.

**Non Functional Requirements**

* **Performance:** La latencia del API Gateway no debe superar los 200ms en el percentil 95.
* **Seguridad:** Aislamiento de sesiones y protección CSRF/XSS según OWASP.
* **Testability:** Toda funcionalidad debe contar con cobertura de automatización (Playwright para E2E y pruebas unitarias/integración).
* **Escalabilidad:** Los workers en Go deben escalar horizontalmente basados en la longitud de las colas.

**Risks**

* Fricción inicial por la eliminación de librerías como MediatR y el cambio a patrones de inyección nativos.
* Desviaciones en el alcance de los workers asíncronos escritos en Golang.

**Success Metrics**

* Tiempo de despliegue y validación del entorno core: < 15 minutos.
* Cobertura de pruebas automatizadas E2E en CI/CD: > 85%.
* Número de incidentes de fugas de datos entre tenants: 0.

---

### 2️⃣ EPICS

* **EPIC-001: Implementación de Gobernanza y SSOT Documental**
Normalización del repositorio, purga de duplicados e implementación de validaciones en pipelines (CI).
* **EPIC-002: Core Multi-Tenancy Foundation**
Infraestructura base de aislamiento lógico, inyección de dependencias y CQRS nativo de alto rendimiento.
* **EPIC-003: Centralized Identity Management (IAM)**
Implementación y configuración de Keycloak como proveedor de OIDC/OAuth2 y MFA.

---

### 3️⃣ USER STORIES

**De EPIC-001**

* **US-1.1:** As a Lead Architect, I want the CI pipeline to automatically execute structural validations on documentation, So that duplicate files and broken links are prevented from being merged.

**De EPIC-002**

* **US-2.1:** As a Platform Component, I want to automatically inject and validate the Tenant ID from the request headers, So that database context is strictly scoped to the active tenant.
* **US-2.2:** As a Platform Admin, I want to create a new Tenant structure via an API endpoint, So that I can onboard new B2B clients immediately.

**De EPIC-003**

* **US-3.1:** As a Tenant User, I want to authenticate via a centralized Keycloak portal, So that my credentials are secure and I receive a valid OIDC token.
* **US-3.2:** As a Tenant Admin, I want to force all my organizational users to set up MFA, So that our internal data complies with baseline security policies.

---

### 4️⃣ ACCEPTANCE CRITERIA

**US-1.1: CI Documentation Validation**

* **Given** a developer opens a Pull Request modifying the `docs/` folder
* **When** the CI/CD pipeline is triggered
* **Then** the `validate_structure.sh` script must run successfully


* **And** the build must fail if any byte-to-byte duplicate files are detected.

**US-2.1: Tenant Context Injection**

* **Given** an incoming API request
* **When** the request is processed by the application middleware
* **Then** the system must extract the `X-Tenant-ID` header
* **And** validate that the current user's token contains claims for that specific Tenant
* **And** return a `403 Forbidden` if the user is attempting to access a different Tenant's context.

**US-3.1: Keycloak Authentication**

* **Given** an unauthenticated user navigates to the platform
* **When** they attempt to access a protected route
* **Then** the system must redirect them to the Keycloak login screen
* **And** upon entering correct credentials, redirect them back with a valid OAuth2 token payload.

**US-3.2: Mandatory MFA**

* **Given** a Tenant with the "MFA Required" policy active
* **When** a user from that Tenant logs in successfully with their password
* **Then** Keycloak must interrupt the flow and require a TOTP code
* **And** access to the platform must not be granted until the correct code is provided.

---

### 5️⃣ ROADMAP INICIAL

**MVP (Mes 1 - Mes 3: Limpieza y Cimentación)**

* Fase 0: Ejecución de purga documental y configuración de pipelines de validación CI/CD.
* Despliegue de infraestructura base: .NET 10 (CQRS nativo) y PostgreSQL.
* Implementación de Keycloak (EPIC-003) y creación lógica de Tenants (EPIC-002).
* Establecimiento del framework de automatización (Playwright E2E).

**V1 (Mes 4 - Mes 6: Funcionalidad de Negocio Base)**

* Introducción de procesamiento asíncrono con workers en Go.
* Despliegue de primer módulo comercial (gestión de recursos) como prueba piloto de aislamiento de datos.
* Refinamiento de métricas de rendimiento (<200ms de latencia).

**V2 (Mes 7 - Mes 9: Escalabilidad y Compliance)**

* Preparación técnica y auditorías formales para certificaciones SOC 2 e ISO 27001.
* Herramientas de "IA Nativa" como features directos para el cliente.
* Integración del módulo de billing automatizado.
