# Onboarding y Capacitación - Farutech Cloud Platform

> **Propósito**: Programa estructurado de onboarding para nuevos integrantes del equipo.  
> **Audiencia**: Nuevos desarrolladores, diseñadores, QA, DevOps, PMs.  
> **Estado**: En construcción - Fase 2 de reorganización documental.  
> **Owner**: Tech Lead + People Ops (futuro)

---

## 🎯 Objetivos del Onboarding

1. **Productividad rápida**: Que un nuevo integrante pueda hacer su primer commit en el Día 1
2. **Comprensión del ecosistema**: Entender la visión, arquitectura y cultura Farutech
3. **Autonomía progresiva**: Al final del Mes 1, poder trabajar independientemente en features
4. **Certificación**: Validar conocimientos mediante checkpoints y proyectos guiados

---

## 👥 Roles y Rutas de Aprendizaje

### 1. Backend Developer (.NET/Go)

#### Día 1: Bienvenida y Setup
- [ ] Reunión de bienvenida con Tech Lead (30 min)
- [ ] Acceso a repositorios y herramientas (GitHub, Coolify, Keycloak)
- [ ] Setup de entorno de desarrollo local ([GUIDE-INF-001](../08-guides/README.md))
- [ ] Primer commit: "Hello World" en un módulo de prueba
- [ ] Asignación de buddy (mentor temporal)

#### Semana 1: Fundamentos
- [ ] Leer [Visión del Producto](../01-vision-and-fundamentals/01-product-vision.md) (2 horas)
- [ ] Estudiar [Arquitectura de Plataforma](../01-vision-and-fundamentals/02-platform-architecture.md) (3 horas)
- [ ] Completar guía: [Creación de nuevo módulo backend](../08-guides/README.md) (GUIDE-BE-001)
- [ ] Implementar CQRS nativo en módulo de prueba ([GUIDE-BE-002](../08-guides/README.md))
- [ ] Reunión 1:1 con buddy para resolver dudas

#### Mes 1: Primera Feature
- [ ] Asignación de primera user story real (prioridad baja)
- [ ] Implementar feature siguiendo estándares ([coding-standards.md](../03-architecture-and-standards/03-coding-standards.md))
- [ ] Escribir tests unitarios (>80% cobertura)
- [ ] PR review con Tech Lead
- [ ] Deploy a staging y validación
- [ ] Retrospectiva de aprendizaje (30 min con Tech Lead)

#### Mes 3: Autonomía
- [ ] Haber completado al menos 3 features independientes
- [ ] Conducir un PR review de otro desarrollador
- [ ] Presentar una mejora técnica al equipo
- [ ] **Certificación Nivel 1: Backend Developer Certified**

---

### 2. Frontend Developer (React)

#### Día 1: Bienvenida y Setup
- [ ] Reunión de bienvenida con Tech Lead (30 min)
- [ ] Acceso a repositorios y herramientas
- [ ] Setup de entorno: Node.js, Vite, Storybook ([GUIDE-FE-001](../08-guides/README.md))
- [ ] Primer commit: Componente "Hello World" en Storybook
- [ ] Asignación de buddy

#### Semana 1: Fundamentos
- [ ] Leer [Visión del Producto](../01-vision-and-fundamentals/01-product-vision.md)
- [ ] Estudiar arquitectura de microfrontends ([ADR-004](../03-architecture-and-standards/01-architecture-decision-records/004-microfrontends-architecture.md))
- [ ] Explorar Design System compartido (Storybook)
- [ ] Completar guía: [Integración con Keycloak](../08-guides/README.md) (GUIDE-FE-003)
- [ ] Crear componente básico siguiendo estándares

#### Mes 1: Primera Feature
- [ ] Asignación de primera feature UI (ej: formulario CRUD)
- [ ] Implementar responsive design y accesibilidad (WCAG AA)
- [ ] Tests E2E con Playwright
- [ ] PR review con Tech Lead
- [ ] Deploy y validación en staging
- [ ] Retrospectiva de aprendizaje

#### Mes 3: Autonomía
- [ ] Haber completado al menos 3 features UI
- [ ] Contribuir al Design System (nuevo componente)
- [ ] Optimizar performance (Lighthouse score >90)
- [ ] **Certificación Nivel 1: Frontend Developer Certified**

---

### 3. DevOps Engineer

#### Día 1: Bienvenida y Setup
- [ ] Reunión con Tech Lead y arquitecto de infraestructura
- [ ] Acceso a: GitHub, Coolify, VPS, monitoreo
- [ ] Review de arquitectura actual de despliegue
- [ ] Primer commit: Mejora menor en pipeline CI/CD
- [ ] Asignación de buddy

#### Semana 1: Fundamentos
- [ ] Leer documentación de [deployment operations](../04-development-lifecycle/02-deployment-operations.md)
- [ ] Estudiar estrategia multi-tenant ([ADR-003](../03-architecture-and-standards/01-architecture-decision-records/003-multi-tenant-model.md))
- [ ] Completar guía: [CI/CD con GitHub Actions](../08-guides/README.md) (GUIDE-OPS-001)
- [ ] Desplegar ambiente de prueba en Coolify ([GUIDE-INF-002](../08-guides/README.md))
- [ ] Configurar monitoreo básico (Prometheus + Grafana)

#### Mes 1: Primera Mejora
- [ ] Implementar mejora en pipeline (ej: parallel jobs, caching)
- [ ] Automatizar deployment de staging
- [ ] Configurar alertas de monitoreo
- [ ] Documentar runbook de incidentes comunes
- [ ] Retrospectiva con equipo

#### Mes 3: Autonomía
- [ ] Haber liderado migración de un servicio a producción
- [ ] Implementar plan de disaster recovery
- [ ] Optimizar costos de infraestructura
- [ ] **Certificación Nivel 1: DevOps Engineer Certified**

---

### 4. UI/UX Designer

#### Día 1: Bienvenida y Setup
- [ ] Reunión con Product Owner y Tech Lead
- [ ] Acceso a: Figma, Storybook, repositorios
- [ ] Review del Design System actual
- [ ] Primer aporte: Mejora menor en componente existente
- [ ] Asignación de buddy

#### Semana 1: Fundamentos
- [ ] Leer [Visión del Producto](../01-vision-and-fundamentals/01-product-vision.md)
- [ ] Estudiar principios de diseño del ecosistema
- [ ] Explorar componentes en Storybook
- [ ] Crear mockup de feature pequeña
- [ ] Presentar diseño en review semanal

#### Mes 1: Primer Proyecto
- [ ] Diseñar flujo completo de una feature (ej: creación de instancia)
- [ ] Prototipo interactivo en Figma
- [ ] User testing con 3-5 personas
- [ ] Iterar basado en feedback
- [ ] Handoff a desarrollo con especificaciones

#### Mes 3: Autonomía
- [ ] Haber completado al menos 2 flujos completos
- [ ] Contribuir nueva sección al Design System
- [ ] Conducir sesión de design thinking
- [ ] **Certificación Nivel 1: UI/UX Designer Certified**

---

### 5. Product Manager

#### Día 1: Bienvenida y Setup
- [ ] Reunión con CPO/Head de Producto
- [ ] Acceso a: Jira/Linear, docs, analytics (futuro)
- [ ] Review del roadmap actual
- [ ] Asignación de área de producto inicial
- [ ] Asignación de buddy (PM senior)

#### Semana 1: Fundamentos
- [ ] Leer toda la documentación de [product management](../02-product-management/)
- [ ] Estudiar [épicas y features](../02-product-management/01-epics-and-features.md) actuales
- [ ] Revisar [roadmap](../02-product-management/02-roadmap-tasks.md)
- [ ] Entrevistas con stakeholders clave (Tech Lead, arquitecto)
- [ ] Shadowing en refinement y planning sessions

#### Mes 1: Primera Feature Own
- [ ] Escribir PRD para feature pequeña
- [ ] Definir user stories con criterios de aceptación
- [ ] Priorizar backlog con el equipo
- [ ] Seguir feature desde discovery hasta release
- [ ] Medir impacto post-release (métricas definidas)

#### Mes 3: Autonomía
- [ ] Gestionar roadmap de un área completa
- [ ] Conducir discovery de nuevas features
- [ ] Presentar resultados a stakeholders
- [ ] **Certificación Nivel 1: Product Manager Certified**

---

### 6. QA Engineer

#### Día 1: Bienvenida y Setup
- [ ] Reunión con Tech Lead y equipo de desarrollo
- [ ] Acceso a: repositorios, herramientas de testing
- [ ] Setup de entorno para pruebas
- [ ] Review de estrategia de testing actual
- [ ] Asignación de buddy

#### Semana 1: Fundamentos
- [ ] Leer documentación de [testing & quality](../04-development-lifecycle/03-testing-quality.md)
- [ ] Estudiar pirámide de testing adoptada
- [ ] Ejecutar tests existentes (unitarios, integración, E2E)
- [ ] Configurar Playwright para pruebas E2E locales
- [ ] Reportar primer bug encontrado

#### Mes 1: Primera Feature QA
- [ ] Escribir plan de testing para feature nueva
- [ ] Crear tests E2E con Playwright
- [ ] Validar cobertura de tests unitarios (>80%)
- [ ] Participar en PR reviews con foco en calidad
- [ ] Ejecutar smoke tests pre-deployment

#### Mes 3: Autonomía
- [ ] Definir estrategia de testing para feature compleja
- [ ] Implementar pruebas de performance básicas
- [ ] Automatizar regresión crítica
- [ ] **Certificación Nivel 1: QA Engineer Certified**

---

## 📚 Recursos de Aprendizaje

### Cursos Recomendados

| Rol | Curso | Plataforma | Duración |
|-----|-------|------------|----------|
| Backend | ".NET 10 Fundamentals" | Pluralsight | 8 horas |
| Backend | "Go: Getting Started" | LinkedIn Learning | 4 horas |
| Frontend | "React 18: The Complete Guide" | Udemy | 20 horas |
| Frontend | "Micro-Frontends in Practice" | O'Reilly | 6 horas |
| DevOps | "Kubernetes for the Absolute Beginners" | Udemy | 10 horas |
| DevOps | "GitHub Actions CI/CD" | A Cloud Guru | 8 horas |
| Todos | "Clean Architecture" | Coursera | 12 horas |
| Todos | "Event-Driven Architecture Fundamentals" | Event Store DB | 6 horas |

### Libros Obligatorios

1. **"Clean Architecture"** - Robert C. Martin (Todos los roles técnicos)
2. **"Designing Data-Intensive Applications"** - Martin Kleppmann (Backend, Arquitectos)
3. **"The Phoenix Project"** - Gene Kim (Todos los roles, cultura DevOps)
4. **"Inspired"** - Marty Cagan (PMs, Diseñadores)

### Blogs y Newsletters

- [.NET Blog](https://devblogs.microsoft.com/dotnet/)
- [React Blog](https://react.dev/blog)
- [Martin Fowler](https://martinfowler.com/)
- [InfoQ](https://www.infoq.com/)
- [AWS Architecture Blog](https://aws.amazon.com/blogs/architecture/)

---

## 🏆 Sistema de Certificación

### Niveles

| Nivel | Nombre | Requisitos | Beneficios |
|-------|--------|------------|------------|
| 1 | Certified Junior | Completar onboarding (Mes 3) + 3 features | Acceso a features más complejas |
| 2 | Certified Mid-Level | 6 meses + 10 features + mentoría a junior | Liderazgo técnico de features |
| 3 | Certified Senior | 12 meses + 20 features + contribuciones arquitectónicas | Decisiones técnicas, mentoring |
| 4 | Principal/Staff | 24 meses + impacto transversal | Estrategia técnica, arquitectura |

### Proceso de Certificación

1. **Auto-evaluación**: El colaborador solicita certificación cuando cumple requisitos
2. **Revisión de portfolio**: Tech Lead revisa contribuciones (PRs, features, mejoras)
3. **Evaluación técnica**: Entrevista o prueba práctica según rol
4. **Feedback 360**: Input de pares, manager, stakeholders
5. **Decisión**: Comité de certificación (Tech Lead, Arquitecto, Head de Área)
6. **Reconocimiento**: Anuncio público, actualización de título, ajuste salarial (si aplica)

---

## 🤝 Programa de Mentoría (Buddy System)

### ¿Qué es el Buddy System?

Cada nuevo integrante recibe un "buddy" (compañero) que lo acompaña durante sus primeros 3 meses.

### Responsabilidades del Buddy

- **Semana 1**: Check-in diario (15 min)
- **Semanas 2-4**: Check-in 3 veces por semana (30 min)
- **Mes 2-3**: Check-in semanal (45 min)
- **Disponible**: Para preguntas rápidas vía Slack/Teams
- **Guía**: Ayudar a navegar la cultura y procesos del equipo
- **Feedback**: Proporcionar retroalimentación constructiva

### Beneficios para el Buddy

- Desarrollo de habilidades de liderazgo
- Reconocimiento en evaluación de desempeño
- Puntos adicionales para certificación Senior
- Posible bono económico (a definir)

---

## 📊 Métricas de Éxito del Onboarding

| Métrica | Objetivo | Cómo se mide |
|---------|----------|--------------|
| Time to First Commit | < 1 día | Timestamp del primer PR mergeado |
| Time to First Feature | < 2 semanas | Desde día 1 hasta deploy de primera feature |
| Retención a 90 días | > 95% | % de nuevos que permanecen después de 3 meses |
| Satisfacción del onboarded | > 4.5/5 | Encuesta al finalizar Mes 3 |
| Productividad al Mes 3 | 70% de senior | Velocity comparativo con promedio del equipo |
| Bugs introducidos | < 2 en Mes 1 | Count de bugs atribuibles a código del nuevo |

---

## 🔄 Mejora Continua del Programa

El programa de onboarding se revisa trimestralmente:

1. **Feedback de nuevos integrantes**: Encuestas al finalizar Mes 1 y Mes 3
2. **Feedback de buddies**: Qué funcionó, qué mejorar
3. **Análisis de métricas**: Identificar cuellos de botella
4. **Actualización de contenido**: Mantener recursos vigentes
5. **Benchmarking**: Comparar con mejores prácticas de la industria

---

## 📅 Checklist de Onboarding (Resumen)

### Para el Nuevo Integrante

- [ ] Día 1: Setup completado, primer commit realizado
- [ ] Semana 1: Lecturas fundamentales completadas
- [ ] Mes 1: Primera feature en producción
- [ ] Mes 2: Segunda y tercera feature completadas
- [ ] Mes 3: Certificación Nivel 1 obtenida

### Para el Manager/Tech Lead

- [ ] Antes del Día 1: Equipo notificado, accesos preparados, buddy asignado
- [ ] Día 1: Reunión de bienvenida realizada
- [ ] Semana 1: Check-ins programados, lecturas asignadas
- [ ] Mes 1: Feature asignada, PR review realizado
- [ ] Mes 3: Evaluación de certificación agendada

### Para el Buddy

- [ ] Día 1: Presentación y tour virtual
- [ ] Semana 1: Check-ins diarios, preguntas respondidas
- [ ] Mes 1: Apoyo en primera feature, code reviews
- [ ] Mes 2-3: Transición gradual a autonomía
- [ ] Mes 3: Feedback final y celebración

---

## 🚀 Próximo Hito

**Objetivo**: Tener el programa de onboarding completamente documentado y listo para ejecutar antes de la incorporación del primer desarrollador.

**Responsable**: Tech Lead + People Ops (futuro)  
**Fecha límite**: [Definir según hiring plan]

---

**Nota**: Este programa será integrado en el futuro Engineering Knowledge System (EKS) con seguimiento automatizado de progreso, recordatorios de check-ins y dashboard de métricas de onboarding.
