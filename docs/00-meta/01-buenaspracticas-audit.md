# Auditoría de `BuenasPracticas` (decisión A.12)

> **Estado**: Hallazgo de auditoría · **Owner**: CPO / Principal PM · **Fecha**: 2026-07-09
> **Decisión vinculante**: A.12 — *"BuenasPracticas se auditará y convertirá en un repositorio de estándares técnicos gobernado, indexado y de cumplimiento obligatorio. No será una carpeta de referencias personales."*

## Hallazgo

La carpeta auditada (original en Google Drive: `BuenasPracticas`; preservada en `docs/_archive/meta-churn/BuenasPracticas`) **NO contiene hoy ningún estándar técnico gobernado**. Es un depositario personal de capturas y referencias. Conteo exacto (563 archivos):

| Tipo | Cantidad | Contenido |
|---|---|---|
| Imágenes | 554 | 479 `.jpg`, 67 `.gif`, 6 `.webp`, 2 `.png` — capturas de pantalla sueltas |
| PDF | 7 | `Keycloak.pdf`, `CQRS Kommand in ASP.pdf`, `Efficient Similarity Search using Vector Indexes.pdf` (relevantes); `Workout logger.pdf`, `Cómo construir un portfolio de QA.pdf`, `ASP.pdf`, `1775660576526.pdf` (sin relación clara con la plataforma) |
| ZIP | 1 | `kit-prompts-profesional (1).zip` |
| XLSX | 1 | `Directorio-Colegios-Distritales-y-Direcciones-Locales-16012024.xlsx` (datos personales/externos) |

**Cero** archivos `.md` / estándares markdown. No hay índice, no hay metadatos de propiedad, no hay trazabilidad a ADRs ni a la SSOT.

## Conclusión

El estado actual **contradice la intención de A.12**. No es un "repositorio de estándares técnicos gobernado" sino un archivo de referencias personales — exactamente lo que A.12 declara que no debe ser.

## Opciones de tratamiento (pendiente de decisión de Product Management)

1. **Purgar/archivar como ruido personal** — mover todo el directorio a un archivo externo fuera del repo de estándares; no forma parte de la SSOT.
2. **Reconstruir como repo gobernado** — conservar únicamente los ~3 PDFs relevantes como *referencias semilla* (no como estándar en sí), crear índice, metadatos de ownership y estándares markdown reales vinculados a ADRs; descartar el resto.

No se inventa ningún estándar en este paso. Se requiere decisión del PM antes de actuar (la opción 2 implica crear contenido nuevo que hoy no existe).

## Trazabilidad

- Decisión origen: `docs/00-meta/00-governance-decisions-2026-07.md` (A.12).
- SSOT de estándares vigentes: `docs/03-architecture-and-standards/` (02-engineering-standards, 03-coding-standards, etc.).
