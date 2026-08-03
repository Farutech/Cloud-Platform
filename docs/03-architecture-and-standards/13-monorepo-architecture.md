# Farutech Cloud Platform - Monorepo Architecture

> **Estado**: Vigente V1 · **Owner**: Tech Lead / Architecture Board · **Aprobación**: Required para Sprint 0
> **Actualización**: 2025-01-XX · **Revisión**: Cada 3 meses o cuando cambie la estructura

---

## 📋 Tabla de Contenidos

1. [Visión y Objetivos](#visión-y-objetivos)
2. [Estructura del Monorepo](#estructura-del-monorepo)
3. [Workspaces y Aislamiento](#workspaces-y-aislamiento)
4. [Configuración de Herramientas](#configuración-de-herramientas)
5. [Versionamiento Independiente](#versionamiento-independiente)
6. [Build Caching y CI/CD](#build-caching-y-cicd)
7. [Políticas de Acceso por Equipo](#políticas-de-acceso-por-equipo)
8. [Migración y Adopción](#migración-y-adopción)

---

## Visión y Objetivos

### Contexto

Farutech Cloud Platform evoluciona hacia un **monorepo moderno** que alberga múltiples aplicaciones, paquetes compartidos y servicios, manteniendo el aislamiento entre equipos y permitiendo desarrollo independiente.

### Problemas que Resuelve

1. **Duplicación de código**: Múltiples repositorios llevan a copiar lógica común
2. **Dependencias desincronizadas**: Diferentes versiones de paquetes compartidos
3. **Refactorizaciones complejas**: Cambios transversales requieren actualizar N repositorios
4. **Onboarding lento**: Nuevos desarrolladores deben clonar múltiples repos
5. **CI/CD fragmentado**: Pipelines separados para cada repo con configuraciones inconsistentes

### Objetivos del Monorepo

- ✅ **Código compartido visible**: Paquetes reutilizables en un solo lugar
- ✅ **Aislamiento de equipos**: Cada equipo trabaja en su workspace sin interferencias
- ✅ **Builds eficientes**: Solo se construye lo que cambió (incremental)
- ✅ **Versionamiento semántico**: Cada app/paquete tiene su propia versión
- ✅ **CI/CD unificado**: Un solo pipeline con etapas condicionales
- ✅ **Refactorizaciones atómicas**: Cambios transversales en un solo commit

---

## Estructura del Monorepo

### Árbol de Directorios

```
farutech-cloud-platform/
├── .github/                          # Workflows de GitHub Actions
│   ├── workflows/
│   │   ├── ci-main.yml               # CI principal (trigger: push a main)
│   │   ├── ci-pr.yml                 # CI para PRs (trigger: pull_request)
│   │   ├── release-apps.yml          # Release automático de aplicaciones
│   │   └── release-packages.yml      # Release automático de paquetes
│   └── CODEOWNERS                    # Dueños por directorio
│
├── apps/                             # Aplicaciones completas
│   ├── platform-core/                # Marketplace y gestión de plataforma
│   │   ├── src/
│   │   │   ├── api/                  # API REST (.NET 10)
│   │   │   ├── workers/              # Workers en Go
│   │   │   └── web/                  # Frontend React/Next.js
│   │   ├── package.json
│   │   ├── project.json              # Configuración Nx
│   │   └── README.md
│   │
│   ├── app-pos/                      # Aplicación POS (primera app de prueba)
│   │   ├── src/
│   │   │   ├── api/
│   │   │   ├── workers/
│   │   │   └── web/
│   │   ├── package.json
│   │   ├── project.json
│   │   └── README.md
│   │
│   └── app-erp/                      # Futura aplicación ERP
│       └── ...
│
├── packages/                         # Paquetes compartidos
│   ├── frontend/                     # Componentes UI reutilizables
│   │   ├── design-system/            # Design System corporativo
│   │   │   ├── src/
│   │   │   │   ├── components/
│   │   │   │   ├── hooks/
│   │   │   │   ├── styles/
│   │   │   │   └── index.ts
│   │   │   ├── package.json
│   │   │   └── README.md
│   │   │
│   │   ├── auth-client/              # Cliente de autenticación (OIDC)
│   │   └── event-client/             # Cliente para consumir eventos
│   │
│   ├── backend/                      # Paquetes .NET reutilizables
│   │   ├── multi-tenancy-core/       # Core de multi-tenancy
│   │   │   ├── src/
│   │   │   │   ├── Tenants/
│   │   │   │   ├── Schemas/
│   │   │   │   └── Middleware/
│   │   │   ├── Farutech.MultiTenancy.csproj
│   │   │   └── README.md
│   │   │
│   │   ├── event-bus-client/         # Cliente de mensajería (RabbitMQ/NATS)
│   │   ├── identity-client/          # Cliente de identidad (Keycloak)
│   │   └── logging-metrics/          # Logging y métricas estandarizados
│   │
│   └── shared/                       # Contratos y utilidades compartidas
│       ├── contracts/                # DTOs, eventos, schemas (Avro/Protobuf)
│       └── utils/                    # Utilidades transversales
│
├── services/                         # Servicios independientes
│   ├── service-identity/             # Servicio de identidad (Keycloak custom)
│   ├── service-billing/              # Servicio de facturación
│   └── service-notifications/        # Servicio de notificaciones
│
├── workers/                          # Workers genéricos en Go
│   ├── email-sender/
│   ├── pdf-generator/
│   └── data-sync/
│
├── infrastructure/                   # Infraestructura como código
│   ├── docker/                       # Dockerfiles y docker-compose
│   ├── kubernetes/                   # Manifests K8s (futuro)
│   ├── terraform/                    # Terraform para cloud (futuro)
│   └── coolify/                      # Configuración específica Coolify
│
├── docs/                             # Documentación (este repositorio)
│   ├── 00-meta/
│   ├── 01-vision-and-fundamentals/
│   ├── 02-product-management/
│   ├── 03-architecture-and-standards/
│   ├── 08-guides/
│   ├── 09-reference/
│   └── 13-onboarding/
│
├── tools/                            # Herramientas internas
│   ├── code-generators/              # Generadores de código
│   ├── scripts/                      # Scripts de utilidad
│   └── migrations/                   # Migraciones de base de datos
│
├── tests/                            # Tests E2E y de integración
│   ├── e2e-platform/
│   ├── e2e-pos/
│   └── integration/
│
├── .gitignore
├── .editorconfig
├── nx.json                           # Configuración de Nx
├── turbo.json                        # Configuración de Turbo (alternativa)
├── package.json                      # Raíz del monorepo (scripts globales)
├── pnpm-workspace.yaml               # Configuración de workspaces (pnpm)
├── Directory.Build.props             # Props globales .NET
└── README.md
```

### Reglas de Estructura

1. **`apps/`**: Aplicaciones completas con ciclo de vida independiente
2. **`packages/`**: Librerías reutilizables, NO ejecutables
3. **`services/`**: Servicios independientes (pueden deployarse solos)
4. **`workers/`**: Procesos en background (Go, Python, etc.)
5. **`infrastructure/`**: IaC y configuración de despliegue
6. **`tools/`**: Herramientas internas, no van a producción
7. **`tests/`**: Tests E2E que cruzan múltiples apps

---

## Workspaces y Aislamiento

### Configuración de PNPM (Frontend/Node)

**Archivo:** `pnpm-workspace.yaml`

```yaml
packages:
  # Todas las aplicaciones
  - 'apps/*'
  - 'apps/*/src/web'
  
  # Todos los paquetes frontend
  - 'packages/frontend/*'
  
  # Servicios Node.js
  - 'services/*'
  
  # NO incluir backend .NET ni workers Go
```

### Configuración de Nx (Build System)

**Archivo:** `nx.json`

```json
{
  "$schema": "./node_modules/nx/schemas/nx-schema.json",
  "npmScope": "farutech",
  "tasksRunnerOptions": {
    "default": {
      "runner": "nx/tasks-runners-default",
      "options": {
        "cacheableOperations": ["build", "lint", "test", "e2e"],
        "parallel": 4
      }
    }
  },
  "targetDefaults": {
    "build": {
      "dependsOn": ["^build"],
      "inputs": ["production", "^production"]
    },
    "test": {
      "inputs": ["default", "^production", "{workspaceRoot}/jest.preset.js"]
    }
  },
  "namedInputs": {
    "default": ["{projectRoot}/**/*", "sharedGlobals"],
    "production": [
      "default",
      "!{projectRoot}/**/?(*.)+(spec|test).[jt]s?(x)?(.snap)",
      "!{projectRoot}/tsconfig.spec.json",
      "!{projectRoot}/jest.config.[jt]s"
    ],
    "sharedGlobals": []
  },
  "workspaceLayout": {
    "appsDir": "apps",
    "libsDir": "packages"
  },
  "defaultBase": "main"
}
```

### Project Configuration (por app/paquete)

**Archivo:** `apps/platform-core/project.json`

```json
{
  "name": "platform-core",
  "$schema": "../../node_modules/nx/schemas/project-schema.json",
  "projectType": "application",
  "sourceRoot": "apps/platform-core/src",
  "targets": {
    "build": {
      "executor": "@nx/next:build",
      "outputs": ["{options.outputPath}"],
      "options": {
        "outputPath": "dist/apps/platform-core"
      },
      "configurations": {
        "production": {
          "optimization": true,
          "sourceMap": false
        }
      }
    },
    "serve": {
      "executor": "@nx/next:server",
      "options": {
        "buildTarget": "platform-core:build",
        "dev": true
      }
    },
    "test": {
      "executor": "@nx/jest:jest",
      "outputs": ["{workspaceRoot}/coverage/apps/platform-core"],
      "options": {
        "jestConfig": "apps/platform-core/jest.config.js"
      }
    },
    "lint": {
      "executor": "@nx/eslint:lint"
    }
  },
  "tags": ["scope:platform", "type:app"]
}
```

### Aislamiento de Equipos

| Equipo | Workspaces Asignados | Permisos |
|--------|---------------------|----------|
| **Plataforma** | `apps/platform-core`, `packages/*` | Write completo |
| **POS** | `apps/app-pos` | Write completo, Read en `packages/*` |
| **ERP** | `apps/app-erp` (futuro) | Write completo, Read en `packages/*` |
| **Infraestructura** | `infrastructure/`, `.github/` | Write completo |
| **QA** | `tests/` | Write completo, Read en todo |

**Regla de oro:** Un equipo SOLO puede modificar sus workspaces asignados directamente. Para cambiar paquetes compartidos, debe abrir PR y obtener aprobación del equipo dueño.

---

## Configuración de Herramientas

### Build Caching

**Herramienta recomendada:** Nx (para ecosistema mixto .NET + Node)

**Ventajas:**
- Cache distribuido (Nx Cloud)
- Ejecución paralela inteligente
- Grafo de dependencias visual
- Soporte para múltiples lenguajes

**Comandos útiles:**

```bash
# Ver grafo de dependencias
nx graph

# Construir solo lo afectado por cambios
nx affected:build

# Ejecutar tests en paralelo (máx 4 jobs)
nx run-many --target=test --parallel=4

# Construir una app específica con sus dependencias
nx build platform-core --with-deps

# Limpiar cache
nx reset
```

### Alternativa: Turborepo

Para proyectos más simples o si prefieres menos configuración:

**Archivo:** `turbo.json`

```json
{
  "$schema": "https://turbo.build/schema.json",
  "pipeline": {
    "build": {
      "dependsOn": ["^build"],
      "outputs": ["dist/**"]
    },
    "test": {
      "dependsOn": ["build"],
      "outputs": ["coverage/**"]
    },
    "lint": {},
    "dev": {
      "cache": false,
      "persistent": true
    }
  }
}
```

### Configuración .NET (Directory.Build.props)

**Archivo:** `Directory.Build.props`

```xml
<Project>
  <PropertyGroup>
    <TargetFramework>net10.0</TargetFramework>
    <Nullable>enable</Nullable>
    <ImplicitUsings>enable</ImplicitUsings>
    <TreatWarningsAsErrors>true</TreatWarningsAsErrors>
    
    <!-- NuGet packaging -->
    <Authors>Farutech</Authors>
    <Company>Farutech</Company>
    <Copyright>Copyright © Farutech 2025</Copyright>
    
    <!-- Source Link para debugging -->
    <PublishRepositoryUrl>true</PublishRepositoryUrl>
    <EmbedUntrackedSources>true</EmbedUntrackedSources>
    <IncludeSymbols>true</IncludeSymbols>
    <SymbolPackageFormat>snupkg</SymbolPackageFormat>
  </PropertyGroup>

  <ItemGroup>
    <PackageReference Include="Microsoft.SourceLink.GitHub" Version="8.0.0" PrivateAssets="All"/>
  </ItemGroup>
</Project>
```

---

## Versionamiento Independiente

### Estrategia de Versionado

Cada app y paquete tiene su **propia versión semántica** independiente:

```
apps/platform-core/       → v1.0.0
apps/app-pos/             → v0.3.1
packages/design-system/   → v2.1.0
packages/multi-tenancy/   → v1.4.2
```

### Convenciones de Versionado

**SemVer:** `MAJOR.MINOR.PATCH`

- **MAJOR**: Cambios incompatibles (breaking changes)
- **MINOR**: Nuevas funcionalidades compatibles
- **PATCH**: Bug fixes compatibles

### Automatización con Changesets

**Herramienta:** `@changesets/cli` para Node, `MinVer` para .NET

**Configuración Changesets:**

```bash
# Instalación
pnpm add -D @changesets/cli

# Inicialización
npx changeset init
```

**Archivo:** `.changeset/config.json`

```json
{
  "$schema": "https://unpkg.com/@changesets/config@3.0.0/schema.json",
  "changelog": "@changesets/cli/changelog",
  "commit": false,
  "fixed": [],
  "linked": [],
  "access": "restricted",
  "baseBranch": "main",
  "updateInternalDependencies": "patch",
  "ignore": []
}
```

**Flujo de trabajo:**

1. Desarrollador crea changeset al hacer feature/fix:
   ```bash
   npx changeset
   ```

2. Se genera archivo `.changeset/[random-name].md`:
   ```markdown
   ---
   "platform-core": minor
   "design-system": patch
   ---
   
   Nueva funcionalidad de marketplace
   Fix en componente Button
   ```

3. Al mergear a main, GitHub Actions:
   - Detecta changesets
   - Actualiza versiones en `package.json`
   - Genera CHANGELOG.md
   - Publica en npm registry (si es paquete)
   - Crea tag de release

### Versionado .NET con MinVer

**Paquete NuGet:** `MinVer`

**En `.csproj`:**

```xml
<PackageReference Include="MinVer" Version="4.3.0">
  <PrivateAssets>all</PrivateAssets>
  <IncludeAssets>runtime; build; native; contentfiles; analyzers</IncludeAssets>
</PackageReference>
```

MinVer usa tags de Git (`v1.2.3`) para determinar automáticamente la versión.

---

## Build Caching y CI/CD

### Pipeline Principal (GitHub Actions)

**Archivo:** `.github/workflows/ci-main.yml`

```yaml
name: CI - Main

on:
  push:
    branches: [main]

env:
  NX_CLOUD_ACCESS_TOKEN: ${{ secrets.NX_CLOUD_TOKEN }}

jobs:
  detect-changes:
    runs-on: ubuntu-latest
    outputs:
      platform-core: ${{ steps.filter.outputs.platform-core }}
      app-pos: ${{ steps.filter.outputs.app-pos }}
      packages: ${{ steps.filter.outputs.packages }}
    steps:
      - uses: actions/checkout@v4
      
      - uses: dorny/paths-filter@v3
        id: filter
        with:
          filters: |
            platform-core:
              - 'apps/platform-core/**'
              - 'packages/**'
            app-pos:
              - 'apps/app-pos/**'
              - 'packages/**'
            packages:
              - 'packages/**'

  build-platform-core:
    needs: detect-changes
    if: needs.detect-changes.outputs.platform-core == 'true'
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Setup Node
        uses: actions/setup-node@v4
        with:
          node-version: '20'
          
      - name: Setup .NET
        uses: actions/setup-dotnet@v4
        with:
          dotnet-version: '10.0.x'
          
      - name: Install dependencies
        run: pnpm install --frozen-lockfile
        
      - name: Build platform-core
        run: npx nx build platform-core --configuration=production
        
      - name: Test platform-core
        run: npx nx test platform-core --coverage
        
      - name: Upload coverage
        uses: codecov/codecov-action@v3
        with:
          files: ./coverage/apps/platform-core/lcov.info
          flags: platform-core

  build-app-pos:
    needs: detect-changes
    if: needs.detect-changes.outputs.app-pos == 'true'
    runs-on: ubuntu-latest
    steps:
      # Similar a build-platform-core...

  release-packages:
    needs: [build-platform-core, build-app-pos]
    if: needs.detect-changes.outputs.packages == 'true'
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0  # Necesario para MinVer/Changesets
          
      - name: Setup Node
        uses: actions/setup-node@v4
        
      - name: Install dependencies
        run: pnpm install
        
      - name: Create Release Pull Request or Publish
        uses: changesets/action@v1
        with:
          publish: pnpm exec changeset publish
          title: "chore: version packages"
          commit: "chore: version packages"
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          NPM_TOKEN: ${{ secrets.NPM_TOKEN }}
```

### Pipeline para PRs

**Archivo:** `.github/workflows/ci-pr.yml`

```yaml
name: CI - Pull Request

on:
  pull_request:
    branches: [main]

jobs:
  detect-affected:
    runs-on: ubuntu-latest
    outputs:
      affected-projects: ${{ steps.affected.outputs.projects }}
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0
          
      - name: Install dependencies
        run: pnpm install
        
      - name: Get affected projects
        id: affected
        run: |
          AFFECTED=$(npx nx affected:apps --plain --base=origin/main --head=HEAD)
          echo "projects=$AFFECTED" >> $GITHUB_OUTPUT

  lint-and-test:
    needs: detect-affected
    runs-on: ubuntu-latest
    if: needs.detect-affected.outputs.affected-projects != ''
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0
          
      - name: Setup Node & .NET
        # ... setup ...
        
      - name: Install dependencies
        run: pnpm install
        
      - name: Lint affected
        run: npx nx affected:lint --base=origin/main --head=HEAD
        
      - name: Test affected
        run: npx nx affected:test --base=origin/main --head=HEAD --coverage
```

---

## Políticas de Acceso por Equipo

### CODEOWNERS

**Archivo:** `.github/CODEOWNERS`

```codeowners
# Dueños por defecto (Platform Team)
* @farutech/platform-team

# Aplicaciones específicas
apps/platform-core/ @farutech/platform-team
apps/app-pos/ @farutech/pos-team
apps/app-erp/ @farutech/erp-team

# Paquetes compartidos
packages/frontend/ @farutech/frontend-leads
packages/backend/ @farutech/backend-leads
packages/shared/ @farutech/architecture-board

# Infraestructura
infrastructure/ @farutech/devops-team
.github/ @farutech/devops-team

# Documentación
docs/ @farutech/tech-leads

# Tests E2E
tests/ @farutech/qa-team
```

### Reglas de Branch Protection

**Configuración en GitHub:**

1. **Rama `main`:**
   - ✅ Require pull request reviews (min 1 approval)
   - ✅ Require CODEOWNERS review
   - ✅ Require status checks (CI must pass)
   - ✅ Require branches up to date before merging
   - ❌ No allow force pushes
   - ❌ No allow deletions

2. **Rama `develop`:** (opcional, si usas Git Flow)
   - Mismas reglas que main pero con approvals más flexibles

### Flujo de PR para Cambios Transversales

**Escenario:** Equipo POS necesita cambiar un componente del Design System

1. **Equipo POS** crea branch `feature/pos-new-button`
2. Modifica `packages/frontend/design-system/src/components/Button.tsx`
3. Abre PR a `main`
4. **GitHub** asigna automáticamente reviewers: `@farutech/frontend-leads`
5. **Frontend Leads** revisan el cambio
6. Si aprueban → merge
7. Si rechazan → feedback → nuevo commit

**Regla:** Nunca merges tu propio PR en paquetes compartidos.

---

## Migración y Adopción

### Plan de Migración (Si vienes de múltiples repos)

**Fase 1: Preparación (Semana 1)**
- [ ] Configurar estructura de directorios
- [ ] Instalar Nx/Turbo
- [ ] Configurar pnpm workspaces
- [ ] Crear scripts de migración

**Fase 2: Migración de Paquetes (Semana 2)**
- [ ] Mover paquetes compartidos a `packages/`
- [ ] Ajustar imports y paths
- [ ] Validar builds individuales
- [ ] Actualizar CI/CD

**Fase 3: Migración de Apps (Semana 3-4)**
- [ ] Mover aplicaciones a `apps/`
- [ ] Configurar project.json por app
- [ ] Ajustar dependencias cruzadas
- [ ] Validar builds completos

**Fase 4: Optimización (Semana 5)**
- [ ] Configurar Nx Cloud (cache distribuido)
- [ ] Ajustar parallelización
- [ ] Documentar procesos
- [ ] Capacitar equipos

### Comandos de Migración

```bash
# Ejemplo: Mover paquete existente
mkdir -p packages/frontend/design-system
mv ../old-design-system-repo/* packages/frontend/design-system/

# Ajustar package.json
cd packages/frontend/design-system
npm pkg set name="@farutech/design-system"
npm pkg set version "1.0.0"

# Agregar a workspace
# (automático con pnpm si está en packages/)

# Validar que Nx lo detecta
npx nx show project design-system
```

---

## Apéndice: Comandos Útiles

### Desarrollo Diario

```bash
# Ver todos los proyectos
npx nx show projects

# Ver grafo de dependencias
npx nx graph

# Construir proyecto específico
npx nx build platform-core

# Servir en modo desarrollo
npx nx serve platform-core

# Ejecutar tests
npx nx test platform-core

# Linkear
npx nx lint platform-core

# Construir todo (en paralelo)
npx nx run-many --target=build --all --parallel=4

# Construir solo lo afectado
npx nx affected:build

# Ver qué proyectos están afectados
npx nx affected:apps
```

### Liberación

```bash
# Crear changeset
npx changeset

# Versionar y publicar
npx changeset version
npx changeset publish

# O automático con GitHub Actions
# (ver workflow release-packages.yml)
```

### Mantenimiento

```bash
# Limpiar cache
npx nx reset

# Reparar dependencias
pnpm install --force

# Actualizar grafo
npx nx reset && npx nx graph
```

---

## Referencias

- [Nx Documentation](https://nx.dev/)
- [Turborepo Documentation](https://turbo.build/repo)
- [PNPM Workspaces](https://pnpm.io/workspaces)
- [Changesets](https://github.com/atlassian/changesets)
- [MinVer for .NET](https://github.com/adamralph/minver)
- [GitHub CODEOWNERS](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners)

---

**Documento aprobado por:** Architecture Board  
**Próxima revisión:** Q2 2025  
**Owner:** Tech Lead
