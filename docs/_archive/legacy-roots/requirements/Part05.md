# Documento Fundacional

# Farutech Cloud Platform

# Parte 5 — Modelo de Ingeniería Asistida por Inteligencia Artificial (AI Engineering Operating System)

---

# 1. Introducción

Farutech Cloud Platform adopta un modelo de ingeniería donde la Inteligencia Artificial forma parte del equipo de desarrollo como un colaborador permanente.

La IA no sustituye a los ingenieros, arquitectos o responsables de producto. Su función es ampliar las capacidades del equipo, acelerar actividades repetitivas, mejorar la calidad del software y reducir el tiempo necesario para transformar una idea en una funcionalidad desplegada.

Este modelo define la manera en que las personas y los agentes de IA colaboran dentro de un mismo proceso de ingeniería, manteniendo la gobernanza, la trazabilidad y la calidad como principios fundamentales.

El objetivo no es "generar código más rápido", sino construir un sistema de desarrollo donde cada decisión esté respaldada por contexto, estándares y conocimiento compartido.

---

# 2. Principios del Modelo de IA

Toda interacción con agentes de IA debe respetar los siguientes principios:

### La IA trabaja sobre contexto, no sobre suposiciones

Ningún agente debe comenzar una tarea sin comprender:

* la visión del producto,
* la arquitectura vigente,
* las decisiones técnicas,
* los lineamientos de desarrollo,
* la tarea asignada,
* las restricciones funcionales y no funcionales.

El primer paso de cualquier agente siempre será construir el contexto antes de producir resultados.

---

### La documentación tiene prioridad sobre el código

Los agentes no utilizarán el código como única fuente de información.

Antes de modificar cualquier componente deberán revisar:

* documentación funcional,
* arquitectura,
* ADR,
* especificaciones,
* estándares,
* tareas relacionadas,
* decisiones previas.

---

### Ningún agente toma decisiones arquitectónicas por sí solo

Las decisiones estratégicas permanecen bajo control humano o del proceso formal de gobernanza.

La IA puede proponer alternativas, analizar impactos o identificar riesgos, pero no modificar la arquitectura sin una decisión explícita.

---

### Todo cambio debe ser verificable

Cada modificación realizada por un agente debe demostrar que:

* cumple la especificación,
* mantiene compatibilidad,
* supera las pruebas existentes,
* incorpora nuevas pruebas cuando corresponda,
* actualiza la documentación afectada.

---

# 3. Modelo Organizacional de Agentes

Los agentes se organizan siguiendo la misma estructura que un equipo de ingeniería.

No existe un único agente encargado de todo el desarrollo.

Cada agente posee un dominio de especialización claramente definido.

Esto permite:

* reducir errores,
* aumentar la calidad,
* distribuir responsabilidades,
* facilitar la evolución del sistema.

---

# 4. El Orquestador

El Orquestador es el punto de entrada para cualquier solicitud.

Nunca implementa código.

Su responsabilidad consiste en comprender la necesidad y coordinar el trabajo del resto de especialistas.

Funciones principales:

* analizar el requerimiento,
* recopilar contexto,
* identificar dependencias,
* seleccionar especialistas,
* dividir el trabajo,
* validar la secuencia de ejecución,
* consolidar resultados.

Es equivalente al rol de un Engineering Manager o Tech Lead.

---

# 5. Flujo General de Trabajo

Toda solicitud sigue el mismo proceso:

```text
Solicitud

↓

Orquestador

↓

Análisis de contexto

↓

Identificación de impacto

↓

Asignación de especialistas

↓

Implementación coordinada

↓

Validación cruzada

↓

Pruebas

↓

Documentación

↓

Entrega
```

Ningún agente trabaja directamente sobre una solicitud sin pasar por este flujo.

---

# 6. Especialistas de Ingeniería

El ecosistema inicial contempla, como mínimo, los siguientes especialistas.

## Arquitecto de Software

Responsable de:

* analizar impacto arquitectónico,
* validar patrones,
* evitar acoplamientos,
* identificar reutilización,
* proponer evolución de la plataforma.

Nunca implementa directamente funcionalidades.

---

## Product Analyst

Responsable de:

* interpretar requerimientos,
* transformar necesidades en especificaciones,
* validar criterios de aceptación,
* detectar ambigüedades.

---

## Backend Engineer

Especialista en:

* .NET 10,
* Clean Architecture,
* Domain Driven Design,
* PostgreSQL,
* APIs,
* seguridad,
* mensajería.

---

## Frontend Engineer

Especialista en:

* React,
* Vite,
* TypeScript,
* Microfrontends,
* accesibilidad,
* rendimiento,
* experiencia de usuario.

---

## Worker & Integration Engineer

Especialista en:

* Go,
* colas,
* procesamiento asíncrono,
* integración entre aplicaciones,
* resiliencia,
* reintentos,
* flujos distribuidos.

---

## Database Engineer

Responsable de:

* PostgreSQL,
* multi-tenancy,
* diseño de esquemas,
* optimización,
* índices,
* migraciones,
* rendimiento.

---

## Security Engineer

Especialista en:

* OAuth2,
* OpenID Connect,
* autorización,
* autenticación,
* protección de APIs,
* hardening,
* gestión de secretos.

---

## QA Automation Engineer

Responsable de:

* pruebas unitarias,
* integración,
* E2E,
* rendimiento,
* cobertura,
* validación de regresión.

---

## DevOps Engineer

Especialista en:

* Docker,
* Coolify,
* GitHub Actions,
* despliegues,
* observabilidad,
* infraestructura.

---

## Technical Writer

Responsable de mantener:

* README,
* documentación técnica,
* diagramas,
* changelog,
* ADR,
* manuales.

Toda modificación relevante debe reflejarse en la documentación correspondiente.

---

# 7. Agentes de Calidad

Además de los especialistas funcionales, existirán agentes dedicados exclusivamente al aseguramiento de calidad.

Ejemplos:

* Revisor de arquitectura.
* Revisor de seguridad.
* Revisor de rendimiento.
* Revisor de mantenibilidad.
* Revisor de duplicación de código.
* Revisor de documentación.
* Revisor de estándares.

Estos agentes no generan funcionalidades; únicamente validan el trabajo realizado por otros.

---

# 8. Modelo de Ejecución

Cada especialista recibe únicamente la información necesaria para su responsabilidad.

No todos los agentes necesitan conocer todo el proyecto.

El Orquestador se encarga de proporcionar el contexto adecuado, evitando sobrecargar a los especialistas con información irrelevante.

Este enfoque mejora:

* precisión,
* velocidad,
* consistencia,
* mantenibilidad de los prompts.

---

# 9. Gestión del Contexto

Antes de iniciar cualquier implementación, el Orquestador debe realizar un barrido completo del repositorio.

Como mínimo debe revisar:

* documentación general,
* arquitectura,
* ADR,
* tareas relacionadas,
* código existente,
* paquetes reutilizables,
* estándares,
* resultados de auditorías,
* backlog asociado.

El objetivo es comprender el estado actual antes de proponer cambios.

---

# 10. Validaciones Obligatorias

Ninguna tarea se considera finalizada hasta completar las siguientes validaciones:

* compilación exitosa,
* pruebas unitarias,
* pruebas de integración,
* pruebas E2E cuando apliquen,
* análisis estático,
* revisión de seguridad,
* ausencia de duplicación innecesaria,
* documentación actualizada,
* cumplimiento de Definition of Done.

---

# 11. Gestión del Conocimiento

Los agentes no almacenan conocimiento permanente.

Todo conocimiento generado debe materializarse en artefactos versionados:

* documentación,
* ADR,
* diagramas,
* tareas,
* comentarios relevantes,
* changelog.

Esto garantiza que el conocimiento permanezca en la organización y no dependa de una conversación específica.

---

# 12. Evolución de los Agentes

Los agentes son componentes evolutivos.

Con el tiempo podrán:

* incorporar nuevas especialidades,
* mejorar criterios de revisión,
* ampliar su contexto,
* adaptarse a nuevas tecnologías.

La evolución de un agente seguirá el mismo proceso de gobernanza que cualquier otro componente de la plataforma.

---

# 13. Medición del Desempeño

La calidad del trabajo de los agentes debe evaluarse mediante indicadores objetivos, por ejemplo:

* porcentaje de tareas aceptadas sin retrabajo,
* defectos encontrados en revisión,
* cobertura de pruebas generadas,
* documentación actualizada,
* reutilización de componentes,
* tiempo de ciclo,
* cumplimiento de estándares.

El objetivo es mejorar continuamente el sistema, no medir productividad individual.

---

# 14. Convivencia entre Personas e IA

La responsabilidad final sobre el producto siempre recae en el equipo humano.

La IA actúa como colaborador técnico especializado.

Las personas mantienen la autoridad sobre:

* visión de producto,
* decisiones estratégicas,
* prioridades,
* arquitectura,
* liberaciones,
* aceptación final.

Este equilibrio garantiza que la automatización incremente la capacidad del equipo sin sustituir el juicio humano.

---

# 15. Visión Futura

El objetivo final de este modelo es construir una organización donde el conocimiento, los procesos, las herramientas y los agentes de IA formen un único sistema de ingeniería cohesionado.

Cada nuevo proyecto, aplicación o equipo debe integrarse naturalmente a este modelo, reutilizando estándares, capacidades y conocimiento acumulado.

De esta manera, Farutech Cloud Platform podrá evolucionar de forma sostenible, manteniendo una alta calidad técnica y una capacidad de entrega creciente, independientemente del tamaño de la organización o de las tecnologías utilizadas.

---

## Mi propuesta para la Parte 6

Creo que todavía falta un documento que, en mi opinión, será el "pegamento" de todo el ecosistema: la **Arquitectura del Conocimiento y la Gobernanza Documental**.

No hablaría solo de carpetas `docs/`, sino de definir **qué documentos existen, quién los crea, quién los mantiene, cómo se relacionan entre sí y cómo los descubren tanto los desarrolladores como los agentes de IA**. Ahí estableceríamos un sistema documental vivo con ADR, RFC, especificaciones, lineamientos, tareas, prompts, agentes y manuales, convirtiendo la documentación en la fuente oficial de verdad de la plataforma. Creo que esa pieza cerraría de forma muy sólida todo el modelo de ingeniería que estamos construyendo.
