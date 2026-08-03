# Referencia Técnica - Farutech Cloud Platform

> **Propósito**: Documentación técnica de referencia rápida (APIs, eventos, schemas, configuraciones).  
> **Audiencia**: Desarrolladores, arquitectos, integradores.  
> **Estado**: En construcción - Fase 2 de reorganización documental.  
> **Nota**: Esta sección será generada automáticamente en el futuro mediante herramientas como OpenAPI, Schema Registry, etc.

---

## 📚 Categorías de Referencia

### 1. APIs de Plataforma (9 endpoints)

| ID | Endpoint | Método | Descripción | Estado |
|----|----------|--------|-------------|--------|
| API-001 | `/api/v1/organizations` | POST | Crear nueva organización | ⏳ Pendiente |
| API-002 | `/api/v1/organizations/{id}` | GET | Obtener detalles de organización | ⏳ Pendiente |
| API-003 | `/api/v1/instances` | POST | Crear instancia de aplicación | ⏳ Pendiente |
| API-004 | `/api/v1/instances/{id}/status` | GET | Obtener estado de instancia | ⏳ Pendiente |
| API-005 | `/api/v1/plans` | GET | Listar planes disponibles | ⏳ Pendiente |
| API-006 | `/api/v1/catalog/apps` | GET | Catálogo de aplicaciones | ⏳ Pendiente |
| API-007 | `/api/v1/billing/invoices` | GET | Facturas de la organización | ⏳ Pendiente |
| API-008 | `/api/v1/auth/login` | POST | Autenticación SSO | ⏳ Pendiente |
| API-009 | `/api/v1/auth/token/refresh` | POST | Refrescar token JWT | ⏳ Pendiente |

**Documentación futura**: OpenAPI/Swagger generado automáticamente desde el código.

### 2. Eventos del Dominio (4 categorías)

#### 2.1 Eventos de Organización

| ID | Evento | Payload | Publicado por | Consumido por |
|----|--------|---------|---------------|---------------|
| EVT-ORG-001 | `organization.created` | `{ organizationId, name, plan }` | Platform Core | Billing, Audit |
| EVT-ORG-002 | `organization.updated` | `{ organizationId, changes }` | Platform Core | Audit, Cache |
| EVT-ORG-003 | `organization.deleted` | `{ organizationId, reason }` | Platform Core | Cleanup, Audit |

#### 2.2 Eventos de Instancia

| ID | Evento | Payload | Publicado por | Consumido por |
|----|--------|---------|---------------|---------------|
| EVT-INS-001 | `instance.requested` | `{ instanceId, appId, plan, deploymentType }` | Marketplace | Provisioning |
| EVT-INS-002 | `instance.provisioned` | `{ instanceId, status, endpoint }` | Provisioning | Marketplace, Notification |
| EVT-INS-003 | `instance.scaled` | `{ instanceId, newCapacity }` | Orchestrator | Monitoring, Billing |
| EVT-INS-004 | `instance.deprovisioned` | `{ instanceId, reason }` | Platform Core | Cleanup, Audit |

#### 2.3 Eventos de Billing

| ID | Evento | Payload | Publicado por | Consumido por |
|----|--------|---------|---------------|---------------|
| EVT-BIL-001 | `invoice.generated` | `{ invoiceId, organizationId, amount, dueDate }` | Billing Service | Notification, Accounting |
| EVT-BIL-002 | `payment.completed` | `{ paymentId, invoiceId, amount }` | Payment Gateway | Billing, Accounting |
| EVT-BIL-003 | `payment.failed` | `{ paymentId, invoiceId, reason }` | Payment Gateway | Billing, Notification |

#### 2.4 Eventos de Seguridad

| ID | Evento | Payload | Publicado por | Consumido por |
|----|--------|---------|---------------|---------------|
| EVT-SEC-001 | `user.login.success` | `{ userId, organizationId, timestamp }` | Keycloak | Audit, Analytics |
| EVT-SEC-002 | `user.login.failed` | `{ userId, reason, timestamp }` | Keycloak | Audit, Security |
| EVT-SEC-003 | `mfa.enabled` | `{ userId, organizationId, method }` | IAM Service | Audit |
| EVT-SEC-004 | `role.assigned` | `{ userId, roleId, organizationId }` | IAM Service | Audit, Cache |

**Documentación futura**: Schema Registry (Avro/Protobuf) con versionado.

### 3. Configuración (6 referencias)

| ID | Configuración | Ubicación | Descripción | Estado |
|----|---------------|-----------|-------------|--------|
| CFG-001 | Variables de entorno | `.env.example` | Template de variables por entorno | ⏳ Pendiente |
| CFG-002 | Connection Strings | `appsettings.json` | Configuración de bases de datos | ⏳ Pendiente |
| CFG-003 | RabbitMQ Settings | `appsettings.json` | Configuración del message broker | ⏳ Pendiente |
| CFG-004 | Keycloak Config | `appsettings.json` | URLs, client IDs, realms | ⏳ Pendiente |
| CFG-005 | Docker Compose | `docker-compose.yml` | Servicios para desarrollo local | ⏳ Pendiente |
| CFG-006 | Kubernetes Manifests | `/k8s/` | Deployments, Services, ConfigMaps | ⏳ Pendiente |

### 4. Modelos de Datos (7 schemas)

#### 4.1 Organización

```sql
-- Tabla: organizations
CREATE TABLE organizations (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(255) NOT NULL,
    slug VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    status VARCHAR(20) DEFAULT 'active'
);

-- Schema lógico por organización
-- CREATE SCHEMA org_{slug};
```

#### 4.2 Instancia

```sql
-- Tabla: instances
CREATE TABLE instances (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    organization_id UUID REFERENCES organizations(id),
    app_id VARCHAR(100) NOT NULL,
    plan_id VARCHAR(100) NOT NULL,
    deployment_type VARCHAR(20) CHECK (deployment_type IN ('shared', 'dedicated')),
    status VARCHAR(20) DEFAULT 'provisioning',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Base de datos por instancia dentro del schema de la organización
-- CREATE DATABASE inst_{id} WITH OWNER = org_{slug};
```

#### 4.3 Usuario

```sql
-- Gestionado por Keycloak (externo)
-- Campos principales: id, email, username, enabled, created_at
-- Roles y grupos almacenados en Keycloak
```

#### 4.4 Plan

```sql
-- Tabla: plans
CREATE TABLE plans (
    id VARCHAR(100) PRIMARY KEY,
    app_id VARCHAR(100) NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price_monthly DECIMAL(10,2),
    price_yearly DECIMAL(10,2),
    currency VARCHAR(3) DEFAULT 'USD',
    limits JSONB, -- Límites específicos del plan
    features JSONB, -- Características incluidas
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

#### 4.5 Catálogo de Aplicaciones

```sql
-- Tabla: apps_catalog
CREATE TABLE apps_catalog (
    id VARCHAR(100) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    version VARCHAR(20),
    repository_url VARCHAR(500),
    documentation_url VARCHAR(500),
    provider_id UUID NOT NULL,
    status VARCHAR(20) DEFAULT 'pending_review',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

#### 4.6 Auditoría

```sql
-- Tabla: audit_logs
CREATE TABLE audit_logs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    organization_id UUID,
    user_id UUID,
    action VARCHAR(100) NOT NULL,
    resource_type VARCHAR(100),
    resource_id UUID,
    old_value JSONB,
    new_value JSONB,
    ip_address INET,
    user_agent TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Index para consultas frecuentes
CREATE INDEX idx_audit_org_date ON audit_logs(organization_id, created_at);
```

### 5. Catálogos (8 catálogos)

| ID | Catálogo | Descripción | Estado |
|----|----------|-------------|--------|
| CAT-001 | Tipos de Planes | Todos los planes disponibles por aplicación | ⏳ Pendiente |
| CAT-002 | Regiones de Despliegue | Regiones cloud disponibles | ⏳ Pendiente |
| CAT-003 | Tipos de Recurso | CPU, memoria, almacenamiento | ⏳ Pendiente |
| CAT-004 | Estados de Instancia | provisioning, active, suspended, deleted | ⏳ Pendiente |
| CAT-005 | Roles de Usuario | admin, member, viewer, custom | ⏳ Pendiente |
| CAT-006 | Permisos | Lista completa de permisos del sistema | ⏳ Pendiente |
| CAT-007 | Métodos de Pago | credit_card, bank_transfer, crypto | ⏳ Pendiente |
| CAT-008 | Monedas Soportadas | USD, EUR, COP, etc. | ⏳ Pendiente |

### 6. Seguridad (4 referencias)

| ID | Referencia | Descripción | Estado |
|----|------------|-------------|--------|
| SEC-001 | Políticas de Contraseñas | Longitud mínima, complejidad, rotación | ⏳ Pendiente |
| SEC-002 | Configuración MFA | TOTP, SMS, Email, WebAuthn | ⏳ Pendiente |
| SEC-003 | Cifrado de Datos | Algoritmos, claves, rotación | ⏳ Pendiente |
| SEC-004 | Rate Limiting | Límites por IP, usuario, organización | ⏳ Pendiente |

### 7. Infraestructura (6 referencias)

| ID | Referencia | Descripción | Estado |
|----|------------|-------------|--------|
| INF-001 | Topología de Red | VPCs, subnets, security groups | ⏳ Pendiente |
| INF-002 | Balanceadores de Carga | Configuración de ALB/NLB | ⏳ Pendiente |
| INF-003 | Clusters de Kubernetes | Node pools, autoescalado | ⏳ Pendiente |
| INF-004 | Bases de Datos PostgreSQL | Instancias, réplicas, backups | ⏳ Pendiente |
| INF-005 | Message Broker (RabbitMQ) | Clusters, colas, exchanges | ⏳ Pendiente |
| INF-006 | CDN y Caché | CloudFront, Redis, políticas de caché | ⏳ Pendiente |

---

## 🔧 Generación Automática Futura

Esta sección está diseñada para ser generada automáticamente mediante:

1. **OpenAPI/Swagger**: Para documentación de APIs REST
2. **Schema Registry**: Para schemas de eventos (Avro/Protobuf)
3. **dbdocs.io o similar**: Para modelos de datos
4. **Terraform Docs**: Para infraestructura como código
5. **Storybook**: Para componentes UI del Design System

### Pipeline de Generación (Futuro)

```yaml
# .github/workflows/generate-docs.yml
name: Generate Technical Reference

on:
  push:
    branches: [main]
    paths: ['src/**', 'api/**', 'schemas/**']

jobs:
  generate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Generate OpenAPI docs
        run: dotnet tool install -g Swashbuckle.AspNetCore.Cli && swagger tofile --output docs/09-reference/api-spec.json src/Api/swagger.json
      
      - name: Generate Schema Registry docs
        run: ./scripts/generate-schema-docs.sh
      
      - name: Commit generated docs
        run: |
          git config --local user.name "GitHub Actions"
          git add docs/09-reference/
          git commit -m "docs: auto-generate technical reference" || echo "No changes"
          git push
```

---

## 📊 Métricas de Calidad

- **Completitud**: % de referencias documentadas vs totales planeadas
- **Actualización**: Tiempo desde última sincronización con el código (< 24 horas idealmente)
- **Precisión**: % de referencias validadas automáticamente (tests de contrato)
- **Accesibilidad**: Tiempo promedio para encontrar una referencia específica

---

## 🚀 Próximo Hito

**Objetivo**: Tener al menos las referencias de APIs y eventos documentadas manualmente antes del inicio del Sprint 2, para luego automatizar la generación.

**Responsable**: Tech Lead + Arquitecto  
**Fecha límite**: [Definir según roadmap]

---

**Nota**: Este índice será consumido automáticamente por el futuro Engineering Knowledge System (EKS). Mantener estructura y metadatos actualizados. Las referencias marcadas como "⏳ Pendiente" serán completadas durante la implementación de cada feature correspondiente.
