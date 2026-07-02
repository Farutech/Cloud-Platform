# Farutech Cloud Platform
## Guía de Estrategia de Seguridad y Acceso

---

## Principios Fundamentales

1. **Seguridad por diseño:** La seguridad se integra desde la concepción, no como capa adicional
2. **Menor privilegio:** Cada usuario y sistema tiene solo los permisos necesarios
3. **Defensa en profundidad:** Múltiples capas de protección
4. **Auditoría completa:** Todo acceso y operación sensible queda registrada
5. **Actualización continua:** Protección contra amenazas emergentes

---

## Modelo de Identidad y Acceso

### Arquitectura

```
Usuario → Portal → Identity Service → Application
                     ↓
                Tenant Context
                     ↓
            Authorization Service
```

### Componentes

| Componente | Responsabilidad | Tecnología |
|------------|-----------------|------------|
| **Identity Service** | Gestión de usuarios, autenticación, proveedores externos | .NET 10 + IdentityServer |
| **Authorization Service** | Validación de permisos, RBAC/ABAC | .NET 10 + Policy-based authorization |
| **Tenant Context** | Propagación del contexto multi-tenant | JWT tokens con claims |

---

## Autenticación

### Métodos Soportados

| Método | Descripción | Uso Recomendado |
|--------|-------------|-----------------|
| **Usuario/Contraseña** | Credenciales locales | Usuarios internos |
| **Microsoft Entra ID** | Integración con Azure AD | Clientes empresariales |
| **Google Workspace** | Integración con Google Cloud | Clientes pequeños |
| **SAML 2.0** | Federación con sistemas existentes | Entornos corporativos |

### Flujo de Autenticación

1. Usuario accede a `portal.farutech.com`
2. Selecciona método de autenticación
3. Sistema valida credenciales
4. Genera token JWT con claims:
   - `organizationId`
   - `instanceId`
   - `roles`
   - `permissions`
5. Token se utiliza para todas las llamadas subsiguientes

---

## Autorización

### Modelo RBAC + ABAC

#### RBAC (Role-Based Access Control)
- Asignación de roles a usuarios
- Roles predefinidos: `Admin`, `Manager`, `User`, `Support`
- Permisos asociados a cada rol

#### ABAC (Attribute-Based Access Control)
- Decisiones basadas en atributos
- Ejemplos de atributos:
  - `organizationId`
  - `instanceId`
  - `location`
  - `department`
  - `userType`

### Implementación

```csharp
// Ejemplo de política ABAC
services.AddAuthorization(options =>
{
    options.AddPolicy("CanAccessInstance", policy =>
        policy.RequireAssertion(context =>
            context.User.HasClaim(c => c.Type == "organizationId" && 
                                     c.Value == context.Resource?.OrganizationId)));
});
```

---

## Protección de Datos

### Capas de Protección

| Capa | Tecnología | Descripción |
|------|------------|-------------|
| **Network** | Azure Firewall / NGINX | Filtrado de tráfico entrante/saliente |
| **Application** | ASP.NET Core Middleware | Validación de tokens, CORS, headers de seguridad |
| **Data** | PostgreSQL RLS | Row-Level Security para aislamiento multi-tenant |
| **Storage** | Azure Key Vault | Gestión segura de secrets y credenciales |

### Reglas de Aislamiento

- **Shared Mode:** Schemas separados por organización en misma base de datos
- **Dedicated Mode:** Bases de datos completamente separadas
- **Validación automática:** Todos los queries incluyen filtro `WHERE organization_id = @orgId`

---

## Operaciones Sensibles

### Definición

Operaciones que requieren protección adicional:
- Eliminar organizaciones o instancias
- Cambiar propietarios
- Modificar facturación
- Restablecer contraseñas
- Acceder a datos sensibles

### Mecanismos de Protección

| Mecanismo | Descripción | Ejemplo |
|-----------|-------------|---------|
| **Aprobación Dual** | Requiere confirmación de dos usuarios | Eliminar instancia |
| **Notificación** | Alerta inmediata al propietario | Cambio de correo |
| **Impersonación Controlada** | Acceso temporal con auditoría | Soporte técnico |
| **Rollback Automático** | Reversión ante fallos críticos | Actualización fallida |

### Flujo de Impersonación

1. Soporte solicita acceso a organización
2. Sistema envía notificación al propietario
3. Propietario aprueba/rechaza
4. Si aprueba, se genera sesión temporal con expiración
5. Todas las acciones quedan auditadas

---

## Auditoría y Monitoreo

### Eventos Auditables

- Login/logout
- Creación/modificación/eliminación de recursos
- Cambios de permisos
- Accesos a datos sensibles
- Intentos de acceso no autorizados

### Herramientas

- **OpenTelemetry:** Captura de traces y metrics
- **Elasticsearch/Kibana:** Búsqueda y análisis de logs
- **Datadog/Grafana:** Monitoreo en tiempo real
- **Alerting:** Notificaciones automáticas ante incidentes

---

## Pruebas de Seguridad

### Tipos de Pruebas

| Tipo | Frecuencia | Herramientas |
|------|------------|--------------|
| **SAST** | En cada PR | SonarQube, Semgrep |
| **DAST** | Semanal | OWASP ZAP, Burp Suite |
| **SCA** | En cada build | Dependabot, Snyk |
| **Penetration Testing** | Trimestral | Equipo especializado |

### Reglas de Seguridad

- Todos los endpoints deben tener validación de tenant
- Nombres de variables y funciones no deben contener información sensible
- Los logs no deben contener passwords, tokens o datos personales
- Las APIs deben implementar rate limiting
- Los formularios deben tener CSRF protection

---

## Evolución de la Estrategia

La estrategia de seguridad evolucionará según:

- **Nuevas amenazas:** Actualizaciones ante vulnerabilidades emergentes
- **Requerimientos regulatorios:** Cumplimiento con GDPR, HIPAA, etc.
- **Crecimiento del ecosistema:** Escalabilidad de controles
- **Feedback de incidentes:** Mejoras basadas en lecciones aprendidas
- **Benchmarking:** Comparación con estándares de la industria