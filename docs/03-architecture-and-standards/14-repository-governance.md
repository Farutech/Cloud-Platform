# Farutech Cloud Platform - Repository Governance

> **Estado**: Vigente V1 · **Owner**: Tech Lead / Architecture Board · **Aprobación**: Required para Sprint 0  
> **Actualización**: 2025-01-XX · **Revisión**: Cada sprint o cuando cambien procesos

---

## 📋 Tabla de Contenidos

1. [Principios de Gobernanza](#principios-de-gobernanza)
2. [Estructura de Branches](#estructura-de-branches)
3. [Flujo de Trabajo Git](#flujo-de-trabajo-git)
4. [Code Owners y Responsabilidades](#code-owners-y-responsabilidades)
5. [Proceso de Pull Requests](#proceso-de-pull-requests)
6. [Convenciones de Commits](#convenciones-de-commits)
7. [Políticas de Merge](#políticas-de-merge)
8. [Gestión de Releases](#gestión-de-releases)
9. [Métricas y Calidad](#métricas-y-calidad)

---

## Principios de Gobernanza

### Valores Fundamentales

1. **Transparencia**: Todo cambio es visible y rastreable
2. **Colaboración**: Revisiones de código obligatorias
3. **Calidad**: CI/CD automatizado con gates estrictos
4. **Velocidad**: Procesos optimizados sin burocracia innecesaria
5. **Seguridad**: Protección de ramas principales

### Alcance

Esta gobernanza aplica a:
- ✅ Todos los repositorios del ecosistema Farutech
- ✅ Todas las aplicaciones en el monorepo
- ✅ Todos los paquetes compartidos
- ✅ Infraestructura como código
- ✅ Documentación técnica

---

## Estructura de Branches

### Modelo de Branching

Usamos un modelo simplificado basado en **GitHub Flow** con extensiones para releases:

```
main (protegida)
  ├── develop (opcional, para integración continua)
  ├── feature/* (ramas de característica)
  ├── bugfix/* (correcciones de bugs)
  ├── hotfix/* (correcciones urgentes a producción)
  └── release/* (preparación de releases)
```

### Ramas Principales

#### `main`
- **Propósito**: Código en producción (o listo para producción)
- **Protección**: Máxima (ver sección de protección)
- **Deploy**: Automático a producción al mergear
- **Estabilidad**: 100% (siempre deployable)

#### `develop` (Opcional)
- **Propósito**: Integración de features antes de llegar a main
- **Protección**: Media (requiere CI pass, 1 approval)
- **Deploy**: Automático a staging
- **Estabilidad**: 95% (puede tener bugs menores)

**Nota:** Usar `develop` solo si el equipo es >5 personas o hay múltiples features en paralelo. Para equipos pequeños, ir directo a `main` vía PR.

### Ramas Temporales

#### `feature/*`
- **Propósito**: Desarrollo de nuevas funcionalidades
- **Naming**: `feature/descripcion-corta` (kebab-case)
- **Origen**: `main` o `develop`
- **Destino**: `main` o `develop`
- **Vida útil**: 1-5 días (idealmente <1 semana)
- **Ejemplos**:
  - `feature/multi-tenancy-schema-isolation`
  - `feature/keycloak-oidc-integration`
  - `feature/marketplace-catalog-ui`

#### `bugfix/*`
- **Propósito**: Corrección de bugs no críticos
- **Naming**: `bugfix/descripcion-corta`
- **Origen**: `main` o `develop`
- **Destino**: `main` o `develop`
- **Vida útil**: 1-3 días
- **Ejemplos**:
  - `bugfix/fix-null-reference-in-billing`
  - `bugfix/resolve-css-conflict-pos-app`

#### `hotfix/*`
- **Propósito**: Correcciones urgentes de producción
- **Naming**: `hotfix/descripcion-corta`
- **Origen**: `main` (SIEMPRE)
- **Destino**: `main` Y `develop` (si existe)
- **Vida útil**: <24 horas
- **Proceso acelerado**: Approval rápido, deploy inmediato
- **Ejemplos**:
  - `hotfix/fix-security-vulnerability-auth`
  - `hotfix/resolve-database-connection-leak`

#### `release/*`
- **Propósito**: Preparación y estabilización de release
- **Naming**: `release/vX.Y.Z` (sigue versionado semántico)
- **Origen**: `develop` o `main`
- **Destino**: `main` (y `develop` si existe)
- **Vida útil**: 1-3 días
- **Actividades**:
  - Testing final
  - Ajuste de versiones
  - Generación de changelog
  - Documentation update
- **Ejemplos**:
  - `release/v1.0.0`
  - `release/v0.3.1`

---

## Flujo de Trabajo Git

### Flujo Estándar (Feature Development)

```bash
# 1. Crear rama desde main actualizada
git checkout main
git pull origin main
git checkout -b feature/nueva-funcionalidad

# 2. Desarrollar y hacer commits (convenciones abajo)
git add .
git commit -m "feat: agregar catálogo de aplicaciones"

# 3. Sincronizar con main periódicamente
git fetch origin main
git rebase origin/main

# 4. Publicar rama
git push -u origin feature/nueva-funcionalidad

# 5. Crear Pull Request en GitHub
# → Esperar reviews y CI
# → Resolver comentarios

# 6. Merge (vía GitHub UI)
# → Squash & Merge recomendado para features
# → Rebase & Merge para hotfixes

# 7. Eliminar rama local
git branch -d feature/nueva-funcionalidad
git push origin --delete feature/nueva-funcionalidad
```

### Flujo de Hotfix (Urgente)

```bash
# 1. Crear hotfix desde main (producción)
git checkout main
git pull origin main
git checkout -b hotfix/correccion-urgente

# 2. Corregir y commitear
git add .
git commit -m "fix: resolver vulnerabilidad de seguridad #CRITICAL"

# 3. Push y crear PR
git push -u origin hotfix/correccion-urgente

# 4. Crear PR con etiqueta [HOTFIX]
# → Notificar al Tech Lead inmediatamente
# → Approval acelerado (<1 hora)
# → CI debe pasar (no saltar bajo ninguna circunstancia)

# 5. Merge a main (deploy automático a producción)

# 6. Mergear también a develop (si existe)
git checkout develop
git merge main
git push origin develop

# 7. Taggear release de hotfix
git tag v1.0.1-hotfix
git push origin v1.0.1-hotfix
```

### Flujo de Release

```bash
# 1. Crear rama de release desde develop
git checkout develop
git pull origin develop
git checkout -b release/v1.2.0

# 2. Ajustar versiones en package.json, .csproj, etc.
# 3. Actualizar CHANGELOG.md
# 4. Ejecutar testing final
# 5. Corregir bugs encontrados

# 6. Crear PR a main
git push -u origin release/v1.2.0
# → Crear PR en GitHub

# 7. Merge a main (tag automático)
# → El workflow de release crea tag vX.Y.Z

# 8. Mergear main de vuelta a develop (para sincronizar)
git checkout develop
git merge main
git push origin develop

# 9. Eliminar rama de release
git branch -d release/v1.2.0
git push origin --delete release/v1.2.0
```

---

## Code Owners y Responsabilidades

### Archivo CODEOWNERS

**Ubicación:** `.github/CODEOWNERS`

```codeowners
# ============================================
# FARUTECH CLOUD PLATFORM - CODE OWNERS
# ============================================
# Última actualización: 2025-01-XX
# Owner: Tech Lead
# Revisión: Cada sprint

# ============================================
# DEFAULT OWNERS (Platform Team)
# ============================================
# Dueños por defecto para todo el repo
* @farutech/platform-team @tech-lead

# ============================================
# APLICACIONES
# ============================================

# Platform Core (Marketplace)
apps/platform-core/ @platform-core-team @tech-lead
apps/platform-core/src/api/ @backend-lead
apps/platform-core/src/web/ @frontend-lead
apps/platform-core/src/workers/ @backend-lead

# POS Application
apps/app-pos/ @pos-team @product-owner-pos
apps/app-pos/src/api/ @backend-lead
apps/app-pos/src/web/ @frontend-lead

# Futuras aplicaciones
apps/app-erp/ @erp-team @product-owner-erp
apps/app-hotels/ @hotels-team @product-owner-hotels

# ============================================
# PAQUETES COMPARTIDOS
# ============================================

# Frontend Packages
packages/frontend/ @frontend-leads @design-system-team
packages/frontend/design-system/ @design-system-lead @ui-architect
packages/frontend/auth-client/ @security-lead @backend-lead
packages/frontend/event-client/ @architecture-board

# Backend Packages
packages/backend/ @backend-leads @architecture-board
packages/backend/multi-tenancy-core/ @tech-lead @db-architect
packages/backend/event-bus-client/ @messaging-lead
packages/backend/identity-client/ @security-lead
packages/backend/logging-metrics/ @devops-lead

# Shared Contracts
packages/shared/ @architecture-board @tech-lead
packages/shared/contracts/ @api-architect @all-tech-leads

# ============================================
# SERVICIOS INDEPENDIENTES
# ============================================
services/ @platform-team @service-owners
services/service-identity/ @security-lead @identity-team
services/service-billing/ @billing-team @finance-rep
services/service-notifications/ @notifications-team

# ============================================
# WORKERS
# ============================================
workers/ @backend-leads @go-developers
workers/email-sender/ @notifications-team
workers/pdf-generator/ @document-team
workers/data-sync/ @integration-team

# ============================================
# INFRAESTRUCTURA
# ============================================
infrastructure/ @devops-team @infrastructure-lead
infrastructure/docker/ @devops-lead
infrastructure/kubernetes/ @k8s-admins
infrastructure/terraform/ @cloud-architect
infrastructure/coolify/ @devops-team

.github/ @devops-team @tech-lead
.github/workflows/ @ci-cd-specialists
.github/CODEOWNERS @tech-lead @devops-lead

# ============================================
# DOCUMENTACIÓN
# ============================================
docs/ @tech-writers @tech-leads
docs/00-meta/ @tech-lead
docs/01-vision-and-fundamentals/ @product-team @tech-lead
docs/02-product-management/ @product-owners @project-managers
docs/03-architecture-and-standards/ @architecture-board
docs/08-guides/ @tech-writers @subject-matter-experts
docs/09-reference/ @api-architect @tech-leads
docs/13-onboarding/ @hr-tech @tech-leads

# ============================================
# TESTS
# ============================================
tests/ @qa-team @qa-lead
tests/e2e-platform/ @e2e-specialists
tests/e2e-pos/ @pos-qa
tests/integration/ @integration-testers

# ============================================
# HERRAMIENTAS
# ============================================
tools/ @platform-team
tools/code-generators/ @developer-experience-team
tools/scripts/ @devops-team
tools/migrations/ @db-admins @backend-lead

# ============================================
# ARCHIVOS DE CONFIGURACIÓN RAÍZ
# ============================================
package.json @frontend-lead @tech-lead
pnpm-workspace.yaml @frontend-lead @devops-lead
nx.json @tech-lead @devops-lead
turbo.json @tech-lead @devops-lead
Directory.Build.props @backend-lead @tech-lead
.gitignore @devops-lead
.editorconfig @tech-lead @all-devs
README.md @tech-lead @product-team
LICENSE @legal-team @tech-lead
```

### Roles y Responsabilidades

| Rol | Responsabilidades | Miembros Típicos |
|-----|-------------------|------------------|
| **Tech Lead** | Arquitectura, decisiones técnicas, code review crítico | 1-2 personas |
| **Product Owner** | Priorización, criterios de aceptación, validación funcional | 1 por app |
| **Backend Lead** | Calidad de código backend, patrones, reviews | 1-2 personas |
| **Frontend Lead** | Calidad de código frontend, design system, UX | 1-2 personas |
| **DevOps Lead** | Infraestructura, CI/CD, seguridad operativa | 1-2 personas |
| **Security Lead** | Seguridad, auditorías, vulnerabilidades | 1 persona |
| **QA Lead** | Estrategia de testing, calidad, métricas | 1 persona |
| **Architecture Board** | Decisiones arquitectónicas transversales | 3-5 personas senior |

### Reglas de Review

1. **Todo PR requiere mínimo 1 approval** de un code owner
2. **Paquetes compartidos** requieren approval del dueño específico
3. **Cambios en infraestructura** requieren approval de DevOps Lead
4. **Cambios de seguridad** requieren approval de Security Lead
5. **Nadie puede aprobar su propio PR** (excepto hotfixes críticos con aprobación posterior)

---

## Proceso de Pull Requests

### Creación de PR

#### Checklist Pre-PR

Antes de crear un PR, el desarrollador debe verificar:

- [ ] Código sigue estándares de codificación
- [ ] Tests unitarios escritos y pasando (>80% coverage)
- [ ] Tests de integración relevantes agregados
- [ ] Documentación actualizada (si aplica)
- [ ] Changelog actualizado (si es feature/fix relevante)
- [ ] No hay código comentado o debug
- [ ] Variables y funciones con nombres descriptivos
- [ ] No hay hardcoded values (usar config/env)
- [ ] Secrets no están comprometidos
- [ ] Rebase hecho con main más reciente
- [ ] Build local pasa sin errores

#### Plantilla de PR

**Archivo:** `.github/PULL_REQUEST_TEMPLATE.md`

```markdown
## Descripción

<!-- Describir el cambio en 2-3 oraciones -->
<!-- ¿Qué problema resuelve? ¿Por qué es necesario? -->

## Tipo de Cambio

<!-- Marcar con una x las opciones aplicables -->

- [ ] 🐛 Bug fix (non-breaking change que corrige un issue)
- [ ] ✨ New feature (non-breaking change que agrega funcionalidad)
- [ ] ⚠️ Breaking change (fix o feature que causaría cambios en funcionalidad existente)
- [ ] 📝 Documentation update
- [ ] 🎨 Style/formatting (sin cambios lógicos)
- [ ] ♻️ Refactoring (sin cambios funcionales)
- [ ] ⚡ Performance improvement
- [ ] 🧪 Test addition/update
- [ ] 🔒 Security fix
- [ ] 🚀 Deployment/CI/CD change

## Issue Relacionado

<!-- Link al issue/ticket (ej. Closes #123) -->
Closes #

## Cambios Realizados

<!-- Lista detallada de cambios -->

1. Archivo X: Agregué función Y para...
2. Archivo Z: Modifiqué lógica de...
3. ...

## Testing

<!-- Describir cómo se probó el cambio -->

- [ ] Tests unitarios agregados/actualizados
- [ ] Tests de integración agregados/actualizados
- [ ] Testing manual realizado:
  - Paso 1: ...
  - Paso 2: ...
  - Resultado esperado: ...
  - Resultado obtenido: ...

## Screenshots/Evidencia (si aplica)

<!-- Capturas de pantalla, videos, logs, etc. -->

## Checklist Final

- [ ] Mi código sigue las guías de estilo del proyecto
- [ ] He realizado un self-review de mi propio código
- [ ] He comentado mi código, particularmente en áreas complejas
- [ ] He actualizado la documentación según corresponda
- [ ] Mis cambios no generan nuevos warnings
- [ ] He agregado tests que prueban mi fix/feature
- [ ] Todos los tests existentes pasan localmente
- [ ] No he introducido secrets o datos sensibles

## Impacto en Otras Áreas

<!-- ¿Este cambio afecta otras partes del sistema? -->
<!-- Si es así, listar y notificar a los owners correspondientes -->

- [ ] No hay impacto
- [ ] Impacto en: [listar módulos/apps afectados]

## Notas Adicionales

<!-- Cualquier información adicional que los reviewers deban saber -->
```

### Proceso de Review

#### Timeline Esperado

| Tipo de PR | Tiempo Máximo de Review | Prioridad |
|------------|------------------------|-----------|
| Hotfix | <1 hora | Crítica |
| Bugfix | <4 horas | Alta |
| Feature pequeña | <24 horas | Media |
| Feature grande | <48 horas | Media |
| Refactor grande | <72 horas | Baja |
| Documentation | <24 horas | Baja |

#### Responsabilidades del Reviewer

1. **Revisar dentro del timeline** comprometido
2. **Probar localmente** si el cambio es complejo
3. **Comentar constructivamente** (no solo "LGTM")
4. **Validar criterios de aceptación** del ticket
5. **Verificar tests** y cobertura
6. **Chequear seguridad** (SQL injection, XSS, auth, etc.)
7. **Confirmar documentación** actualizada

#### Tipos de Comentarios

- **[BLOCKER]**: Problema crítico que impide el merge
- **[MAJOR]**: Problema importante que debe resolverse
- **[MINOR]**: Mejora sugerida, no bloquea el merge
- **[QUESTION]**: Duda o solicitud de clarificación
- **[NIT]**: Nitpick, detalle menor opcional

**Ejemplo:**
```markdown
[BLOCKER] Esta consulta SQL es vulnerable a inyección.
Usar parámetros en lugar de concatenación de strings.

[QUESTION] ¿Por qué elegiste este algoritmo sobre [alternativa]?

[NIT] Considera extraer esta lógica a una función separada.
```

### Aprobación y Merge

#### Criterios de Aprobación

Un PR puede ser mergeado cuando:

- ✅ CI/CD pasa todos los checks
- ✅ Mínimo 1 approval de code owner
- ✅ Todos los comentarios BLOCKER y MAJOR resueltos
- ✅ No hay conflicts con main
- ✅ Tests passing (incluyendo e2e si aplica)

#### Estrategias de Merge

| Estrategia | Cuándo Usar | Ventajas | Desventajas |
|------------|-------------|----------|-------------|
| **Squash & Merge** | Features, bugfixes | Historial limpio, 1 commit por feature | Pierde detalle de commits intermedios |
| **Rebase & Merge** | Hotfixes, PRs pequeños | Historial lineal, mantiene commits | Puede reescribir historial |
| **Create Merge Commit** | Releases, cambios grandes | Preserva contexto completo | Historial más ruidoso |

**Recomendación:** Usar **Squash & Merge** para el 90% de los casos.

---

## Convenciones de Commits

### Formato

Usamos **Conventional Commits** (https://www.conventionalcommits.org/):

```
<type>(<scope>): <description>

[optional body]

[optional footer(s)]
```

### Tipos

| Type | Descripción | Ejemplo |
|------|-------------|---------|
| `feat` | Nueva funcionalidad | `feat(pos): agregar módulo de inventario` |
| `fix` | Corrección de bug | `fix(auth): resolver token expiration incorrecto` |
| `docs` | Solo documentación | `docs(readme): actualizar instrucciones de setup` |
| `style` | Formato, sin cambio lógico | `style(components): ajustar indentación` |
| `refactor` | Refactorización, sin cambio funcional | `refactor(billing): extraer cálculo de impuestos` |
| `perf` | Mejora de performance | `perf(query): agregar índice en tabla orders` |
| `test` | Agregar/modificar tests | `test(auth): agregar tests de OAuth flow` |
| `build` | Cambios en build system | `build(webpack): actualizar a v5` |
| `ci` | Cambios en CI/CD | `ci(github-actions): parallelize test jobs` |
| `chore` | Mantenimiento, sin cambio en src | `chore(deps): actualizar librerías` |
| `revert` | Revertir commit anterior | `revert: revert "feat(x): ..."` |

### Scopes Comunes

- `platform`: Platform Core
- `pos`: POS Application
- `auth`: Autenticación/Autorización
- `billing`: Facturación
- `multi-tenancy`: Multi-tenancy
- `ui`: Componentes UI
- `api`: API REST
- `workers`: Workers en Go
- `infra`: Infraestructura
- `docs`: Documentación
- `deps`: Dependencias

### Ejemplos

```bash
# Feature
feat(pos): agregar búsqueda de productos por código de barras

Closes #142

- Implementar scanner de código de barras
- Agregar endpoint GET /products/:barcode
- Tests E2E para flujo completo

# Fix
fix(auth): resolver sesión expira prematuramente

El token de refresco no se estaba renovando correctamente
cuando el usuario realizaba múltiples peticiones simultáneas.

BREAKING CHANGE: El tiempo de expiración cambia de 15min a 30min

# Docs
docs(api): documentar endpoints de facturación

# Refactor
refactor(billing): extraer cálculo de impuestos a servicio separado

Mejora la testabilidad y permite reutilizar la lógica
en otros módulos.

# Chore
chore(deps): actualizar React a v18.2.0

# Release
release: preparar versión v1.2.0
```

### Herramientas

**Commitlint** para validar commits:

```json
// .commitlintrc.json
{
  "extends": ["@commitlint/config-conventional"],
  "rules": {
    "type-enum": [
      2,
      "always",
      [
        "feat",
        "fix",
        "docs",
        "style",
        "refactor",
        "perf",
        "test",
        "build",
        "ci",
        "chore",
        "revert",
        "release"
      ]
    ],
    "subject-case": [2, "always", "lower-case"],
    "header-max-length": [2, "always", 100]
  }
}
```

**Commitizen** para commits interactivos:

```bash
npm install -g commitizen cz-conventional-changelog
echo '{ "path": "cz-conventional-changelog" }' > .czrc

# Uso:
git cz  # En lugar de git commit
```

---

## Políticas de Merge

### Ramas Protegidas

#### `main`

**Configuración en GitHub:**

```yaml
Branch: main
Protection Rules:
  ✅ Require a pull request before merging
    - Required approvals: 1
    - Dismiss stale pull request approvals when new commits are pushed
    - Require approval from the most recently reviewed code owners
  ✅ Require status checks to pass before merging
    - Status checks required:
      - CI / Build
      - CI / Test
      - CI / Lint
      - Security Scan
    - Require branches to be up to date before merging
  ✅ Require conversation resolution before merging
  ✅ Include administrators (todos, incluso admins, deben seguir reglas)
  ❌ Allow force pushes: NO
  ❌ Allow deletions: NO
  ✅ Require linear history: Opcional (recomendado)
  ✅ Create a status check for deployment: Opcional
```

#### `develop` (si existe)

```yaml
Branch: develop
Protection Rules:
  ✅ Require a pull request before merging
    - Required approvals: 1
  ✅ Require status checks to pass before merging
    - Status checks required:
      - CI / Build
      - CI / Test
  ❌ Allow force pushes: NO
  ❌ Allow deletions: NO
```

### Conflict Resolution

**Responsabilidad:** El autor del PR debe resolver conflictos.

**Proceso:**

```bash
# 1. Fetch main más reciente
git fetch origin main

# 2. Rebasear (recomendado) o mergear
git rebase origin/main
# O alternativamente:
# git merge origin/main

# 3. Resolver conflictos en editor
# 4. Continuar rebase
git rebase --continue

# 5. Force push (necesario después de rebase)
git push --force-with-lease
```

**Nota:** Usar `--force-with-lease` en lugar de `--force` para evitar sobrescribir trabajo de otros.

### Backout Policy

Si un merge causa problemas en producción:

1. **Identificar el commit problemático**
2. **Crear hotfix immediately**
3. **Revertir el commit:**
   ```bash
   git revert <commit-hash>
   git push origin main
   ```
4. **Investigar root cause**
5. **Documentar learnings**

**Regla:** Nunca editar historial de main después de un merge. Siempre usar `revert`.

---

## Gestión de Releases

### Versionado Semántico

**Formato:** `MAJOR.MINOR.PATCH` (SemVer 2.0.0)

- **MAJOR**: Breaking changes (incompatibilidad hacia atrás)
- **MINOR**: Nuevas funcionalidades (compatibles hacia atrás)
- **PATCH**: Bug fixes (compatibles hacia atrás)

**Ejemplos:**
- `1.0.0` → Primer release estable
- `1.2.3` → 1 major, 2 minor, 3 patch
- `2.0.0` → Breaking changes desde 1.x

### Automatización con Changesets

**Workflow:** `.github/workflows/release.yml`

```yaml
name: Release

on:
  push:
    branches: [main]

jobs:
  release:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0
          
      - name: Setup Node
        uses: actions/setup-node@v4
        
      - name: Install dependencies
        run: pnpm install
        
      - name: Create Release PR or Publish
        uses: changesets/action@v1
        with:
          version: pnpm exec changeset version
          publish: pnpm exec changeset publish
          title: "chore: version packages"
          commit: "chore: version packages"
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          NPM_TOKEN: ${{ secrets.NPM_TOKEN }}
          
      - name: Create Git Tag
        run: |
          VERSION=$(node -p "require('./package.json').version")
          git tag v$VERSION
          git push origin v$VERSION
```

### CHANGELOG

**Archivo:** `CHANGELOG.md`

Generado automáticamente por Changesets, formato Keep a Changelog:

```markdown
# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.2.0] - 2025-01-15

### Added
- Marketplace catalog con soporte para múltiples planes por aplicación
- SSO integrado con Keycloak
- Dashboard de gestión de instancias

### Changed
- Actualizado React a v18.2.0
- Mejorado performance de queries de billing

### Fixed
- Resuelto problema de timeout en aprovisionamiento de instancias dedicadas
- Corregido cálculo de impuestos para clientes internacionales

### Deprecated
- API v1 de billing (será removida en v2.0.0)

### Removed
- Soporte para Node.js 16 (mínimo ahora es Node 18)

### Security
- Parcheada vulnerabilidad XSS en formulario de login
```

---

## Métricas y Calidad

### Métricas de Proceso

| Métrica | Objetivo | Cómo Medir |
|---------|----------|------------|
| **Lead Time** | <3 días | Desde commit a deploy |
| **Deployment Frequency** | Diario o más | Deploys a producción por día |
| **Change Failure Rate** | <5% | % de deploys que causan incidentes |
| **MTTR** | <1 hora | Tiempo promedio de recuperación |
| **PR Review Time** | <24 horas | Tiempo promedio de review |
| **Code Coverage** | >80% | Cobertura de tests unitarios |
| **Technical Debt Ratio** | <5% | Deuda técnica vs tamaño de código |

### Quality Gates

**CI debe fallar si:**

- ❌ Tests unitarios <80% coverage
- ❌ Tests de integración fallan
- ❌ Linter reporta errores
- ❌ Vulnerabilidades críticas detectadas
- ❌ Build falla
- ❌ Breaking changes sin versionado MAJOR

**Herramientas Recomendadas:**

- **Tests:** Jest, Vitest, xUnit, pytest
- **Coverage:** Istanbul/Jest, Coverlet, codecov.io
- **Linting:** ESLint, Prettier, EditorConfig
- **Security:** Snyk, Dependabot, GitHub Security Advisories
- **Code Quality:** SonarQube, CodeClimate

### Dashboards

**Integrar con:**

- GitHub Insights (built-in)
- Codecov (coverage)
- SonarCloud (calidad de código)
- Grafana (métricas custom)

---

## Apéndice: Comandos Útiles

### Git Daily

```bash
# Ver estado
git status

# Ver historial
git log --oneline -10

# Ver cambios no commiteados
git diff

# Ver cambios staged
git diff --cached

# Deshacer cambios locales
git checkout -- <archivo>

# Deshacer commit (manteniendo cambios)
git reset --soft HEAD~1

# Limpiar ramas eliminadas remotamente
git fetch --prune
```

### Branch Management

```bash
# Listar ramas
git branch -a

# Crear rama
git checkout -b feature/nueva

# Cambiar de rama
git checkout <rama>

# Eliminar rama local
git branch -d <rama>

# Eliminar rama remota
git push origin --delete <rama>

# Ver ramas merged
git branch --merged main
```

### Troubleshooting

```bash
# Abortar rebase
git rebase --abort

# Continuar rebase
git rebase --continue

# Forzar push seguro
git push --force-with-lease

# Recuperar commit perdido
git reflog
git reset --hard <commit>

# Resolver conflicto de merge
git mergetool
```

---

## Referencias

- [Conventional Commits](https://www.conventionalcommits.org/)
- [Semantic Versioning](https://semver.org/)
- [Keep a Changelog](https://keepachangelog.com/)
- [GitHub Flow](https://guides.github.com/introduction/flow/)
- [GitHub CODEOWNERS](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners)
- [Changesets](https://github.com/atlassian/changesets)

---

**Documento aprobado por:** Architecture Board  
**Próxima revisión:** Sprint 3  
**Owner:** Tech Lead
