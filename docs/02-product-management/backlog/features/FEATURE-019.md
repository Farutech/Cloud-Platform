# FEATURE-019 — Audit Logging for Security Events

## Epic

[EPIC-003](../epics/EPIC-003.md) — Identity & Access Management

## Objetivo

Implementar un sistema de auditoría estructurado que registre todos los eventos de seguridad relevantes (logins, fallos de autenticación, cambios de roles, accesos denegados) para cumplimiento normativo, análisis forense y monitoreo de amenazas.

## Descripción

Esta feature desarrolla el componente de audit logging que captura eventos de seguridad en formato estructurado, los almacena con contexto completo (tenant, usuario, IP, timestamp, detalles) y permite su consulta y exportación para análisis posteriores. Es crítico para certificaciones SOC2, GDPR e HIPAA.

## Alcance

- Definición de modelo de datos `SecurityAuditLog`
- Eventos a auditar: login exitoso/fallido, logout, cambio de password, asignación de roles, acceso denegado, creación/eliminación de usuarios
- Middleware de auditoría automática para eventos de autenticación
- API de consulta de logs con filtros por fecha, tenant, usuario, tipo de evento
- Retención configurable (default: 2 años)
- Exportación a formatos estándar (JSON, CSV)
- Integración con sistema de observability (envío a Loki/Elasticsearch)

## Fuera de alcance

- Auditoría de eventos de negocio (ventas, inventario, etc.) - se aborda en EPIC-011
- Alertas en tiempo real basadas en patrones de auditoría
- Enmascaramiento automático de datos sensibles en logs

## Dependencias

- **Bloqueada por:** [FEATURE-017](FEATURE-017.md) - API Gateway Middleware
- **Bloquea a:** EPIC-011 (Observability & Monitoring)

## Criterios de aceptación

- [ ] Tabla `SecurityAuditLogs` creada con índices por fecha y tenant
- [ ] Evento `UserLoginSuccess` registrado con IP, user agent, timestamp
- [ ] Evento `UserLoginFailed` registrado con razón del fallo
- [ ] Evento `RoleAssigned` registra quién asignó y qué rol
- [ ] Evento `AccessDenied` registra recurso solicitado y permisos faltantes
- [ ] API `GET /audit-logs` con paginación y filtros operativos
- [ ] Exportación a JSON/CSV funcional
- [ ] Logs enviados a Loki vía push (cuando esté disponible)
- [ ] Tests verifican que cada evento crítico se audita
- [ ] Documentación de retención y privacidad publicada

## Consideraciones técnicas

- **Modelo:** Entidad inmutable, solo inserciones
- **Almacenamiento:** PostgreSQL (tabla separada), futuro traslado a ClickHouse
- **Formato:** JSON estructurado con schema fijo
- **Privacidad:** No almacenar passwords ni tokens completos
- **ADR Referenciado:** ADR-009 (IAM), ADR-012 (Observability)

## Referencias

- [ADR-009](../../03-architecture-and-standards/01-architecture-decision-records/ADR-009-identity-access-management.md)
- [ADR-012](../../03-architecture-and-standards/01-architecture-decision-records/ADR-012-observability-strategy.md)
- [Engineering Standards](../../03-architecture-and-standards/02-engineering-standards.md)
- [EPIC-003](../epics/EPIC-003.md)
- [FEATURE-017](FEATURE-017.md)
