# FEATURE-011: Shared vs Dedicated Deployment Logic

**Épica Padre:** [EPIC-002](../epics/EPIC-002.md) - Multi-Tenancy Core  
**Prioridad:** Must Have  
**Estado:** To Do  
**Story Points:** 8 SP  
**Horas Estimadas:** 26h  
**Responsable:** Backend Lead + Platform Architect

## 📖 Descripción
Implementar lógica de enrutamiento y gestión que permita a la plataforma operar simultáneamente en modo "Shared" (multi-tenant con recursos compartidos) y "Dedicated" (infraestructura exclusiva por organización), resolviendo dinámicamente la estrategia de despliegue según el plan contratado por cada instancia.

## 🎯 Objetivo de Negocio
Maximizar flexibilidad operativa ofreciendo opciones de despliegue compartidas (costo eficiente) y dedicadas (alto rendimiento/aislamiento) dentro de la misma plataforma, permitiendo a clientes elegir según sus necesidades presupuestarias y de cumplimiento normativo.

## 📋 Alcance Técnico
- Diseñar sistema de resolución de deployment type al crear instancia
- Implementar factory pattern para creación de recursos según tipo
- Configurar connection strings dinámicas basadas en deployment type
- Crear abstracción de infraestructura transparente para aplicaciones
- Implementar métricas diferenciadas por tipo de despliegue
- Diseñar UI para selección de deployment type en marketplace

## 👥 User Stories Asociadas
- [STORY-046](../stories/STORY-046.md) - Como Usuario, quiero elegir entre Shared o Dedicated al contratar
- [STORY-047](../stories/STORY-047.md) - Como Platform, quiero resolver deployment type automáticamente
- [STORY-048](../stories/STORY-048.md) - Como Admin, quiero ver costos diferenciados por tipo
- [STORY-049](../stories/STORY-049.md) - Como Dev, quiero API transparente al tipo de despliegue
- [STORY-050](../stories/STORY-050.md) - Como QA, quiero tests que validen ambos modos

## ✅ Definition of Ready
- [ ] FEATURE-009 completada (schema-per-org operativo)
- [ ] FEATURE-010 completada (provisionamiento dedicated funcional)
- [ ] Definición de precios por tipo de despliegue establecida
- [ ] UX/UI para selección de deployment type diseñada

## ✅ Definition of Done
- [ ] Enum `DeploymentType { Shared, Dedicated }` implementado
- [ ] Factory de provisionamiento resuelve tipo correctamente
- [ ] Connection strings resueltas dinámicamente sin hardcoding
- [ ] Tests de integración cubren ambos modos de operación
- [ ] Dashboard muestra métricas separadas por tipo
- [ ] Documentación de diferencias y casos de uso publicada

## 🔗 Dependencias
- **Bloqueada por:** [FEATURE-010](FEATURE-010.md) - Database-per-Instance Provisioning
- **Bloquea a:** [FEATURE-012](FEATURE-012.md) - Tenant Context Resolution & Isolation

## 📊 Métricas de Éxito
- 100% de instancias creadas con deployment type correcto
- Tiempo de resolución de tipo < 1ms
- 0 errores de enrutamiento a base de datos incorrecta
- Satisfacción del usuario > 4.5/5 en selección de plan

## 📝 Notas de Implementación
- Usar strategy pattern para aislar lógica de cada tipo
- Implementar feature flags para habilitar/deshabilitar tipos
- Considerar costo total de propiedad (TCO) en recomendaciones automáticas
- Registrar decisiones de enrutamiento para auditoría
- Diseñar para futura expansión a modelos híbridos

## 🏷️ Tags
`multi-tenancy`, `deployment-strategy`, `shared-infrastructure`, `dedicated-infrastructure`, `platform-architecture`
