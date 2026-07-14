# BuenasPracticas Purge Decision

> **Decisión**: Purgar `BuenasPracticas` como ruido personal (Opción 1)  
> **Razón**:  
> - Contiene **0 archivos de estándares técnicos** (solo 563 archivos personales: 554 imágenes, 7 PDFs irrelevantes, 1 zip de prompts, 1 xlsx de datos externos).  
> - Contradice la intención de A.12 — *no debe ser un repositorio de referencias personales*.  
> - Mantiene historial seguro mediante `git mv` dentro de `_archive/meta-churn/` (preservando rollback).  
> - Elimina distracción, alinea la carpeta con la gobernanza documental formal.  

## Acción Ejecutada
- **Moves**:  
  - `G:\Mi unidad\Projects\Farutech\BuenasPracticas` → `docs/_archive/meta-churn/BuenasPracticas`  
  - Commit: `9e7bfa1 Purge BuenasPracticas as personal noise (A.12)`  

> **Nota de Rollback**:  
> El directorio original está preservado en el historial de Git (`git show <commit>:BuenasPracticas`).  
> Para restaurar: `git checkout <commit> -- 'BuenasPracticas'` (requiere árbol de trabajo limpio).