# FEATURE-004: CI/CD Pipeline Setup

**Épica Padre:** [EPIC-001](../epics/EPIC-001.md) - Setup Infraestructura & DevOps  
**Prioridad:** Must Have  
**Estado:** To Do  
**Story Points:** 8 SP  
**Horas Estimadas:** 24h  
**Responsable:** DevOps Lead + Tech Lead

## 📖 Descripción
Implementar pipelines de Integración Continua y Despliegue Continuo (CI/CD) utilizando GitHub Actions para automatizar build, test, seguridad y despliegue de todas las aplicaciones del ecosistema Farutech en múltiples entornos (dev, staging, production).

## 🎯 Objetivo de Negocio
Reducir tiempo de entrega de features de semanas a horas, minimizar errores humanos en despliegues, garantizar calidad mediante tests automatizados en cada cambio, y permitir releases frecuentes y confiables.

## 📋 Alcance Técnico
- Configurar GitHub Actions workflows para:
  1. **CI Pipeline**: Build, test unitarios, análisis estático (SAST), escaneo de dependencias
  2. **CD Pipeline**: Despliegue automático a dev/staging, despliegue manual a production con aprobación
  3. **Release Pipeline**: Generación de changelog, versionado semántico, publicación de artifacts
- Implementar matrices de build para múltiples versiones (.NET 8, Node 20, Go 1.21)
- Configurar caching de dependencias para reducir tiempos de build
- Integrar notificaciones a Slack/Teams en cada etapa

## 👥 User Stories Asociadas
- [STORY-010](../stories/STORY-010.md) - Como Dev, quiero que mi PR ejecute tests automáticamente
- [STORY-011](../stories/STORY-011.md) - Como DevOps, quiero despliegue automático a staging tras merge a develop
- [STORY-012](../stories/STORY-012.md) - Como PM, quiero aprobación manual antes de production
- [STORY-013](../stories/STORY-013.md) - Como QA, quiero ambientes efímeros para testing de PRs
- [STORY-014](../stories/STORY-014.md) - Como Security Lead, quiero escaneo de vulnerabilidades en cada build
- [STORY-015](../stories/STORY-015.md) - Como Tech Lead, quiero versionado semántico automático

## ✅ Definition of Ready
- [ ] GitHub Organization configurada con acceso a Actions
- [ ] Entornos (dev, staging, production) definidos en GitHub
- [ ] Secrets necesarios configurados (Azure credentials, Docker registry, etc.)
- [ ] Scripts de build y deploy existentes en cada repositorio

## ✅ Definition of Done
- [ ] Workflow CI ejecutándose en cada push a ramas feature/*
- [ ] Tests unitarios e integración ejecutándose con cobertura > 80%
- [ ] Análisis SAST (SonarQube o CodeQL) integrado sin falsos positivos críticos
- [ ] Escaneo de dependencias (Dependabot o Snyk) activo
- [ ] Despliegue automático a staging tras merge a develop
- [ ] Despliegue a production requiere aprobación explícita
- [ ] Notificaciones a Slack configuradas para éxitos/fallos
- [ ] Documentación de pipelines y troubleshooting publicada

## 🔗 Dependencias
- **Bloqueada por:** [FEATURE-001](FEATURE-001.md) - GitHub Organization Setup
- **Bloquea a:** [FEATURE-007](FEATURE-007.md) - Security Hardening (necesita pipelines para escaneos)
- **Bloquea a:** [FEATURE-018](FEATURE-018.md) - Kubernetes Deployment (necesita CD para K8s)

## 📊 Métricas de Éxito
- Tiempo promedio de pipeline CI < 10 minutos
- Tiempo promedio de despliegue a staging < 5 minutos
- 95% de builds exitosos en primer intento
- Reducción de 70% en incidentes relacionados con despliegues manuales

## 📝 Notas de Implementación
- Usar runners auto-hosted en Azure para mejor rendimiento y acceso a VNet
- Implementar reutilización de workflows con `workflow_call` para estandarización
- Configurar concurrency groups para evitar despliegues concurrentes
- Usar environments protection rules para production
- Considerar blue-green deployment para zero-downtime en futuro

## 🛠️ Snippets de Referencia

### Ejemplo de workflow CI (.github/workflows/ci.yml)
```yaml
name: CI Pipeline

on:
  pull_request:
    branches: [develop, main]
  push:
    branches: [develop]

jobs:
  build-and-test:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        project: [platform-core, app-pos-frontend, app-pos-backend]
    
    steps:
      - uses: actions/checkout@v4
      
      - name: Setup .NET
        uses: actions/setup-dotnet@v4
        with:
          dotnet-version: '8.0.x'
      
      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '20.x'
          cache: 'npm'
          cache-dependency-path: '**/package-lock.json'
      
      - name: Restore dependencies
        run: dotnet restore apps/${{ matrix.project }}
      
      - name: Build
        run: dotnet build apps/${{ matrix.project }} --no-restore
      
      - name: Test
        run: dotnet test apps/${{ matrix.project }} --no-build --verbosity normal --collect:"XPlat Code Coverage"
      
      - name: Upload coverage reports
        uses: codecov/codecov-action@v3
        with:
          files: '**/coverage.cobertura.xml'
          flags: ${{ matrix.project }}
      
      - name: Run SonarQube Scan
        uses: sonarsource/sonarqube-scan-action@master
        env:
          SONAR_TOKEN: ${{ secrets.SONAR_TOKEN }}
          SONAR_HOST_URL: ${{ secrets.SONAR_HOST_URL }}
```

## 🏷️ Tags
`ci-cd`, `github-actions`, `automation`, `devops`, `deployment`, `testing`
