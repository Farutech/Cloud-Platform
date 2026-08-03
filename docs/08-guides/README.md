# Guías de Implementación - Farutech Cloud Platform

> **Propósito**: Guías prácticas paso a paso para implementar, operar y mantener la plataforma.  
> **Audiencia**: Desarrolladores, DevOps, QA, nuevos integrantes del equipo.  
> **Estado**: En construcción - Fase 2 de reorganización documental.

---

## 📚 Categorías de Guías

### 1. Configuración e Infraestructura (4 guías)

| ID | Guía | Estado | Prioridad |
|----|------|--------|-----------|
| GUIDE-INF-001 | Setup de entorno de desarrollo local | ⏳ Pendiente | 🔴 Alta |
| GUIDE-INF-002 | Despliegue en Coolify (VPS) | ⏳ Pendiente | 🔴 Alta |
| GUIDE-INF-003 | Migración a Kubernetes (EKS/AKS) | ⏳ Pendiente | 🟡 Media |
| GUIDE-INF-004 | Configuración de PostgreSQL multi-tenant | ⏳ Pendiente | 🔴 Alta |

### 2. Desarrollo Backend (4 guías)

| ID | Guía | Estado | Prioridad |
|----|------|--------|-----------|
| GUIDE-BE-001 | Creación de nuevo módulo backend | ⏳ Pendiente | 🔴 Alta |
| GUIDE-BE-002 | Implementación de CQRS nativo (.NET 10) | ⏳ Pendiente | 🔴 Alta |
| GUIDE-BE-003 | Integración con RabbitMQ (mensajería) | ⏳ Pendiente | 🟡 Media |
| GUIDE-BE-004 | Workers en Go para procesamiento asíncrono | ⏳ Pendiente | 🟡 Media |

### 3. Desarrollo Frontend (4 guías)

| ID | Guía | Estado | Prioridad |
|----|------|--------|-----------|
| GUIDE-FE-001 | Setup de proyecto React + Vite | ⏳ Pendiente | 🔴 Alta |
| GUIDE-FE-002 | Implementación de microfrontends | ⏳ Pendiente | 🟡 Media |
| GUIDE-FE-003 | Integración con Keycloak (SSO) | ⏳ Pendiente | 🔴 Alta |
| GUIDE-FE-004 | Uso del Design System compartido | ⏳ Pendiente | 🟢 Baja |

### 4. Seguridad y Autenticación (4 guías)

| ID | Guía | Estado | Prioridad |
|----|------|--------|-----------|
| GUIDE-SEC-001 | Configuración de Keycloak como IdP | ⏳ Pendiente | 🔴 Alta |
| GUIDE-SEC-002 | Implementación de MFA por tenant | ⏳ Pendiente | 🟡 Media |
| GUIDE-SEC-003 | Gestión de secretos (Vault/Coolify) | ⏳ Pendiente | 🔴 Alta |
| GUIDE-SEC-004 | Auditoría y logging de seguridad | ⏳ Pendiente | 🟡 Media |

### 5. Operaciones y DevOps (4 guías)

| ID | Guía | Estado | Prioridad |
|----|------|--------|-----------|
| GUIDE-OPS-001 | CI/CD con GitHub Actions | ⏳ Pendiente | 🔴 Alta |
| GUIDE-OPS-002 | Monitoreo con Prometheus + Grafana | ⏳ Pendiente | 🟡 Media |
| GUIDE-OPS-003 | Logging centralizado (Loki) | ⏳ Pendiente | 🟡 Media |
| GUIDE-OPS-004 | Gestión de incidentes y runbooks | ⏳ Pendiente | 🟢 Baja |

### 6. Integración de Aplicaciones (4 guías)

| ID | Guía | Estado | Prioridad |
|----|------|--------|-----------|
| GUIDE-INT-001 | Cómo publicar una app en el marketplace | ⏳ Pendiente | 🟡 Media |
| GUIDE-INT-002 | Registro de planes y pricing | ⏳ Pendiente | 🟡 Media |
| GUIDE-INT-003 | Integración de eventos (Event-Driven) | ⏳ Pendiente | 🟡 Media |
| GUIDE-INT-004 | API Gateway y exposición de endpoints | ⏳ Pendiente | 🟢 Baja |

---

## 📝 Estructura Estándar de Guías

Cada guía debe seguir esta plantilla:

```markdown
# [Título de la Guía]

> **ID**: [GUIDE-XXX-NNN]  
> **Última actualización**: [YYYY-MM-DD]  
> **Responsable**: [Rol/Equipo]  
> **Tiempo estimado**: [X horas/días]

## Propósito

[Descripción clara de qué problema resuelve esta guía]

## Prerrequisitos

- [Requisito 1]
- [Requisito 2]
- [Requisito 3]

## Paso a Paso

### Paso 1: [Nombre del paso]

[Instrucciones detalladas con comandos, código o capturas]

```bash
# Ejemplo de comando
comando --opcion valor
```

### Paso 2: [Nombre del paso]

[Continuar con los pasos...]

## Verificación

Cómo confirmar que la guía se completó exitosamente:

- [ ] Checklist de verificación 1
- [ ] Checklist de verificación 2

## Solución de Problemas

| Problema | Causa probable | Solución |
|----------|----------------|----------|
| [Error X] | [Causa] | [Solución] |

## Referencias Relacionadas

- [Enlace a ADR relevante](../03-architecture-and-standards/01-architecture-decision-records/)
- [Enlace a estándar técnico](../03-architecture-and-standards/)
- [Enlace a template relacionado](../11-templates/)

## Historial de Cambios

| Fecha | Versión | Cambio | Autor |
|-------|---------|--------|-------|
| YYYY-MM-DD | 1.0 | Creación inicial | [Nombre] |
```

---

## 🎯 Prioridades de Creación

### Sprint 0 (Primera semana)
1. ✅ GUIDE-INF-001: Setup de entorno de desarrollo local
2. ✅ GUIDE-OPS-001: CI/CD con GitHub Actions
3. ✅ GUIDE-SEC-001: Configuración de Keycloak como IdP

### Sprint 1-2 (Primeras 2 semanas)
4. GUIDE-INF-002: Despliegue en Coolify (VPS)
5. GUIDE-INF-004: Configuración de PostgreSQL multi-tenant
6. GUIDE-BE-001: Creación de nuevo módulo backend
7. GUIDE-BE-002: Implementación de CQRS nativo

### Sprint 3-4 (Semanas 3-4)
8. GUIDE-FE-001: Setup de proyecto React + Vite
9. GUIDE-FE-003: Integración con Keycloak (SSO)
10. GUIDE-SEC-003: Gestión de secretos

---

## 🔄 Proceso de Actualización

1. **Propuesta**: Cualquier miembro del equipo puede proponer una nueva guía o actualización mediante PR
2. **Revisión**: Tech Lead revisa contenido técnico y claridad
3. **Validación**: QA valida que los pasos sean reproducibles
4. **Publicación**: Merge a main y notificación al equipo
5. **Mantenimiento**: Revisión trimestral para asegurar vigencia

---

## 📊 Métricas de Calidad

- **Completitud**: % de guías prioritarias creadas
- **Actualización**: Tiempo desde última revisión (< 90 días)
- **Usabilidad**: Feedback del equipo (encuestas mensuales)
- **Reproducibilidad**: % de guías que funcionan sin errores reportados

---

## 🚀 Próximo Hito

**Objetivo**: Tener las 7 guías de prioridad alta completas antes del inicio del Sprint 1 de implementación.

**Responsable**: Tech Lead + DevOps Lead  
**Fecha límite**: [Definir según roadmap]

---

**Nota**: Este índice será consumido automáticamente por el futuro Engineering Knowledge System (EKS). Mantener estructura y metadatos actualizados.
