#!/bin/bash

# Script de validación para la estructura de documentación de Farutech Cloud Platform
# Este script verifica la nomenclatura, metadatos y contenido sensible en los archivos

echo "🔍 Iniciando validación de estructura de documentación..."
echo "Fecha: $(date)"
echo ""

# Variables
DOCS_DIR="./docs"
LOG_FILE="$DOCS_DIR/validation_report_$(date +%Y%m%d_%H%M%S).log"

# Función para escribir en el log
write_log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> $LOG_FILE
}

write_log "=== Inicio de validación ==="

echo "📁 Verificando estructura de directorios..."
write_log "Verificando estructura de directorios"

# Verificar que los directorios principales existen con la nomenclatura correcta
DIRECTORIOS_ESPERADOS=(
    "00-meta"
    "01-vision-and-fundamentals" 
    "02-product-management"
    "03-architecture-and-standards"
    "04-development-lifecycle"
    "05-security"
    "06-developer-experience"
    "07-knowledge-and-innovation"
    "08-documentation"
    "09-ai-agents"
    "10-requirements"
    "11-templates"
)

echo "  - Directorios esperados: ${#DIRECTORIOS_ESPERADOS[@]}"
for dir in "${DIRECTORIOS_ESPERADOS[@]}"; do
    if [ -d "$DOCS_DIR/$dir" ]; then
        echo "    ✓ $dir"
        write_log "Directorio encontrado: $dir"
    else
        echo "    ✗ $dir - ¡FALTANTE!"
        write_log "ERROR: Directorio faltante: $dir"
    fi
done

echo ""
echo "📄 Verificando nomenclatura de archivos..."

# Contar archivos con nomenclatura correcta (prefijo numérico + kebab-case)
ARCHIVOS_CORRECTOS=0
ARCHIVOS_INCORRECTOS=0
TOTAL_ARCHIVOS=0

while IFS= read -r -d '' file; do
    ((TOTAL_ARCHIVOS++))
    
    # Extraer nombre de archivo
    filename=$(basename "$file")
    
    # Verificar si el nombre cumple con el patrón: NN-nombre-en-minusculas-o-descripcion.md
    if [[ $filename =~ ^[0-9]{2}-[a-z0-9-]+\.md$ ]]; then
        ((ARCHIVOS_CORRECTOS++))
    else
        # Permitir README.md como archivo especial
        if [[ "$filename" != "README.md" && "$filename" != "PHASE_1_DETAILED_AUDIT.md" ]]; then
            ((ARCHIVOS_INCORRECTOS++))
            echo "    ✗ $file"
            write_log "Archivo con nomenclatura incorrecta: $file"
        else
            ((ARCHIVOS_CORRECTOS++))
        fi
    fi
done < <(find "$DOCS_DIR" -name "*.md" -not -path "*/requirements/*" -not -path "./docs/requirements/*" -not -path "*/.migration-backup/*" -print0)

echo "  - Total archivos verificados: $TOTAL_ARCHIVOS"
echo "  - Correctamente nombrados: $ARCHIVOS_CORRECTOS"
echo "  - Incorrectamente nombrados: $ARCHIVOS_INCORRECTOS"
write_log "Total archivos verificados: $TOTAL_ARCHIVOS, Correctos: $ARCHIVOS_CORRECTOS, Incorrectos: $ARCHIVOS_INCORRECTOS"

echo ""
echo "🔍 Buscando archivos duplicados fuera de estructura organizada..."

# Buscar archivos que podrían ser duplicados de la estructura organizada
DUPLICADOS_ENCONTRADOS=0

# Directorio requirements (completamente duplicado)
if [ -d "$DOCS_DIR/requirements" ]; then
    COUNT=$(find "$DOCS_DIR/requirements" -name "*.md" | wc -l)
    echo "  ✗ Directorio duplicado: $DOCS_DIR/requirements ($COUNT archivos)"
    write_log "Directorio duplicado encontrado: $DOCS_DIR/requirements"
    ((DUPLICADOS_ENCONTRADOS += COUNT))
fi

# Archivos individuales que podrían ser duplicados
ARCHIVOS_POTENCIALMENTE_DUPLICADOS=(
    "AI_AGENTS_PROMPTS_GUIDE.md"
    "DATA_GOVERNANCE_GUIDE.md"
    "DEPENDENCIES_SECURITY_GUIDE.md"
    "DEPLOYMENT_OPERATIONS_GUIDE.md"
    "DEVELOPER_EXPERIENCE_GUIDE.md"
    "DEVELOPMENT_LIFECYCLE_GUIDE.md"
    "DeveloperExperienceGuide.md"
    "DevelopmentLifecycleGuide.md"
    "DOCUMENTATION_GUIDE.md"
    "DOCUMENTATION_KNOWLEDGE_GUIDE.md"
    "DocumentationGuide.md"
    "DocumentationKnowledgeGuide.md"
    "IA-Agents.md"
    "INCIDENT_MANAGEMENT_GUIDE.md"
    "IncidentManagementGuide.md"
    "INNOVATION_MANAGEMENT_GUIDE.md"
    "InnovationManagementGuide.md"
    "KNOWLEDGE_ARCHITECTURE.md"
    "KNOWLEDGE_MANAGEMENT_GUIDE.md"
    "KnowledgeManagementGuide.md"
    "MONITORING_OBSERVABILITY_GUIDE.md"
    "MonitoringObservabilityGuide.md"
    "PACKAGES_LIBRARY_GUIDE.md"
    "PackagesLibraryGuide.md"
    "SECURITY_ACCESS_GUIDE.md"
    "SecurityAccessGuide.md"
    "SOFTWARE_QUALITY_MANAGEMENT_GUIDE.md"
    "SoftwareQualityManagementGuide.md"
    "TaskManagementGuide.md"
    "TeamOrganizationGuide.md"
    "TECHNICAL_DEBT_MANAGEMENT_GUIDE.md"
    "TECHNICAL_GOVERNANCE_GUIDE.md"
    "TECHNICAL_SUSTAINABILITY_GUIDE.md"
    "TechnicalDebtManagementGuide.md"
    "TechnicalGovernanceGuide.md"
    "TechnicalSustainabilityGuide.md"
    "TESTING_QUALITY_GUIDE.md"
    "TestingQualityGuide.md"
    "VERSIONING_RELEASES_GUIDE.md"
    "VersioningReleasesGuide.md"
    "PROMPT_MASTER_GUIDE.md"
)

for archivo in "${ARCHIVOS_POTENCIALMENTE_DUPLICADOS[@]}"; do
    if [ -f "$DOCS_DIR/$archivo" ]; then
        echo "  ✗ Archivo potencialmente duplicado: $DOCS_DIR/$archivo"
        write_log "Archivo potencialmente duplicado: $DOCS_DIR/$archivo"
        ((DUPLICADOS_ENCONTRADOS++))
    fi
done

echo "  - Posibles duplicados identificados: $DUPLICADOS_ENCONTRADOS"
write_log "Posibles duplicados identificados: $DUPLICADOS_ENCONTRADOS"

echo ""
echo "🔒 Verificando contenido sensible..."

# Buscar posibles credenciales, claves u otra información sensible
CONTENIDO_SENSIBLE_ENCONTRADO=0

# Patrones comunes de información sensible
SENSITIVE_PATTERNS=(
    "password"
    "secret"
    "token"
    "key[^a-zA-Z]"  # Para evitar falsos positivos con palabras como "keyboard"
    "credential"
    "private"
    "api[_-]*key"
    "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"  # Direcciones IP
    "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}"  # Correos electrónicos
)

for pattern in "${SENSITIVE_PATTERNS[@]}"; do
    # Buscar sin distinguir mayúsculas/minúsculas, excluyendo este archivo de validación
    RESULT=$(find "$DOCS_DIR" -name "*.md" -not -path "*validate*" -exec grep -l -i -n "$pattern" {} \; 2>/dev/null)
    if [ ! -z "$RESULT" ]; then
        while IFS= read -r file; do
            if [ -n "$file" ]; then
                echo "  ⚠️  Posible contenido sensible en: $file (patrón: $pattern)"
                write_log "Posible contenido sensible en: $file (patrón: $pattern)"
                ((CONTENIDO_SENSIBLE_ENCONTRADO++))
            fi
        done <<< "$RESULT"
    fi
done

echo "  - Alertas de contenido sensible: $CONTENIDO_SENSIBLE_ENCONTRADO"
write_log "Alertas de contenido sensible: $CONTENIDO_SENSIBLE_ENCONTRADO"

echo ""
echo "📋 Verificando metadatos YAML..."

# Contar archivos que tienen encabezado YAML con metadatos
ARCHIVOS_CON_METADATOS=0
ARCHIVOS_SIN_METADATOS=0

while IFS= read -r -d '' file; do
    # Saltar este archivo de validación y archivos especiales
    if [[ "$file" != *validate* ]] && [[ "$file" != *README.md ]] && [[ "$file" != *PHASE_1_DETAILED_AUDIT.md ]]; then
        # Verificar si el archivo comienza con un encabezado YAML
        if head -n 10 "$file" 2>/dev/null | grep -q "^---$"; then
            ((ARCHIVOS_CON_METADATOS++))
        else
            ((ARCHIVOS_SIN_METADATOS++))
            write_log "Archivo sin metadatos YAML: $file"
        fi
    fi
done < <(find "$DOCS_DIR" -name "*.md" -not -path "*/requirements/*" -not -path "./docs/requirements/*" -not -path "*/.migration-backup/*" -print0)

echo "  - Archivos con metadatos YAML: $ARCHIVOS_CON_METADATOS"
echo "  - Archivos sin metadatos YAML: $ARCHIVOS_SIN_METADATOS"
write_log "Archivos con metadatos: $ARCHIVOS_CON_METADATOS, Sin metadatos: $ARCHIVOS_SIN_METADATOS"

echo ""
echo "📊 Resumen de validación:"
echo "  - Directorios correctos: $(echo "${DIRECTORIOS_ESPERADOS[@]}" | wc -w)/$(echo "${DIRECTORIOS_ESPERADOS[@]}" | wc -w)"
echo "  - Archivos correctamente nombrados: $ARCHIVOS_CORRECTOS/$TOTAL_ARCHIVOS"
echo "  - Duplicados identificados: $DUPLICADOS_ENCONTRADOS"
echo "  - Alertas de contenido sensible: $CONTENIDO_SENSIBLE_ENCONTRADO"
echo "  - Archivos con metadatos: $ARCHIVOS_CON_METADATOS/$(($TOTAL_ARCHIVOS - $ARCHIVOS_SIN_METADATOS))"
echo "  - Archivos sin metadatos: $ARCHIVOS_SIN_METADATOS"

write_log "=== Fin de validación ==="
echo ""
echo "📝 Reporte guardado en: $LOG_FILE"

# Determinar si hay errores críticos
ERRORES_CRITICOS=0
if [ $DUPLICADOS_ENCONTRADOS -gt 0 ]; then
    ERRORES_CRITICOS=$((ERRORES_CRITICOS + 1))
fi

if [ $CONTENIDO_SENSIBLE_ENCONTRADO -gt 0 ]; then
    ERRORES_CRITICOS=$((ERRORES_CRITICOS + 1))
fi

if [ $ERRORES_CRITICOS -gt 0 ]; then
    echo ""
    echo "❌ Se encontraron $ERRORES_CRITICOS errores críticos que requieren atención"
    echo "   Por favor revise el reporte para detalles."
    exit 1
else
    echo ""
    echo "✅ Validación completada sin errores críticos"
    echo "   La estructura de documentación está en buen estado."
    exit 0
fi