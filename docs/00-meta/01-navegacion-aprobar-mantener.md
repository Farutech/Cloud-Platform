# NAVIGATION-GUIDE

# Guía de Navegación, Aprobación y Mantenimiento de la Documentación

## 1. Alcance y Visión
Esta guía describe el proceso completo para:
- Encontrar documentos en la estructura organizada
- Proponer cambios y hacer aprobaciones
- Editar documentos sin perder historial o romper convenciones
- Mantener consistencia con Clean Architecture single-project

## 2. Estructura de Navegación

### 2.1 Estructura de Directorios
```
docs/
├── 00-meta/                     ← Metadatos y diagnóstico
├── 01-vision-and-fundamentals/  ← Visión y fundamentos del proyecto
├── 02-product-management/       ← Gestión de producto y roadmap
├── 03-architecture-and-standards/← Estándares técnicas y decisiones arquitectónicas
├── 04-development-lifecycle/    ← Ciclo de vida de desarrollo
├── 05-security/                 ← Seguridad y gestión de acceso
├── 06-developer-experience/     ← Experiencia del desarrollador
├── 07-knowledge-and-innovation/ ← Conocimiento e innovación
├── 08-documentation/            ← Documentación de referencia
├── 09-ai-agents/                ← Guías de agentes de IA
├── 10-requirements/             ← Requisitos detallados
├── 11-templates/                ← Plantillas estandarizadas
└── 01-reference/                ← Referencias visuales (no modificadas)
```

### 2.2 Convención de Nombres
- Uso de kebab-case para todos los nombres de archivo y carpetas
- Prefijos numéricos para orden lógico (01-, 02-, etc.)
- Evitar mayúsculas, espacios y caracteres especiales
- Números en minúsculas seguidos de guión cuando se aplica la convención numérica

### 2.3 Búsqueda y Localización
- **Índice Maestro:** `docs/10-requirements/00-requirements-summary.md` 
- **Referencias Cruzadas:** Todos los documentos incluyen enlaces a ADRs y guías relacionadas
- **Búsqueda Facilitada:** Todos los documentos deben incluir metadatos en su cabecera que permitan búsqueda rápida por término técnico

## 3. Proceso de Modificación Documentación

### 3.1 Aprobación de Cambios
1. **Propuesta Inicial:** Crear rama y modificar documento en `/docs/` con formato correcto
2. **Revisión Técnica:** Revisión por parte del Architektur Board (o representante designado)
3. **Revisión de Estándares:** Verificación de cumplimiento con Clean Architecture y ADR
4. **Aprobación Formal:** Aprobación por al menos 2 líderes técnicos (Lead Architect, Engineering Manager)
5. **Documentación de Cambios:** Actualización del historial de cambios en cabecera
6. **Archivo en Historial:** Mantener documento original bajo versión previa en `/docs/.migration-backup/`

### 3.2 Creación de Documentación Nueva
1. Seleccionar el directorio apropiado según categoría numérica
2. Copiar el template correspondiente de `/docs/11-templates/`
3. Renombrar siguiendo la convención establecida
4. Completar metadatos en la cabecera
5. Implementarestructura de carpetas técnica si aplica
6. Subir y crear PR con documentación previa revisada

### 3.3 Licencias y Notas
- Todos los documentos deben mantener la licencia establecida por el proyecto
- Eliminar notas y comentarios no formales antes de aprobación

## 4. Conservación y Historial

### 4.1 Sistema de Versiones
- Cada documento debe tener cabecera con: `Update: [Fecha]` y `Author: [Nombre]`
- Historial de cambios deberá registrar: `Reason`, `Version`, `Author`, `Date`
- Migraciones importantes deben archivarse en `.migration-backup/` con explicación técnica

## 5. Sincronización con Clean Architecture principles (SINGLE PROJECT)

| Principio de Clean Architecture | Cumplimiento Requerido en Documentos |
|--------------------------------|-------------------------------------|
| **Modular Monolith** | Referir siempre a la estructura de carpetas desde features hasta persistence |
| **Vertical Slice** | Agrupar todo lo necesario para una función en su carpeta correspondiente |
| **Namespaces como Límites** | Verificar en ADRs que los namespaces propuestos coinciden con la estructura real |
| **Dependency Direction** | Verificar que las referencias entre capas siguen la dirección correcta en diagrama de componentes |
| **Enforcement de Reglas** | Verificar que los ADRs prohíben violar reglas clave (ej: dominio no accede a infraestructura) |
| **Enforcement Técnico** | Revisar que los ADRs mencionan herramientas como NsDepCop para validar reglas |

## 6. Gestión de Duplicados y Redundancia
- **Detectar Duplicados:** Revisar mensualmente directorios relacionados para evitar redundancia
- **Unificación:** Cuando se detecte redundancia, crear ADR que proponga unificación formal
- **Eliminación:** Solo se eliminarán documentos mediante estuviera `.migration-backup/` con justificación técnica

## 7. Integración con Sistemas Existentes
| Sistema Existente | Integración | Comentario |
|-------------------|-------------|------------|
| `/docs/requirements/` | Requiere migración a `/docs/10-requirements/` | Ya iniciado (ver ADR-00X) |
| `/docs/.migration-backup/` | Archivar documentos eliminados | Mantener visible para historiadores técnicos |
| `/docs/Engineering Development Standards...md` | Reemplazar con `/docs/03-architecture-and-standards/02-engineering-standards.md` | Completado |
| `/docs/INCIDENT_MANAGEMENT_GUIDE.md` | Reemplazar con `/docs/04-development-lifecycle/05-incident-management.md` | Completado |

## 8. Checklist de Buenas Prácticas para Editar
- [ ] Documento siguiendo plantilla correcta de la sección correspondiente
- [ ] Nombre siguiendo convención numérica y kebab-case
- [ ] Metadatos actualizados en cabecera
- [ ] Estructura de carpetas técnica creada/modificada correctamente
- [ ] Referencias a otros documentos actualizadas (abajo o arriba según corresponda)
- [ ] ADR creado para cambios arquitectónicos significativos
- [ ] Revisión técnica completada y documentada
- [ ] Aprobación formal registrada en PR comments
- [ ] Historial de cambios actualizado con razón de modificación
- [ ] Commit mensaje refleja claramente el propósito de la modificación