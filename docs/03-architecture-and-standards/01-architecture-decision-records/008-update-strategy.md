# ADR-008: Estrategia de Actualización (Actualizaciones Automáticas Gestionadas)

> **Propósito**: Documentar la decisión de implementar actualizaciones automáticas gestionadas por Farutech para Farutech Cloud Platform  
> **Audiencia**: Arquitectos, ingenieros de plataforma, soporte al cliente  
> **Propietario**: Lead Architect  
> **Última Revisión**: 2026-07-02  
> **Estado**: Aprobado

## Resumen

La plataforma debe evolucionar constantemente, pero las aplicaciones deben mantenerse actualizadas sin intervención manual de los clientes. Se implementan actualizaciones automáticas gestionadas por Farutech, con notificación a los clientes sobre cambios importantes.

## Detalles

### Contexto
La plataforma debe evolucionar constantemente, pero las aplicaciones deben mantenerse actualizadas sin intervención manual de los clientes.

### Alternativas Evaluadas

#### Opción 1: Actualizaciones manuales por cliente
- **Ventajas**:
  - Control total del cliente
- **Desventajas**:
  - Fragmentación de versiones
  - Mayor carga de soporte

#### Opción 2: Canales de actualización (stable, beta)
- **Ventajas**:
  - Elección de ritmo de adopción
- **Desventajas**:
  - Complejidad de mantenimiento de múltiples ramas

#### Opción 3: Actualizaciones programadas con consentimiento
- **Ventajas**:
  - Previsibilidad para el cliente
- **Desventajas**:
  - Fricción operativa

### Decisión
Implementaremos actualizaciones automáticas gestionadas por Farutech, con notificación a los clientes sobre cambios importantes.

### Consecuencias
- **Positivas**:
  - Todos los clientes usan la versión más segura y actualizada
  - Menor carga de soporte
  - Implementación más rápida de correcciones

- **Negativas**:
  - Menos control por parte del cliente
  - Riesgo de interrupciones si hay errores en actualizaciones

### Impacto
- Farutech controla el ciclo de actualizaciones de la plataforma
- Se notifica a los clientes sobre cambios relevantes
- Se requiere una estrategia robusta de rollback ante fallos

## Referencias
- [Arquitectura de Monolito Modular](001-modular-monolith.md)

> **Próximos Pasos**:
> - Definir la política de notificación al cliente
> - Establecer el mecanismo de rollback automático

---
*Versión del documento: 1.0.0 | Creado: 2026-07-02 | Revisión: Según sea necesario*
