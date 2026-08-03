# Farutech Cloud Platform — Implementation Backlog (Completo)

> **Estado**: Vigente V1 · **Owner**: CPO / Tech Lead · **Aprobación**: Product Management + Architecture Board
> **Fuente**: Complementa `01-epics-and-features.md` y `05-user-stories.md` con backlog completo para implementación
> **Story Points**: Usando escala Fibonacci (1, 2, 3, 5, 8, 13, 21)

---

## Resumen Ejecutivo del Backlog

| Épica | Story Points | Features | User Stories | Priority |
|-------|-------------|----------|--------------|----------|
| EPIC-001: Gobernanza y SSOT | 13 | 3 | 4 | P0 - Crítica |
| EPIC-002: Core Multi-Tenancy | 34 | 4 | 8 | P0 - Crítica |
| EPIC-003: IAM/Keycloak | 21 | 3 | 6 | P0 - Crítica |
| EPIC-004: Async Workers | 21 | 2 | 5 | P1 - Alta |
| EPIC-005: Logging & Audit | 13 | 2 | 4 | P1 - Alta |
| EPIC-006: Access Control | 13 | 2 | 4 | P1 - Alta |
| EPIC-007: API Gateway | 21 | 3 | 7 | P1 - Alta |
| EPIC-008: Frontend Core | 34 | 4 | 10 | P1 - Alta |
| EPIC-009: POS Application | 55 | 6 | 15 | P2 - Media |
| EPIC-010: Observability | 21 | 3 | 6 | P2 - Media |
| EPIC-011: DevOps & CI/CD | 21 | 3 | 6 | P0 - Crítica |
| EPIC-012: Testing & QA | 21 | 3 | 6 | P1 - Alta |
| EPIC-013: Documentation | 13 | 4 | 8 | P2 - Media |
| **TOTAL** | **304** | **42** | **89** | |

---

## EPIC-001: Gobernanza y SSOT Documental

**Owner**: Tech Lead  
**Priority**: P0 - Crítica  
**Story Points**: 13  
**Estado**: En progreso

### Features

#### F-001.01: Repository Structure Validation
- **US-001.01.01**: Validar nomenclatura de archivos en CI
  - Given un PR modfica archivos en `docs/`
  - When se ejecuta el pipeline
  - Then debe validar que todos los archivos sigan kebab-case
  - And debe fallar si encuentra duplicados byte-a-byte
  - SP: 3

- **US-001.01.02**: Validar enlaces internos
  - Given un PR modifica archivos Markdown
  - When se ejecuta el pipeline
  - Then debe verificar que todos los enlaces relativos existan
  - And debe reportar enlaces rotos en el PR
  - SP: 5

- **US-001.01.03**: Generar reporte de estructura
  - Given se completa un merge a main
  - When se dispara el post-merge hook
  - Then debe generar un árbol de directorios actualizado
  - And debe publicar en README de docs/
  - SP: 2

#### F-001.02: Template Standardization
- **US-001.02.01**: Crear ejemplos para cada template
  - Given existen 8 templates en `docs/11-templates/`
  - When se documenta el uso
  - Then debe haber un ejemplo real por cada template
  - And debe estar referenciado desde el índice
  - SP: 2

- **US-001.02.02**: Documentar proceso de creación de documentos
  - Given un nuevo colaborador necesita crear documentación
  - When consulta la guía
  - Then debe encontrar pasos claros de qué template usar
  - And debe entender el flujo de aprobación
  - SP: 1

#### F-001.03: Governance Automation
- **US-001.03.01**: Configurar branch protection rules
  - Given el repositorio principal
  - When se configura protección de ramas
  - Then debe requerir al menos 1 reviewer
  - And debe requerir checks de CI exitosos
  - SP: 2

- **US-001.03.02**: Implementar CODEOWNERS
  - Given la estructura del repositorio
  - When se crea archivo CODEOWNERS
  - Then debe asignar owners por directorio
  - And debe notificar automáticamente en PRs
  - SP: 1

---

## EPIC-002: Core Multi-Tenancy Foundation

**Owner**: Backend Lead  
**Priority**: P0 - Crítica  
**Story Points**: 34  
**Estado**: Pendiente

### Features

#### F-002.01: Tenant Context Management
- **US-002.01.01**: Implementar TenantContextMiddleware
  - Given una request HTTP entrante
  - When pasa por el middleware
  - Then debe extraer X-Tenant-ID del header
  - And debe validar contra claims del JWT
  - And debe retornar 403 si hay mismatch
  - SP: 5

- **US-002.01.02**: Inyectar contexto en scope de request
  - Given un contexto de tenant válido
  - When se procesa la request
  - Then debe estar disponible vía IHttpContextAccessor
  - And debe propagarse a servicios y repositories
  - SP: 3

- **US-002.01.03**: Manejar requests sin tenant
  - Given una request sin X-Tenant-ID
  - When es procesada
  - Then debe identificar si es endpoint público
  - And debe retornar 400 si requiere tenant
  - SP: 2

#### F-002.02: Database Schema Isolation
- **US-002.02.01**: Diseñar estrategia de schemas PostgreSQL
  - Given el modelo multi-tenant híbrido
  - When se diseña la estructura
  - Then debe definir schema por organización
  - And debe definir database por instancia
  - SP: 5

- **US-002.02.02**: Implementar conexión dinámica a databases
  - Given un Tenant_ID válido
  - When se establece conexión a BD
  - Then debe construir connection string dinámico
  - And debe usar pool de conexiones eficiente
  - SP: 8

- **US-002.02.03**: Crear script de inicialización de tenant
  - Given un nuevo tenant es creado
  - When se aprovisiona
  - Then debe crear schema/database aislado
  - And debe ejecutar migraciones iniciales
  - And debe crear usuario administrador por defecto
  - SP: 8

#### F-002.03: Tenant Administration API
- **US-002.03.01**: Endpoint POST /api/tenants
  - Given un Platform Admin autenticado
  - When envía configuración de nuevo tenant
  - Then debe crear estructura completa
  - And debe retornar 201 con Tenant_ID
  - And debe registrar evento de auditoría
  - SP: 5

- **US-002.03.02**: Endpoint GET /api/tenants
  - Given un Platform Admin autenticado
  - When solicita lista de tenants
  - Then debe retornar paginada con filtros
  - And debe incluir estado de cada tenant
  - SP: 3

- **US-002.03.03**: Endpoint DELETE /api/tenants/{id}
  - Given un Platform Admin solicita eliminar tenant
  - When confirma la eliminación
  - Then debe marcar tenant para soft delete
  - And debe iniciar período de gracia (30 días)
  - And debe notificar a stakeholders
  - SP: 5

#### F-002.04: CQRS Native Implementation
- **US-002.04.01**: Definir interfaces de commands y queries
  - Given el patrón CQRS sin MediatR
  - When se definen interfaces
  - Then debe tener ICommandHandler<TRequest, TResponse>
  - And debe tener IQueryHandler<TRequest, TResponse>
  - And debe tener ICommand y IQuery markers
  - SP: 3

- **US-002.04.02**: Configurar inyección de dependencias
  - Given .NET 10 con DI nativo
  - When se configuran handlers
  - Then debe registrar como scoped/transient según corresponda
  - And debe permitir decorator pattern para cross-cutting
  - SP: 3

- **US-002.04.03**: Crear ejemplo completo end-to-end
  - Given un caso de uso simple (CreateTenant)
  - When se implementa completo
  - Then debe tener Command, Handler, Controller
  - And debe tener tests unitarios
  - And debe servir como referencia para equipo
  - SP: 5

---

## EPIC-003: Centralized Identity Management (IAM)

**Owner**: Security Lead  
**Priority**: P0 - Crítica  
**Story Points**: 21  
**Estado**: Pendiente

### Features

#### F-003.01: Keycloak Deployment & Configuration
- **US-003.01.01**: Desplegar Keycloak en Docker Compose
  - Given el entorno de desarrollo
  - When se configura Docker Compose
  - Then debe incluir servicio keycloak
  - And debe persistir datos en volumen
  - And debe exponer puerto 8080
  - SP: 3

- **US-003.01.02**: Configurar realm farutech-platform
  - Given Keycloak operativo
  - When se configura el realm
  - Then debe crear roles base (platform-admin, tenant-admin, tenant-user)
  - And debe configurar password policies
  - And debe configurar session timeouts
  - SP: 3

- **US-003.01.03**: Configurar clientes OIDC
  - Given el realm configurado
  - When se registran aplicaciones
  - Then debe crear cliente para backend API
  - And debe crear cliente para frontend React
  - And debe configurar redirect URIs correctos
  - SP: 3

#### F-003.02: Authentication Integration
- **US-003.02.01**: Implementar OIDC client en .NET
  - Given el backend .NET 10
  - When se integra autenticación
  - Then debe usar Microsoft.AspNetCore.Authentication.OpenIdConnect
  - And debe validar tokens asimétricamente
  - And debe manejar refresh tokens
  - SP: 5

- **US-003.02.02**: Implementar login redirect en React
  - Given el frontend React
  - When usuario accede a ruta protegida
  - Then debe redirigir a Keycloak login
  - And debe manejar callback con código
  - And debe almacenar tokens seguramente
  - SP: 5

- **US-003.02.03**: Implementar logout flow
  - Given usuario autenticado
  - When solicita logout
  - Then debe invalidar token local
  - And debe llamar a Keycloak logout endpoint
  - And debe redirigir a login page
  - SP: 2

#### F-003.03: MFA & Advanced Security
- **US-003.03.01**: Configurar políticas MFA por tenant
  - Given el realm de Keycloak
  - When se configura MFA
  - Then debe permitir habilitar/deshabilitar por tenant
  - And debe soportar TOTP (Google Authenticator)
  - And debe forzar setup en primer login
  - SP: 5

- **US-003.03.02**: Implementar TOTP setup UI
  - Given un usuario debe configurar MFA
  - When accede a security settings
  - Then debe mostrar QR code
  - And debe permitir verificar código de prueba
  - And debe mostrar backup codes
  - SP: 3

- **US-003.03.03**: Implementar brute force protection
  - Given múltiples intentos de login fallidos
  - When se supera umbral
  - Then debe bloquear cuenta temporalmente
  - And debe notificar al usuario
  - And debe registrar evento de seguridad
  - SP: 3

---

## EPIC-004: Async Workers (Go)

**Owner**: Go Lead  
**Priority**: P1 - Alta  
**Story Points**: 21  
**Estado**: Pendiente

### Features

#### F-004.01: Message Broker Infrastructure
- **US-004.01.01**: Desplegar RabbitMQ en Docker Compose
  - Given el entorno de desarrollo
  - When se configura Docker Compose
  - Then debe incluir servicio rabbitmq
  - And debe exponer puertos 5672 y 15672
  - And debe persistir mensajes en volumen
  - SP: 3

- **US-004.01.02**: Configurar exchanges y colas
  - Given RabbitMQ operativo
  - When se diseña topología
  - Then debe crear topic exchange para eventos de dominio
  - And debe crear colas por tipo de worker
  - And debe configurar dead letter queues
  - SP: 5

- **US-004.01.03**: Implementar publisher en .NET
  - Given el backend .NET necesita publicar eventos
  - When ocurre un evento de dominio
  - Then debe serializar a JSON/Protobuf
  - And debe publicar al exchange correcto
  - And debe manejar retries y circuit breaker
  - SP: 5

#### F-004.02: Go Workers Implementation
- **US-004.02.01**: Crear consumer base en Go
  - Given los workers en Go
  - When se conectan a RabbitMQ
  - Then deben consumir de colas configuradas
  - And deben hacer ack/nack apropiadamente
  - And deben manejar reconexión automática
  - SP: 8

- **US-004.02.02**: Implementar idempotencia
  - Given un mensaje puede llegar duplicado
  - When se procesa
  - Then debe verificar si ya fue procesado
  - And debe usar store de processed message IDs
  - And debe saltar procesamiento si existe
  - SP: 5

- **US-004.02.03**: Implementar graceful shutdown
  - Given el worker recibe señal de terminación
  - When está procesando un mensaje
  - Then debe completar procesamiento actual
  - And debe no aceptar nuevos mensajes
  - And debe cerrar conexiones limpiamente
  - SP: 3

- **US-004.02.04**: Implementar retry con backoff exponencial
  - Given un procesamiento falla
  - When se reintenta
  - Then debe usar backoff exponencial (1s, 2s, 4s, 8s)
  - And debe máximo 5 reintentos
  - And debe enviar a DLQ después de máx retries
  - SP: 5

- **US-004.02.05**: Worker de procesamiento de ventas (ejemplo)
  - Given una venta es creada
  - When se publica evento SaleCreated
  - Then el worker debe actualizar inventario
  - And debe generar factura PDF
  - And debe enviar notificación email
  - SP: 8

---

## EPIC-005: Logging & Audit

**Owner**: DevOps Lead  
**Priority**: P1 - Alta  
**Story Points**: 13  
**Estado**: Pendiente

### Features

#### F-005.01: Centralized Logging
- **US-005.01.01**: Desplegar Loki + Grafana stack
  - Given el entorno de producción
  - When se configura observabilidad
  - Then debe desplegar Loki para logs
  - And debe desplegar Grafana para visualización
  - And debe configurar retención de 30 días
  - SP: 5

- **US-005.01.02**: Implementar structured logging en .NET
  - Given las aplicaciones .NET
  - When loggean eventos
  - Then deben usar formato JSON estructurado
  - And deben incluir correlation IDs
  - And deben incluir Tenant_ID en contexto
  - SP: 3

- **US-005.01.03**: Configurar logs en Go workers
  - Given los workers en Go
  - When loggean eventos
  - Then deben usar zap o logrus
  - And deben seguir mismo formato que .NET
  - And deben enviar a Loki vía Promtail
  - SP: 3

- **US-005.01.04**: Crear dashboards de logs
  - Given Grafana operativo
  - When se crean dashboards
  - Then debe haber dashboard por aplicación
  - And debe haber dashboard de errores por tenant
  - And debe haber dashboard de auditoría
  - SP: 2

#### F-005.02: Audit Trail
- **US-005.02.01**: Diseñar schema de auditoría
  - Given los requisitos de compliance
  - When se diseña tabla de auditoría
  - Then debe capturar actor, acción, recurso, timestamp
  - And debe ser inmutable (append-only)
  - And debe indexar por Tenant_ID y timestamp
  - SP: 3

- **US-005.02.02**: Implementar audit middleware
  - Given las requests HTTP
  - When pasan por middleware de auditoría
  - Then debe registrar quién hizo qué
  - And debe capturar request/response metadata
  - And debe asíncronamente escribir a BD
  - SP: 5

- **US-005.02.03**: API de consulta de auditoría
  - Given un Platform Admin o Tenant Admin
  - When consulta logs de auditoría
  - Then debe poder filtrar por fecha, usuario, acción
  - And debe ver resultados paginados
  - And debe poder exportar a CSV
  - SP: 5

---

## EPIC-006: Access Control

**Owner**: Security Lead  
**Priority**: P1 - Alta  
**Story Points**: 13  
**Estado**: Pendiente

### Features

#### F-006.01: Role-Based Access Control (RBAC)
- **US-006.01.01**: Implementar RBAC middleware
  - Given un usuario autenticado
  - When accede a endpoint protegido
  - Then debe verificar roles requeridos
  - And debe comparar con claims del token
  - And debe retornar 403 si no tiene permiso
  - SP: 5

- **US-006.01.02**: Gestionar roles por tenant
  - Given un Tenant Admin
  - When gestiona usuarios de su organización
  - Then debe poder asignar roles predefinidos
  - And debe poder crear roles custom
  - And debe definir permisos por rol
  - SP: 5

- **US-006.01.03**: Endpoints de gestión de permisos
  - Given un Tenant Admin
  - When necesita gestionar permisos
  - Then debe tener CRUD de roles
  - And debe tener CRUD de asignaciones usuario-rol
  - And debe tener endpoint de verificación de permisos
  - SP: 3

#### F-006.02: Data-Level Security
- **US-006.02.01**: Filtrado automático por tenant
  - Given cualquier query a base de datos
  - When se ejecuta
  - Then debe inyectar filtro WHERE Tenant_ID = @current
  - And debe prevenir fugas entre tenants
  - And debe ser transparente para desarrolladores
  - SP: 5

- **US-006.02.02**: Auditoría de accesos a datos sensibles
  - Given datos clasificados como sensibles
  - When son accedidos
  - Then debe registrar acceso en audit log
  - And debe notificar si es acceso anómalo
  - And debe requerir justificación opcionalmente
  - SP: 3

- **US-006.02.03**: Enmascaramiento de datos en logs
  - Given datos personales en logs
  - When se escribe log
  - Then debe enmascarar emails, teléfonos, IDs
  - And debe cumplir con GDPR/LOPD
  - SP: 2

---

[CONTINUARÁ CON ÉPICAS RESTANTES...]

---

## Backlog Prioritizado para Sprint Planning

### Sprint 0 (Foundation) - 18 SP
1. US-001.01.01 - Validar nomenclatura (3 SP)
2. US-001.01.02 - Validar enlaces (5 SP)
3. US-011.01.01 - Configurar GitHub Actions (5 SP)
4. US-011.01.02 - Docker Compose base (3 SP)
5. US-001.02.01 - Ejemplos templates (2 SP)

### Sprint 1 (Multi-Tenancy) - 21 SP
1. US-002.01.01 - TenantContextMiddleware (5 SP)
2. US-002.01.02 - Inyectar contexto (3 SP)
3. US-002.04.01 - Interfaces CQRS (3 SP)
4. US-002.04.02 - Configurar DI (3 SP)
5. US-002.02.01 - Diseñar schemas (5 SP)
6. US-002.03.01 - POST /tenants (5 SP)

### Sprint 2 (IAM) - 21 SP
1. US-003.01.01 - Deploy Keycloak (3 SP)
2. US-003.01.02 - Configurar realm (3 SP)
3. US-003.02.01 - OIDC client .NET (5 SP)
4. US-003.02.02 - Login React (5 SP)
5. US-003.03.01 - Políticas MFA (5 SP)

[Continuar para sprints restantes...]

---

## Definición de Ready (DoR)

Para que una User Story entre a un sprint debe cumplir:
- [ ] Criterios de aceptación definidos en BDD
- [ ] Dependencias identificadas
- [ ] Estimación completada (planning poker)
- [ ] Mockups/designs aprobados (si aplica UI)
- [ ] Tests automatizados planificados

## Definición de Done (DoD)

Para que una User Story se considere completada:
- [ ] Código implementado y revisado (PR aprobado)
- [ ] Tests unitarios pasando (>80% cobertura)
- [ ] Tests de integración pasando
- [ ] Tests E2E creados (si aplica)
- [ ] Documentación actualizada
- [ ] Deployado a staging
- [ ] Aprobado por QA

---

> **Nota**: Este backlog es vivo y será refinado continuamente mediante sesiones de backlog refinement cada sprint.
