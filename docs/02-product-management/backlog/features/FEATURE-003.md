# FEATURE-003: Docker Base Images & Container Standards

**Épica Padre:** [EPIC-001](../epics/EPIC-001.md) - Setup Infraestructura & DevOps  
**Prioridad:** Must Have  
**Estado:** To Do  
**Story Points:** 5 SP  
**Horas Estimadas:** 16h  
**Responsable:** DevOps Lead + Backend Tech Lead

## 📖 Descripción
Crear y estandarizar imágenes base de Docker para todos los componentes del ecosistema Farutech (.NET backend, React frontend, Go workers), garantizando seguridad, consistencia y optimización de tamaño en todos los contenedores.

## 🎯 Objetivo de Negocio
Reducir vulnerabilidades de seguridad mediante imágenes oficiales y actualizadas, acelerar tiempos de build mediante capas compartidas, y garantizar comportamiento consistente entre entornos de desarrollo, testing y producción.

## 📋 Alcance Técnico
- Crear imágenes base oficiales en GitHub Container Registry (ghcr.io/Farutech):
  1. `farutech/dotnet-base:8.0` - .NET 8 runtime optimizado
  2. `farutech/node-base:20-alpine` - Node.js 20 Alpine para builds frontend
  3. `farutech/go-base:1.21` - Go 1.21 para workers
- Implementar multi-stage builds para minimizar tamaño final
- Configurar escaneo automático de vulnerabilidades con Trivy
- Documentar estándares de Dockerfile para todos los equipos

## 👥 User Stories Asociadas
- [STORY-007](../stories/STORY-007.md) - Como DevOps, quiero crear imagen base de .NET 8
- [STORY-008](../stories/STORY-008.md) - Como DevOps, quiero crear imagen base de Node.js 20
- [STORY-009](../stories/STORY-009.md) - Como DevOps, quiero crear imagen base de Go 1.21
- [STORY-010](../stories/STORY-010.md) - Como Security Lead, quiero escaneo de vulnerabilidades en imágenes
- [STORY-011](../stories/STORY-011.md) - Como Tech Lead, quiero estándar de Dockerfile para equipos

## ✅ Definition of Ready
- [ ] Acceso a GitHub Container Registry configurado
- [ ] Decisiones de versiones de runtime documentadas en ADR
- [ ] Herramientas de escaneo (Trivy) disponibles
- [ ] Ejemplos de Dockerfile actuales recopilados

## ✅ Definition of Done
- [ ] 3 imágenes base publicadas en ghcr.io/Farutech
- [ ] Todas las imágenes pasan escaneo de vulnerabilidades (0 críticas)
- [ ] Tamaño de imágenes optimizado (<200MB para runtime)
- [ ] Documentación de estándares de Dockerfile publicada
- [ ] Todos los repositorios principales actualizados para usar nuevas imágenes
- [ ] Pipeline de build automático de imágenes configurado (semanal)

## 🔗 Dependencias
- **Bloqueada por:** [FEATURE-001](FEATURE-001.md) - GitHub Organization Setup (necesita acceso a ghcr.io)
- **Bloquea a:** [FEATURE-004](FEATURE-004.md) - CI/CD Pipeline Setup (las pipelines usan estas imágenes)

## 📊 Métricas de Éxito
- 100% de nuevos contenedores basados en imágenes oficiales Farutech
- Reducción del 40% en tamaño promedio de imágenes
- 0 vulnerabilidades críticas en imágenes base
- Tiempo de build de imágenes < 10 minutos

## 📝 Notas de Implementación
- Usar distroless o alpine como base para minimizar attack surface
- Implementar label scheme estándar (org.opencontainers.image.*)
- Configurar buildx para multi-architecture (amd64, arm64)
- Pin versions específicas, evitar tags 'latest' en producción
- Considerar uso de Renovate para actualizaciones automáticas de versiones base

## 🏷️ Tags
`docker`, `containers`, `images`, `devops`, `security`, `optimization`
