# Farutech Cloud Platform — Implementation Roadmap (Detailed)

> **Estado**: Vigente V1 · **Owner**: Tech Lead / Principal Engineer · **Aprobación**: Architecture Board + Product Management
> **Timeline**: 24 semanas (6 meses) dividido en 4 fases macro
> **Dependencia**: Este documento complementa `02-roadmap-tasks.md` con detalle sprint-by-sprint

---

## Visión General del Roadmap

| Fase | Duración | Sprints | Objetivo Principal |
|------|----------|---------|-------------------|
| **Fase 0: Foundation** | 2 semanas | Sprint 0 | Setup infraestructura, CI/CD, onboarding equipo |
| **Fase 1: Core Platform** | 8 semanas | Sprints 1-4 | Multi-tenancy, IAM, CQRS nativo |
| **Fase 2: POS Application** | 8 semanas | Sprints 5-8 | Primera aplicación de prueba (POS) |
| **Fase 3: Automation & Scale** | 6 semanas | Sprints 9-11 | Automatización aprovisionamiento, workers Go |

---

## FASE 0: Foundation (Sprint 0 - 2 semanas)

### Objetivos
- [ ] Repositorio configurado con estructura definitiva
- [ ] CI/CD pipeline básico funcionando
- [ ] Entornos de desarrollo y staging disponibles
- [ ] Equipo onboarded y productivo

### Sprint 0.1 (Semana 1-2)

#### Feature: Repository Setup & Governance
- **US-0.1.1**: Como desarrollador, quiero validar que la estructura documental sea correcta automáticamente
  - Tasks:
    - [ ] Crear `validate_structure.sh` con validaciones de nomenclatura
    - [ ] Integrar script en GitHub Actions
    - [ ] Configurar checks obligatorios para PRs
  - Estimación: 3 SP
  - Responsable: Tech Lead

- **US-0.1.2**: Como Tech Lead, quiero tener plantillas estandarizadas para todo tipo de documentos
  - Tasks:
    - [ ] Revisar templates existentes en `docs/11-templates/`
    - [ ] Crear ejemplos de uso para cada template
    - [ ] Documentar proceso de creación de nuevos documentos
  - Estimación: 2 SP
  - Responsable: Tech Lead

#### Feature: CI/CD Pipeline
- **US-0.1.3**: Como desarrollador, quiero que mis commits triggeren builds automáticos
  - Tasks:
    - [ ] Configurar GitHub Actions para build de .NET 10
    - [ ] Configurar GitHub Actions para build de React
    - [ ] Configurar publicación de imágenes Docker en registry
  - Estimación: 5 SP
  - Responsable: DevOps

- **US-0.1.4**: Como QA, quiero ejecutar pruebas automatizadas en cada PR
  - Tasks:
    - [ ] Configurar runner para pruebas unitarias .NET
    - [ ] Configurar runner para pruebas E2E con Playwright
    - [ ] Configurar reporte de cobertura de código
  - Estimación: 5 SP
  - Responsable: DevOps + QA Lead

#### Feature: Development Environment
- **US-0.1.5**: Como desarrollador, quiero configurar mi entorno local rápidamente
  - Tasks:
    - [ ] Crear Docker Compose para servicios base (PostgreSQL, Keycloak, RabbitMQ)
    - [ ] Documentar setup en `docs/08-guides/setup-development-environment.md`
    - [ ] Crear script de inicialización `setup-dev.ps1` / `setup-dev.sh`
  - Estimación: 3 SP
  - Responsable: DevOps

### Entregables Fase 0
1. ✅ Pipeline CI/CD funcionando
2. ✅ Entorno local documentado y reproducible
3. ✅ Validaciones de gobernanza activas
4. ✅ Equipo capacitado en estándares

---

## FASE 1: Core Platform (Sprints 1-4 - 8 semanas)

### Sprint 1 (Semanas 3-4): Multi-Tenancy Foundation

#### Feature: Database Multi-Tenancy (EPIC-002)
- **US-2.1**: Inyección de contexto de tenant
  - Tasks:
    - [ ] Implementar middleware `TenantContextMiddleware`
    - [ ] Extraer `X-Tenant-ID` de headers
    - [ ] Validar claims del token JWT
    - [ ] Retornar 403 si hay mismatch
  - Estimación: 5 SP
  - Responsable: Backend Dev 1

- **US-2.2**: Creación de tenant vía API
  - Tasks:
    - [ ] Diseñar schema de base de datos por tenant
    - [ ] Implementar endpoint `POST /api/tenants`
    - [ ] Crear lógica de aislamiento lógico
    - [ ] Registrar evento de auditoría
  - Estimación: 8 SP
  - Responsable: Backend Dev 2

- **US-2.3**: Migraciones de base de datos multi-tenant
  - Tasks:
    - [ ] Configurar EF Core migrations con schemas dinámicos
    - [ ] Crear script de inicialización de schema por tenant
    - [ ] Implementar rollback seguro
  - Estimación: 5 SP
  - Responsable: Backend Dev 1

#### Feature: CQRS Nativo (ADR-012)
- **US-1.1**: Implementar CQRS sin MediatR
  - Tasks:
    - [ ] Definir interfaces `ICommandHandler<T>` y `IQueryHandler<T>`
    - [ ] Configurar inyección de dependencias nativa .NET 10
    - [ ] Crear ejemplos de Commands y Queries
    - [ ] Documentar patrón en `docs/08-guides/cqrs-native-implementation.md`
  - Estimación: 5 SP
  - Responsable: Tech Lead

### Sprint 2 (Semanas 5-6): Identity & Access Management

#### Feature: Keycloak Integration (EPIC-003)
- **US-3.1**: Autenticación con Keycloak
  - Tasks:
    - [ ] Desplegar Keycloak en Docker Compose
    - [ ] Configurar realm `farutech-platform`
    - [ ] Implementar OIDC client en backend .NET
    - [ ] Implementar redirect flow en frontend React
  - Estimación: 8 SP
  - Responsable: Backend Dev 1 + Frontend Dev

- **US-3.2**: MFA obligatorio
  - Tasks:
    - [ ] Configurar políticas MFA en Keycloak
    - [ ] Implementar TOTP setup UI
    - [ ] Forzar MFA en login según política de tenant
  - Estimación: 5 SP
  - Responsable: Frontend Dev + Backend Dev 2

- **US-3.3**: Gestión de roles y permisos
  - Tasks:
    - [ ] Mapear roles de Keycloak a claims de aplicación
    - [ ] Implementar RBAC middleware
    - [ ] Crear endpoints de administración de roles
  - Estimación: 5 SP
  - Responsable: Backend Dev 2

### Sprint 3 (Semanas 7-8): API & Data Layer

#### Feature: API Gateway & Endpoints
- **US-4.1**: API Gateway básico
  - Tasks:
    - [ ] Configurar rate limiting por tenant
    - [ ] Implementar request/response logging
    - [ ] Configurar CORS policies
    - [ ] Documentar APIs con OpenAPI/Swagger
  - Estimación: 5 SP
  - Responsable: Backend Dev 1

- **US-4.2**: CRUD de recursos base
  - Tasks:
    - [ ] Implementar endpoints para gestión de organizaciones
    - [ ] Implementar endpoints para gestión de usuarios
    - [ ] Implementar endpoints para gestión de instancias
  - Estimación: 8 SP
  - Responsable: Backend Dev 2

#### Feature: Data Access Layer
- **US-4.3**: Repositorios genéricos multi-tenant
  - Tasks:
    - [ ] Crear `ITenantAwareRepository<T>`
    - [ ] Implementar filtrado automático por Tenant_ID
    - [ ] Crear tests de aislamiento de datos
  - Estimación: 5 SP
  - Responsable: Backend Dev 1

### Sprint 4 (Semanas 9-10): Frontend Core

#### Feature: Platform UI Foundation
- **US-5.1**: Design System & Component Library
  - Tasks:
    - [ ] Configurar Storybook
    - [ ] Crear componentes base (Button, Input, Modal, Table)
    - [ ] Definir tokens de diseño (colores, tipografía, spacing)
    - [ ] Documentar componentes en Storybook
  - Estimación: 8 SP
  - Responsable: Frontend Dev + UI/UX Designer

- **US-5.2**: Authentication Flow UI
  - Tasks:
    - [ ] Implementar login page con redirect a Keycloak
    - [ ] Implementar callback handler
    - [ ] Implementar logout flow
    - [ ] Manejar estados de loading y error
  - Estimación: 5 SP
  - Responsable: Frontend Dev

- **US-5.3**: Dashboard & Navigation
  - Tasks:
    - [ ] Implementar layout principal con sidebar
    - [ ] Crear dashboard con métricas básicas
    - [ ] Implementar navegación entre módulos
    - [ ] Configurar routing protegido
  - Estimación: 5 SP
  - Responsable: Frontend Dev

### Entregables Fase 1
1. ✅ Multi-tenancy funcional con aislamiento de datos
2. ✅ Autenticación/autorización con Keycloak
3. ✅ API Gateway operativo
4. ✅ Frontend core con design system
5. ✅ Cobertura de pruebas >80%

---

## FASE 2: POS Application (Sprints 5-8 - 8 semanas)

### Sprint 5 (Semanas 11-12): POS Backend

#### Feature: POS Domain Model
- **US-6.1**: Modelo de dominio POS
  - Tasks:
    - [ ] Diseñar entidades: Product, Category, Sale, Customer
    - [ ] Implementar value objects: Money, Quantity
    - [ ] Definir agregados y bounded contexts
    - [ ] Crear tests de dominio
  - Estimación: 8 SP
  - Responsable: Backend Dev 1

- **US-6.2**: API de productos
  - Tasks:
    - [ ] CRUD de productos
    - [ ] CRUD de categorías
    - [ ] Búsqueda y filtrado
    - [ ] Validación de reglas de negocio
  - Estimación: 5 SP
  - Responsable: Backend Dev 2

### Sprint 6 (Semanas 13-14): POS Sales Module

#### Feature: Sales Processing
- **US-7.1**: Creación de ventas
  - Tasks:
    - [ ] Implementar comando `CreateSaleCommand`
    - [ ] Validar stock disponible
    - [ ] Calcular totales e impuestos
    - [ ] Generar número de factura secuencial
  - Estimación: 8 SP
  - Responsable: Backend Dev 1

- **US-7.2**: Consulta de ventas
  - Tasks:
    - [ ] Implementar query `GetSalesByDateRangeQuery`
    - [ ] Implementar query `GetSaleDetailQuery`
    - [ ] Agregar filtros por cliente, vendedor, producto
    - [ ] Implementar paginación
  - Estimación: 5 SP
  - Responsable: Backend Dev 2

### Sprint 7 (Semanas 15-16): POS Frontend

#### Feature: POS UI
- **US-8.1**: Punto de venta UI
  - Tasks:
    - [ ] Diseñar interfaz de venta rápida
    - [ ] Implementar búsqueda de productos
    - [ ] Implementar carrito de compra
    - [ ] Implementar checkout con múltiples métodos de pago
  - Estimación: 8 SP
  - Responsable: Frontend Dev

- **US-8.2**: Gestión de productos UI
  - Tasks:
    - [ ] Implementar lista de productos con filtros
    - [ ] Implementar formulario de creación/edición
    - [ ] Implementar gestión de categorías
    - [ ] Implementar upload de imágenes
  - Estimación: 5 SP
  - Responsable: Frontend Dev

### Sprint 8 (Semanas 17-18): POS Reporting & Polish

#### Feature: POS Reports
- **US-9.1**: Reportes de ventas
  - Tasks:
    - [ ] Implementar reporte diario de ventas
    - [ ] Implementar reporte por producto
    - [ ] Implementar reporte por cliente
    - [ ] Exportar a PDF/Excel
  - Estimación: 8 SP
  - Responsable: Backend Dev 1 + Frontend Dev

#### Feature: POS Testing & QA
- **US-9.2**: Pruebas E2E POS
  - Tasks:
    - [ ] Crear tests E2E para flujo de venta completo
    - [ ] Crear tests E2E para gestión de productos
    - [ ] Ejecutar pruebas de carga
    - [ ] Corregir bugs encontrados
  - Estimación: 5 SP
  - Responsable: QA Lead + Developers

### Entregables Fase 2
1. ✅ Aplicación POS funcional end-to-end
2. ✅ Multi-tenancy probado con datos reales
3. ✅ Flujos completos de negocio implementados
4. ✅ Tests E2E cubriendo casos críticos

---

## FASE 3: Automation & Scale (Sprints 9-11 - 6 semanas)

### Sprint 9 (Semanas 19-20): Async Workers

#### Feature: Message Broker Integration (EPIC-004)
- **US-10.1**: RabbitMQ Setup
  - Tasks:
    - [ ] Desplegar RabbitMQ en Docker Compose
    - [ ] Configurar exchanges y colas
    - [ ] Implementar publisher en .NET
    - [ ] Implementar consumer base en Go
  - Estimación: 8 SP
  - Responsable: Backend Dev 1 + Go Developer

- **US-10.2**: Async Workers en Go
  - Tasks:
    - [ ] Implementar worker de procesamiento de ventas
    - [ ] Implementar idempotencia
    - [ ] Configurar reintentos con backoff exponencial
    - [ ] Implementar graceful shutdown
  - Estimación: 8 SP
  - Responsable: Go Developer

### Sprint 10 (Semanas 21-22): Observability

#### Feature: Logging & Monitoring (EPIC-005)
- **US-11.1**: Centralized Logging
  - Tasks:
    - [ ] Desplegar Loki + Grafana
    - [ ] Configurar structured logging en .NET
    - [ ] Configurar logs en Go workers
    - [ ] Crear dashboards de logs
  - Estimación: 5 SP
  - Responsable: DevOps

- **US-11.2**: Metrics & Tracing
  - Tasks:
    - [ ] Desplegar Prometheus + Grafana
    - [ ] Instrumentar métricas de negocio
    - [ ] Configurar OpenTelemetry para distributed tracing
    - [ ] Desplegar Jaeger/Tempo
    - [ ] Crear alertas críticas
  - Estimación: 8 SP
  - Responsable: DevOps + Backend Dev 2

### Sprint 11 (Semanas 23-24): Deployment Automation

#### Feature: Automated Provisioning
- **US-12.1**: Infrastructure as Code
  - Tasks:
    - [ ] Definir Terraform modules para PostgreSQL
    - [ ] Definir Terraform modules para Kubernetes
    - [ ] Configurar variables por ambiente
    - [ ] Documentar procesos de deploy
  - Estimación: 8 SP
  - Responsable: DevOps

- **US-12.2**: CI/CD Avanzado
  - Tasks:
    - [ ] Configurar deployment automático a staging
    - [ ] Configurar approval manual para production
    - [ ] Implementar blue-green deployments
    - [ ] Configurar rollback automático
  - Estimación: 5 SP
  - Responsable: DevOps

#### Feature: Documentation & Handover
- **US-12.3**: Final Documentation
  - Tasks:
    - [ ] Completar guías de operación
    - [ ] Documentar runbooks de incidentes
    - [ ] Crear material de capacitación
    - [ ] Realizar sesión de knowledge transfer
  - Estimación: 5 SP
  - Responsable: Todo el equipo

### Entregables Fase 3
1. ✅ Workers asíncronos en Go operativos
2. ✅ Sistema completo de observabilidad
3. ✅ Automatización de despliegues
4. ✅ Documentación completa de operación

---

## Métricas de Éxito por Fase

| Fase | Métrica | Target |
|------|---------|--------|
| Fase 0 | Tiempo de setup de entorno | < 30 minutos |
| Fase 1 | Cobertura de pruebas | > 80% |
| Fase 1 | Latencia API p95 | < 200ms |
| Fase 2 | Tiempo de onboarding tenant | < 5 minutos |
| Fase 2 | Incidentes de fuga de datos | 0 |
| Fase 3 | Tiempo de deployment | < 15 minutos |
| Fase 3 | MTTR (Mean Time To Recovery) | < 30 minutos |

---

## Dependencias Críticas

1. **Keycloak** debe estar operativo antes de cualquier desarrollo de autenticación
2. **PostgreSQL** con soporte de schemas antes de implementar multi-tenancy
3. **RabbitMQ** antes de desarrollar workers en Go
4. **Design System** aprobado antes de desarrollar UI compleja

---

## Riesgos y Mitigación

| Riesgo | Probabilidad | Impacto | Mitigación |
|--------|-------------|---------|------------|
| Curva de aprendizaje CQRS nativo | Media | Alto | Pair programming, documentación detallada, spike técnico |
| Complejidad de multi-tenancy | Alta | Alto | Prototipo temprano, tests de aislamiento desde día 1 |
| Disponibilidad de recursos Go | Media | Medio | Capacitación interna, contratación de contractor si necesario |
| Cambios en requerimientos POS | Alta | Medio | Sprint reviews frecuentes, backlog flexible |

---

## Recursos Necesarios

### Equipo Mínimo
- 1 Tech Lead / Arquitecto (50% arquitectura, 50% código)
- 2 Desarrolladores Full-Stack (.NET/React)
- 1 DevOps Engineer (50% tiempo)
- 1 QA Automation Lead
- 1 UI/UX Designer (50% tiempo)

### Infraestructura
- VPS con Coolify para staging/producción inicial
- GitHub Actions para CI/CD
- Docker Desktop para desarrollo local
- Licencias: Keycloak (open source), PostgreSQL (open source), RabbitMQ (open source)

---

## Próximos Pasos Inmediatos

1. **Semana 1**: 
   - Configurar repositorio con estructura definitiva
   - Crear Docker Compose base
   - Onboarding del equipo

2. **Semana 2**:
   - Primer commit de código .NET 10
   - Pipeline CI/CD funcionando
   - Sprint planning formal

3. **Fin Sprint 0**:
   - Demo de entorno funcional
   - Retrospectiva y ajustes
   - Inicio Fase 1

---

> **Nota**: Este roadmap es vivo y será actualizado al final de cada sprint basado en velocidad real del equipo y aprendizajes obtenidos.
