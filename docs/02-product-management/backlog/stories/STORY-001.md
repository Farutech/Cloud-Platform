# STORY-001: Configurar GitHub Organization

> **Feature Padre**: [FEATURE-001](../features/FEATURE-001.md)  
> **Épica Abuela**: [EPIC-001](../epics/EPIC-001.md)  
> **Estado**: 🔴 To Do  
> **Story Points**: 2 SP  
> **Prioridad**: Must Have (MoSCoW)  
> **Responsable**: DevOps Lead  
> **Versión**: 1.0

---

## 📖 Historia de Usuario

**Como** Administrador de Plataforma  
**Quiero** crear y configurar la organización en GitHub  
**Para** tener un espacio centralizado para gestionar repositorios, equipos y permisos de desarrollo

---

## ✅ Criterios de Aceptación (BDD)

### Scenario 1: Crear organización
**Given** que tengo una cuenta GitHub empresarial  
**When** creo una nueva organización llamada "Farutech"  
**Then** la organización debe estar activa y accesible para admins  
**And** debe tener visibilidad privada configurada

### Scenario 2: Configurar información básica
**Given** que la organización existe  
**When** configuro logo, descripción y email de contacto  
**Then** la información debe ser visible públicamente (para miembros)  
**And** el email debe recibir notificaciones de GitHub

### Scenario 3: Invitar primeros miembros
**Given** que la org está creada  
**When** invito a 3 usuarios iniciales (Tech Lead, 2 Devs)  
**Then** los usuarios deben recibir email de invitación  
**And** poder unirse aceptando la invitación

---

## 📋 Tasks Técnicas Asociadas

| ID | Task | Estado | Horas | Responsable |
|----|------|--------|-------|-------------|
| [TASK-001](../tasks/TASK-001.md) | Crear organización en GitHub | 🔴 To Do | 0.5h | DevOps Lead |
| [TASK-002](../tasks/TASK-002.md) | Configurar logo y descripción | 🔴 To Do | 0.5h | DevOps Lead |
| [TASK-003](../tasks/TASK-003.md) | Configurar email de notificaciones | 🔴 To Do | 0.25h | DevOps Lead |
| [TASK-004](../tasks/TASK-004.md) | Invitar 3 usuarios iniciales | 🔴 To Do | 0.75h | DevOps Lead |

**Total**: 4 Tasks | 2 horas estimadas

---

## 🎯 Definición de Ready

- [ ] Cuenta GitHub Enterprise o Business disponible
- [ ] Lista de 3 usuarios iniciales con emails confirmados
- [ ] Logo de la empresa disponible en formato PNG/SVG
- [ ] Descripción oficial de la organización aprobada

---

## ✅ Definición de Done

- [ ] Organización creada en github.com/Farutech
- [ ] Logo y descripción configurados correctamente
- [ ] Email de notificaciones verificado
- [ ] 3 usuarios invitados y han aceptado
- [ ] Documentación actualizada con URL de la org
- [ ] Screenshot de confirmación archivado

---

## 🛠️ Notas de Implementación

### Comandos Útiles (GitHub CLI)
```bash
# Si usas gh cli para automatizar
gh org create Farutech --confirm
gh org edit Farutech --bio "Plataforma SaaS para aplicaciones empresariales"
gh org edit Farutech --email admin@farutech.com
```

### URLs Importantes
- Crear org: https://github.com/organizations/new
- Settings: https://github.com/organizations/Farutech/settings
- Members: https://github.com/orgs/Farutech/people

---

## 🚨 Bloqueos Conocidos

Ninguno actualmente.

---

## 📝 Comentarios y Discusiones

*Usar esta sección para discutir detalles específicos de implementación.*

---

*Esta historia es parte del backlog oficial. Ver [FEATURE-001](../features/FEATURE-001.md) para contexto completo.*
