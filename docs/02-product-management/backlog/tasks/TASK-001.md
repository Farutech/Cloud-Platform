# TASK-001: Crear organización en GitHub

> **Story Padre**: [STORY-001](../stories/STORY-001.md)  
> **Feature Abuela**: [FEATURE-001](../features/FEATURE-001.md)  
> **Épica Bisabuela**: [EPIC-001](../epics/EPIC-001.md)  
> **Estado**: 🔴 To Do  
> **Tecnología**: GitHub Web / GitHub CLI  
> **Estimación**: 0.5 horas  
> **Responsable**: DevOps Lead  
> **Prioridad**: Must Have  
> **Versión**: 1.0

---

## 📋 Descripción

Crear la organización "Farutech" en GitHub con configuración inicial básica para alojar todos los repositorios del ecosistema.

---

## ✅ Checklist de Implementación

- [ ] Acceder a github.com/organizations/new
- [ ] Seleccionar tipo de cuenta: "Organization"
- [ ] Nombre: "Farutech"
- [ ] Email de contacto: admin@farutech.com
- [ ] Visibilidad: Privada (recomendado inicialmente)
- [ ] Plan: Free (inicial, upgradable después)
- [ ] Completar formulario de creación
- [ ] Verificar email de confirmación
- [ ] Configurar logo de organización (opcional pero recomendado)
- [ ] Anotar URL de la org en documentación
- [ ] Tomar screenshot de confirmación para archivo

---

## 🎯 Criterios de Validación

- [ ] Organización visible en github.com/Farutech
- [ ] Admin puede acceder sin errores
- [ ] Configuración de privacidad aplicada correctamente
- [ ] Email de confirmación recibido y verificado
- [ ] Logo cargado exitosamente (si aplica)
- [ ] URL documentada en README de plataforma

---

## 🛠️ Comandos Útiles

### Opción A: GitHub Web (Recomendado para primera vez)
```
1. Ir a: https://github.com/organizations/new
2. Llenar formulario con datos arriba mencionados
3. Click en "Create organization"
4. Verificar email
```

### Opción B: GitHub CLI (Para automatización futura)
```bash
# Instalar gh cli si no está instalado
# macOS: brew install gh
# Ubuntu: sudo apt install gh

# Autenticar
gh auth login

# Crear organización
gh org create Farutech --confirm

# Verificar creación
gh org view Farutech
```

---

## 📚 Referencias

- [Documentación oficial: Crear organización](https://docs.github.com/en/organizations/collaborating-with-groups-in-organizations/creating-a-new-organization-from-scratch)
- [Tipos de cuentas GitHub](https://docs.github.com/en/get-started/learning-about-github/types-of-github-accounts)
- [Planes de GitHub](https://github.com/pricing)

---

## ⚠️ Consideraciones Importantes

1. **Nombre**: Elegir cuidadosamente - no se puede cambiar después fácilmente
2. **Visibilidad**: Privada es más segura para código propietario
3. **Plan**: Free es suficiente para comenzar, se puede upgrade después
4. **Email**: Usar email corporativo que no expire si alguien deja la empresa

---

## 🚨 Posibles Problemas y Soluciones

| Problema | Causa Probable | Solución |
|----------|----------------|----------|
| "Organization name already taken" | Nombre ya existe | Probar "FarutechHQ", "FarutechOfficial", o contactar soporte |
| No llega email de verificación | Spam folder / email incorrecto | Revisar spam, verificar email, reenviar desde settings |
| Error de permisos | Cuenta personal sin verificar | Verificar email de cuenta personal primero |

---

## 📝 Evidencia Requerida

Al completar esta task, archivar:
1. Screenshot de la página principal de la org
2. Screenshot de settings > profile con logo cargado
3. Email de confirmación guardado en carpeta del equipo
4. URL anotada en `docs/02-product-management/backlog/README.md`

---

## ✅ Definición de Done

Esta task está completa cuando:
- ✅ Organización creada y accesible
- ✅ Email verificado
- ✅ Logo configurado (opcional)
- ✅ URL documentada
- ✅ Screenshot archivado
- ✅ Estado actualizado a "🟢 Done" en este archivo

---

*Esta task es parte del backlog oficial. Ver [STORY-001](../stories/STORY-001.md) para contexto completo.*
