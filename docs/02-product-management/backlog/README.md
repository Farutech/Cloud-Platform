# Farutech Cloud Platform - Backlog Maestro

> **Estado**: Vigente V1 · **Owner**: CPO / Tech Lead  
> **Última Actualización**: 2025-01-XX  
> **Total Story Points**: 560 SP | **Total Horas Estimadas**: 1,680h

---

## 📊 Tablero General de Épicas

| ID | Épica | Estado | Features | Stories | Tasks | SP | Horas | Prioridad | Responsable |
|----|-------|--------|----------|---------|-------|----|----|-----------|-------------|
| [EPIC-001](epics/EPIC-001.md) | Setup Infraestructura & DevOps | 🔴 To Do | 8 | 24 | 68 | 40 | 120h | P0 - Crítica | DevOps Lead |
| [EPIC-002](epics/EPIC-002.md) | Multi-Tenancy Core | 🔴 To Do | 6 | 18 | 52 | 65 | 195h | P0 - Crítica | Tech Lead |
| [EPIC-003](epics/EPIC-003.md) | Identity & Access Management | 🔴 To Do | 5 | 15 | 43 | 55 | 165h | P0 - Crítica | Backend Lead |
| [EPIC-004](epics/EPIC-004.md) | Marketplace & Application Catalog | 🔴 To Do | 7 | 21 | 58 | 50 | 150h | P1 - Alta | Product Owner |
| [EPIC-005](epics/EPIC-005.md) | Organization & Instance Management | 🔴 To Do | 4 | 12 | 35 | 55 | 165h | P1 - Alta | Backend Lead |
| [EPIC-006](epics/EPIC-006.md) | Billing & Invoicing System | 🔴 To Do | 6 | 19 | 54 | 60 | 180h | P1 - Alta | Backend Lead |
| [EPIC-007](epics/EPIC-007.md) | Event Bus & Async Communication | 🔴 To Do | 5 | 14 | 38 | 45 | 135h | P1 - Alta | Tech Lead |
| [EPIC-008](epics/EPIC-008.md) | POS Application - Sales Module | 🔴 To Do | 8 | 28 | 76 | 70 | 210h | P2 - Media | POS Team Lead |
| [EPIC-009](epics/EPIC-009.md) | POS Application - Inventory | 🔴 To Do | 6 | 22 | 59 | 50 | 150h | P2 - Media | POS Team Lead |
| [EPIC-010](epics/EPIC-010.md) | Observability & Monitoring | 🔴 To Do | 5 | 16 | 42 | 40 | 120h | P1 - Alta | DevOps Lead |
| [EPIC-011](epics/EPIC-011.md) | Security Hardening | 🔴 To Do | 6 | 17 | 48 | 45 | 135h | P0 - Crítica | Security Lead |
| [EPIC-012](epics/EPIC-012.md) | Provisioning Automation | 🔴 To Do | 7 | 20 | 55 | 55 | 165h | P2 - Media | DevOps Lead |
| [EPIC-013](epics/EPIC-013.md) | Team Onboarding Program | 🟡 In Progress | 4 | 14 | 37 | 30 | 90h | P1 - Alta | Tech Lead |

### Leyenda de Estados
- 🔴 **To Do**: No iniciado
- 🟡 **In Progress**: En desarrollo
- 🟢 **Done**: Completado

---

## 🎯 Progreso por Fase del Roadmap

### Fase 1: Fundación (Sprints 0-2)
- **Épicas**: EPIC-001, EPIC-002, EPIC-003, EPIC-013
- **Progreso**: 0% completado
- **SP Totales**: 190 SP

### Fase 2: Core Plataforma (Sprints 3-6)
- **Épicas**: EPIC-004, EPIC-005, EPIC-006, EPIC-007, EPIC-010, EPIC-011
- **Progreso**: 0% completado
- **SP Totales**: 255 SP

### Fase 3: Primera Aplicación (Sprints 7-10)
- **Épicas**: EPIC-008, EPIC-009
- **Progreso**: 0% completado
- **SP Totales**: 120 SP

### Fase 4: Automatización (Sprints 11-12)
- **Épicas**: EPIC-012
- **Progreso**: 0% completado
- **SP Totales**: 55 SP

---

## 📁 Estructura del Backlog

```
backlog/
├── README.md                 # Este archivo - Tablero maestro
├── epics/                    # 13 épicas estratégicas
│   ├── EPIC-001.md
│   ├── EPIC-002.md
│   └── ...
├── features/                 # 47 features funcionales
│   ├── FEATURE-001.md
│   ├── FEATURE-002.md
│   └── ...
├── stories/                  # 156 user stories
│   ├── STORY-001.md
│   ├── STORY-002.md
│   └── ...
└── tasks/                    # 420+ tasks técnicas
    ├── TASK-001.md
    ├── TASK-002.md
    └── ...
```

---

## 🔍 Búsqueda Rápida

### Por ID
- **Épica**: `docs/02-product-management/backlog/epics/EPIC-XXX.md`
- **Feature**: `docs/02-product-management/backlog/features/FEATURE-XXX.md`
- **Story**: `docs/02-product-management/backlog/stories/STORY-XXX.md`
- **Task**: `docs/02-product-management/backlog/tasks/TASK-XXX.md`

### Por Responsabilidad
- **DevOps Lead**: EPIC-001, EPIC-010, EPIC-012
- **Tech Lead**: EPIC-002, EPIC-007, EPIC-013
- **Backend Lead**: EPIC-003, EPIC-005, EPIC-006
- **Product Owner**: EPIC-004
- **POS Team Lead**: EPIC-008, EPIC-009
- **Security Lead**: EPIC-011

### Por Prioridad
- **P0 - Crítica**: EPIC-001, EPIC-002, EPIC-003, EPIC-011
- **P1 - Alta**: EPIC-004, EPIC-005, EPIC-006, EPIC-007, EPIC-010, EPIC-013
- **P2 - Media**: EPIC-008, EPIC-009, EPIC-012

---

## 📈 Métricas Consolidadas

| Nivel | Cantidad | Total SP | Total Horas | % Completado |
|-------|----------|----------|-------------|--------------|
| **Épicas** | 13 | 560 | 1,680h | 0% |
| **Features** | 47 | - | - | 0% |
| **User Stories** | 156 | 560 | - | 0% |
| **Tasks Técnicas** | 420+ | - | 1,680h | 0% |

---

## 🚀 Flujo de Trabajo Ágil

### Sprint Planning
1. Revisar este tablero para identificar épicas prioritarias
2. Navegar a épicas seleccionadas para ver features
3. Seleccionar features y stories para el sprint
4. Asignar tasks a desarrolladores

### Daily Standup
1. Cada desarrollador revisa sus tasks asignadas
2. Actualiza estado en el archivo .md correspondiente
3. Reporta bloqueos en comentarios del PR o issue

### Sprint Review
1. Verificar todas las tasks completadas (estado = Done)
2. Actualizar estado de stories, features y épicas padre
3. Calcular velocidad del sprint (SP completados)

### Sprint Retrospective
1. Analizar desviaciones entre estimado vs real
2. Identificar mejoras de proceso
3. Ajustar estimaciones futuras

---

## 📋 Definición de Ready (DoR)

Una User Story está lista para comenzar cuando:
- [ ] Criterios de aceptación definidos claramente
- [ ] Dependencies identificadas y resueltas
- [ ] Diseño UI/UX aprobado (si aplica)
- [ ] Tasks técnicas desglosadas
- [ ] Estimación de SP completada
- [ ] Prioridad definida (MoSCoW)

---

## ✅ Definición de Done (DoD)

Una User Story está completa cuando:
- [ ] Código implementado y funcional
- [ ] Tests unitarios escritos (>80% cobertura)
- [ ] Tests de integración passing
- [ ] Code review aprobado (2 aprobaciones mín.)
- [ ] Documentación actualizada
- [ ] Deploy en staging exitoso
- [ ] QA validado criterios de aceptación
- [ ] Sin bugs críticos o mayores abiertos

---

## 🔗 Trazabilidad

Cada nivel mantiene trazabilidad bidireccional:

```
ÉPICA (Objetivo estratégico)
  ↓ Padre/Hijo
FEATURE (Capacidad funcional)
  ↓ Padre/Hijo
USER STORY (Requerimiento de usuario)
  ↓ Padre/Hijo
TASK TÉCNICA (Unidad de trabajo)
```

**Ejemplo de trazabilidad:**
- EPIC-001 → FEATURE-001 → STORY-001 → TASK-001, TASK-002, TASK-003, TASK-004

---

## 📝 Notas de Uso

1. **Actualización de Estados**: Cambiar estado inmediatamente al avanzar
2. **Comentarios**: Usar comentarios de GitHub para discusiones específicas
3. **No Duplicar**: Cada dato vive en un solo lugar
4. **Mantener Enlaces**: No eliminar referencias padre/hijo
5. **Versionar**: Actualizar versión en épicas con cambios significativos

---

## 🎯 Próximo Sprint: Sprint 0 (Semana 1-2)

**Épicas Activas**: EPIC-001, EPIC-013

**Tasks Prioritarias**:
- TASK-001: Crear organización en GitHub
- TASK-002: Configurar branch protection rules
- TASK-003: Definir CODEOWNERS inicial
- TASK-004: Crear teams básicos
- TASK-005: Provisionar VPS en proveedor cloud
- TASK-010: Crear documentación de bienvenida

**Responsables**:
- DevOps Lead: TASK-001, TASK-002, TASK-003, TASK-005
- Tech Lead: TASK-004, TASK-010

---

**Este tablero es la fuente única de verdad para la planificación y seguimiento del desarrollo de Farutech Cloud Platform.**

*Última actualización: 2025-01-XX | Versión: 1.0*
