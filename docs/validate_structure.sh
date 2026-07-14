#!/bin/bash
#
# validate_structure.sh — Farutech Cloud Platform documentation structure gate
#
# Purpose: verify the SSOT documentation tree is well-formed before a PR merges.
# Exits 0 when clean, 1 when a real structural/duplicate/secret problem is found.
#
# Design notes (avoiding known false positives):
#   - ADR files use a 3-digit prefix (NNN-) by convention; both NN- and NNN- are valid.
#   - _archive/ is a frozen rollback safety net and is EXCLUDED from every check.
#   - "Sensitive content" only matches real credential patterns, not prose that
#     merely mentions password/token/key (e.g. "password policy", "access token").

set -u

DOCS_DIR="./docs"
LOG_FILE="$DOCS_DIR/validation_report_$(date +%Y%m%d_%H%M%S).log"

log() { echo "$(date '+%Y-%m-%d %H:%M:%S') - $*" >> "$LOG_FILE"; }

log "=== Inicio de validación ==="
echo "🔍 Farutech documentation structure validation"
echo "Fecha: $(date)"
echo ""

CRITICAL=0

# ---------------------------------------------------------------------------
# 1. Expected top-level directories
# ---------------------------------------------------------------------------
echo "📁 Verificando estructura de directorios..."
EXPECTED_DIRS=(
  "00-meta" "01-vision-and-fundamentals" "02-product-management"
  "03-architecture-and-standards" "04-development-lifecycle" "05-security"
  "06-developer-experience" "07-knowledge-and-innovation" "08-documentation"
  "09-ai-agents" "10-requirements" "11-templates"
)
for d in "${EXPECTED_DIRS[@]}"; do
  if [ -d "$DOCS_DIR/$d" ]; then
    echo "    ✓ $d"
  else
    echo "    ✗ $d - FALTANTE"
    log "ERROR: directorio faltante: $d"
    CRITICAL=$((CRITICAL + 1))
  fi
done
echo ""

# ---------------------------------------------------------------------------
# 2. File naming convention (active tree only, _archive excluded)
#    Valid: NN-kebab.md, NNN-kebab.md (ADRs), README.md
# ---------------------------------------------------------------------------
echo "📄 Verificando nomenclatura de archivos..."
BAD_NAMES=0
while IFS= read -r -d '' f; do
  base=$(basename "$f")
  if [[ "$base" == "README.md" ]]; then
    continue
  fi
  if [[ "$base" =~ ^[0-9]{2}-[a-z0-9-]+\.md$ ]] || [[ "$base" =~ ^[0-9]{3}-[a-z0-9-]+\.md$ ]]; then
    continue
  fi
  echo "    ✗ $f (nomenclatura no cumple NN- / NNN-kebab.md)"
  log "Archivo con nomenclatura incorrecta: $f"
  BAD_NAMES=$((BAD_NAMES + 1))
done < <(find "$DOCS_DIR" -name "*.md" -not -path "*/_archive/*" -print0)

if [ "$BAD_NAMES" -gt 0 ]; then
  CRITICAL=$((CRITICAL + 1))
fi
echo "    - Archivos fuera de convención: $BAD_NAMES"
echo ""

# ---------------------------------------------------------------------------
# 3. Duplicate detection (active tree only)
#    Flag any of the known legacy duplicate filenames if they reappear,
#    and any byte-identical basename collision across active dirs.
# ---------------------------------------------------------------------------
echo "🔍 Buscando duplicados fuera de estructura organizada..."
DUP=0
LEGACY_DUPES=(
  "AI_AGENTS_PROMPTS_GUIDE.md" "IA-Agents.md" "KNOWLEDGE_ARCHITECTURE.md"
  "TECHNICAL_GOVERNANCE_GUIDE.md" "TECHNICAL_SUSTAINABILITY_GUIDE.md"
  "TESTING_QUALITY_GUIDE.md" "MONITORING_OBSERVABILITY_GUIDE.md"
  "DATA_GOVERNANCE_GUIDE.md" "DEPENDENCIES_SECURITY_GUIDE.md"
  "DEPLOYMENT_OPERATIONS_GUIDE.md" "DEVELOPER_EXPERIENCE_GUIDE.md"
  "DEVELOPMENT_LIFECYCLE_GUIDE.md" "DOCUMENTATION_GUIDE.md"
  "DOCUMENTATION_KNOWLEDGE_GUIDE.md" "INCIDENT_MANAGEMENT_GUIDE.md"
  "INNOVATION_MANAGEMENT_GUIDE.md" "KNOWLEDGE_MANAGEMENT_GUIDE.md"
  "PACKAGES_LIBRARY_GUIDE.md" "SECURITY_ACCESS_GUIDE.md"
  "SOFTWARE_QUALITY_MANAGEMENT_GUIDE.md" "TECHNICAL_DEBT_MANAGEMENT_GUIDE.md"
  "VERSIONING_RELEASES_GUIDE.md" "PROMPT_MASTER_GUIDE.md"
)
for name in "${LEGACY_DUPES[@]}"; do
  if [ -f "$DOCS_DIR/$name" ]; then
    echo "    ✗ Duplicado legacy en raíz: $DOCS_DIR/$name"
    log "Duplicado legacy encontrado: $name"
    DUP=$((DUP + 1))
  fi
done
# Collision: same basename present in two different active locations
while IFS= read -r name; do
  count=$(find "$DOCS_DIR" -name "$name" -not -path "*/_archive/*" | wc -l)
  if [ "$count" -gt 1 ]; then
    echo "    ✗ Colisión de nombre: $name ($count ubicaciones)"
    log "Colisión de nombre: $name"
    DUP=$((DUP + 1))
  fi
done < <(find "$DOCS_DIR" -name "*.md" -not -path "*/_archive/*" -printf '%f\n' | sort -u)

if [ "$DUP" -gt 0 ]; then
  CRITICAL=$((CRITICAL + 1))
fi
echo "    - Duplicados identificados: $DUP"
echo ""

# ---------------------------------------------------------------------------
# 4. Sensitive content — ONLY real credential patterns (not prose)
# ---------------------------------------------------------------------------
echo "🔒 Verificando contenido sensible (patrones reales)..."
SENS=0
while IFS= read -r -d '' f; do
  if grep -Eqi \
      -e '\bpassword\b[[:space:]]*[:=]' \
      -e '\bsecret\b[[:space:]]*[:=]' \
      -e '\bapi[_-]?key\b[[:space:]]*[:=]' \
      -e '\btoken\b[[:space:]]*[:=]' \
      -e 'AKIA[0-9A-Z]{16}' \
      -e '-----BEGIN.*PRIVATE KEY-----' \
      -e 'Bearer[[:space:]]+[A-Za-z0-9._\-]+' \
      -e 'gh[pousr]_[A-Za-z0-9]{20,}' \
      "$f"; then
    echo "    ⚠️  Posible secreto en: $f"
    log "Posible contenido sensible: $f"
    SENS=$((SENS + 1))
  fi
done < <(find "$DOCS_DIR" -name "*.md" -not -path "*/_archive/*" -print0)

if [ "$SENS" -gt 0 ]; then
  CRITICAL=$((CRITICAL + 1))
fi
echo "    - Alertas de contenido sensible: $SENS"
echo ""

# ---------------------------------------------------------------------------
# 5. YAML front-matter (informational only — not critical)
# ---------------------------------------------------------------------------
echo "📋 Verificando metadatos YAML (informativo)..."
WITH=0; WITHOUT=0
while IFS= read -r -d '' f; do
  base=$(basename "$f")
  if [[ "$base" == "README.md" ]]; then continue; fi
  if head -n 5 "$f" 2>/dev/null | grep -q '^---$'; then
    WITH=$((WITH + 1))
  else
    WITHOUT=$((WITHOUT + 1))
    log "Archivo sin metadatos YAML: $f"
  fi
done < <(find "$DOCS_DIR" -name "*.md" -not -path "*/_archive/*" -print0)
echo "    - Con metadatos: $WITH | Sin metadatos: $WITHOUT"
echo ""

# ---------------------------------------------------------------------------
# Summary
# ---------------------------------------------------------------------------
echo "📊 Resumen de validación:"
echo "    - Directorios esperados: ${#EXPECTED_DIRS[@]}/12"
echo "    - Errores críticos: $CRITICAL"
log "=== Fin de validación (críticos=$CRITICAL) ==="
echo ""
echo "📝 Reporte: $LOG_FILE"

if [ "$CRITICAL" -gt 0 ]; then
  echo "❌ Validación falló con $CRITICAL error(es) crítico(s)."
  exit 1
else
  echo "✅ Validación completada sin errores críticos."
  exit 0
fi
