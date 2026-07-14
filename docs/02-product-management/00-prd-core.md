# Farutech Cloud Platform — PRD (Core)

> **Estado**: Vigente V1 · **Owner**: CPO / Principal PM (Feifei) · **Aprobación**: Product Management
> **Fuente**: Artefacto de producto obligatorio del PM (resolución ejecutiva §A + Plan de Gobernanza §B). Extraído fielmente del transcript de sesión; ver `docs/_archive/legacy-roots/pm-artifacts-source.md`.

## Product Overview

Farutech Cloud Platform Core es un núcleo fundacional SaaS B2B, basado en un monolito modular, diseñado para soportar aprovisionamiento instantáneo de múltiples clientes (multi-tenant) con un performance excepcional.

## Problem Statement

El proyecto sufre de una parálisis por análisis y documentación inmanejable. Técnicamente, carece de un sistema base de identidad, aislamiento de datos y procesamiento en segundo plano que sea testeable, seguro y gratuito a nivel de licenciamiento para poder comercializar la plataforma de manera rentable.

## Goals

- Soportar operaciones multi-tenant seguras y aisladas lógicamente en PostgreSQL.
- Implementar autenticación y gestión de accesos corporativos mediante Keycloak.
- Ejecutar un backend de ultra-bajo tiempo de respuesta utilizando CQRS puro (sin MediatR) en .NET 10 y Go para procesos asíncronos.
- Lograr una base documental y de requerimientos autoverificable en pipelines de CI/CD.

## Non Goals

- Módulos de facturación (Billing).
- Implementación de IA expuesta a clientes finales en esta fase.
- Certificación oficial de normativas de seguridad (se preparará la arquitectura, pero la auditoría es post-V1).

## Stakeholders

- Feifei (Principal Product Manager)
- Lead Architect & Architecture Board
- QA Automation Lead

## Users

- **Platform Admin:** Encargado de la provisión y suspensión de clientes.
- **Tenant Admin:** Cliente B2B que administra usuarios dentro de su compañía.
- **Tenant User:** Consumidor final de los servicios habilitados por el Tenant Admin.

## Functional Requirements

- **FR-1:** Capacidad de aislar registros por `Tenant_ID` en todas las consultas a bases de datos.
- **FR-2:** Redirección e integración nativa de login/logout con el servidor Keycloak.
- **FR-3:** Gestión de roles y aplicación de MFA forzado por el Tenant Admin.
- **FR-4:** Publicación y consumo de tareas pesadas hacia workers en Go mediante un message broker.

## Non Functional Requirements

- **Performance:** La latencia del API Gateway no debe superar los 200ms en el percentil 95.
- **Seguridad:** Aislamiento de sesiones y protección CSRF/XSS según OWASP.
- **Testability:** Toda funcionalidad debe contar con cobertura de automatización (Playwright para E2E y pruebas unitarias/integración).
- **Escalabilidad:** Los workers en Go deben escalar horizontalmente basados en la longitud de las colas.

## Risks

- Fricción inicial por la eliminación de librerías como MediatR y el cambio a patrones de inyección nativos.
- Desviaciones en el alcance de los workers asíncronos escritos en Golang.

## Success Metrics

- Tiempo de despliegue y validación del entorno core: < 15 minutos.
- Cobertura de pruebas automatizadas E2E en CI/CD: > 85%.
- Número de incidentes de fugas de datos entre tenants: 0.
