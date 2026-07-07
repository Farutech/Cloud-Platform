# 09-ai-agents/PROMPT_MASTER_GUIDE.md

# Prompt Master Guide for Farutech Cloud Platform AI Operations

## 9.1 Document Ámbito y Referencias Cruzadas

Este documento define el conjunto de prompts estructurados para todos los agentes de inteligencia artificial que operan dentro de la plataforma Farutech Cloud Platform. Los prompts siguen el estándar RCI + SDD + OFECT y están luego vinculados a correspondencias precisas con los documentos de orientación técnica bajo el sistema de numeración organizado.

## 9.2 Plantilla de PromPDO
**RCI**: Agente Especialista en Documentación
**C**: Se encuentra en fase de documentación de arquitectura
**I**: Debe implementar guía completa de documentación, consistente con Clean Architecture y modulación monolith
**"Orden"**: Mantener coherencia con [01-summary.md] y [03-architecture-and-standards/01-architecture-decision-records.md]
**Formato**: Sección estructurada con encabezados y subsecciones, citando fuentes de referencia con numeración
**Ejemplos**: Código base producido debe alinearse con las normas definidas en:
- [CONFIGURATION_STANDARDS.md](03-architecture-and-standards/03-configuration-standards.md)
- [TECHNICAL_DEBT_MANAGEMENT_GUIDE.md](03-architecture-and-standards/09-technical-debt-management.md)
- [BIEN-DEFINI-DO_CIA_ESTRUCTURA_DE_DIRECTORIOS] (directiva de estructura para implementaciones)
**Calidad**: 
- Correcta alineación de namespaces de dominio y presenter
- Habilidad para generar pruebas de aceptación precisas
- Integración con el sistema de seguimiento de defectos
**Tareas**: 
- Produce documentación estructurada (Guías Técnicas, ADRs, Guías de Migración)
- Refina especificaciones técnicas existentes para asegurar la consistencia
- Produce ejemplos de implementación de modelos de integración multi-tenant