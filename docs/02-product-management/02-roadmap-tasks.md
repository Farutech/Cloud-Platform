# Farutech Cloud Platform — Roadmap

> **Estado**: Vigente V1 · **Owner**: CPO / Principal PM (Feifei) · **Timeline (decisión A.14)**: MVP (Mes 1-3) · V1 (Mes 4-6) · V2 (Mes 7-9)
> **Fuente**: Artefacto de producto obligatorio del PM. Extraído fielmente del transcript de sesión; ver `docs/_archive/legacy-roots/pm-artifacts-source.md`.
> **Nota**: El roadmap legado (4 fases / 12 meses) se archiva en `docs/_archive/legacy-roots/02-product-management/02-roadmap-tasks.md` y queda suprimido por el siguiente.

## MVP (Mes 1 - Mes 3: Limpieza y Cimentación)

- **Fase 0**: Ejecución de purga documental y configuración de pipelines de validación CI/CD.
- Despliegue de infraestructura base: .NET 10 (CQRS nativo) y PostgreSQL.
- Implementación de Keycloak (EPIC-003) y creación lógica de Tenants (EPIC-002).
- Establecimiento del framework de automatización (Playwright E2E).

## V1 (Mes 4 - Mes 6: Funcionalidad de Negocio Base)

- Introducción de procesamiento asíncrono con workers en Go (ADR-014).
- Despliegue de primer módulo comercial (gestión de recursos) como prueba piloto de aislamiento de datos.
- Refinamiento de métricas de rendimiento (< 200ms de latencia p95).

## V2 (Mes 7 - Mes 9: Escalabilidad y Compliance)

- Preparación técnica y auditorías formales para certificaciones SOC 2 e ISO 27001 (OWASP Top 10 estricto desde V1, decisiones A.13).
- Herramientas de "IA Nativa" como features directos para el cliente (IA expuesta en V2, decisión A.7).
- Integración del módulo de billing automatizado.
