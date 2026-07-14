# ADR-007: Estrategia de Repositorios (Polyrepo Organizado)

> **Propósito**: Documentar la decisión de utilizar una estrategia de polyrepo organizado en lugar de un monorepo para Farutech Cloud Platform  
> **Audiencia**: Arquitectos, líderes de tecnología, equipos de desarrollo  
> **Propietario**: Lead Architect  
> **Última Revisión**: 2026-07-02  
> **Estado**: Aprobado

## Resumen

La plataforma se compone de múltiples componentes que necesitan ser desarrollados y mantenidos de forma independiente por diferentes equipos. Se adopta una estrategia de polyrepo organizado, con repositorios separados por funcionalidad, en lugar de un monorepo único.

## Detalles

### Contexto
La plataforma se compone de múltiples componentes que necesitan ser desarrollados y mantenidos de forma independiente por diferentes equipos.

### Alternativas Evaluadas

#### Opción 1: Monorepo único
- **Ventajas**:
  - Visibilidad global del código
  - Refactorings atómicos entre componentes
- **Desventajas**:
  - Cuellos de botella en CI
  - Acoplamiento accidental entre equipos

#### Opción 2: Submódulos Git
- **Ventajas**:
  - Composición de repositorios existentes
- **Desventajas**:
  - Complejidad operativa y curva de aprendizaje
  - Historial fragmentado

#### Opción 3: Mono-repo con workspaces
- **Ventajas**:
  - Gestión de dependencias compartida
- **Desventajas**:
  - Escalado limitado del árbol de trabajo

### Decisión
Utilizaremos una estrategia de polyrepo organizado en lugar de un monorepo, con repositorios separados por funcionalidad.

### Consecuencias
- **Positivas**:
  - Equipos pueden trabajar de forma independiente
  - Pipelines de CI/CD más rápidos
  - Menor riesgo de bloqueo entre equipos
  - Control de acceso más granular

- **Negativas**:
  - Mayor complejidad en la coordinación
  - Posible duplicación de configuraciones

### Impacto
- Cada funcionalidad principal reside en su propio repositorio
- Los pipelines de CI/CD se ejecutan por repositorio
- La coordinación de versiones entre componentes requiere proceso explícito

## Referencias
- [Arquitectura de Monolito Modular](001-modular-monolith.md)

> **Próximos Pasos**:
> - Definir la convención de nombres de repositorios
> - Documentar el flujo de integración entre componentes

---
*Versión del documento: 1.0.0 | Creado: 2026-07-02 | Revisión: Según sea necesario*
