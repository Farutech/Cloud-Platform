# Farutech Cloud Platform
## Guía de Organización de Equipos y Repositorios

---

## Estructura de Repositorios

La arquitectura de múltiples repositorios (polyrepo) permite la autonomía de los equipos y evita cuellos de botella en el desarrollo.

### Repositorios Principales

| Repositorio | Descripción | Equipo Responsable |
|-------------|-------------|-------------------|
| `cloud-platform` | Plataforma administrativa central | Platform Team |
| `website` | Sitio web público (farutech.com) | Marketing Team |
| `demos` | Demostraciones gratuitas sin persistencia | Product Team |
| `app-pos` | Sistema de punto de venta | POS Team |
| `app-erp` | Sistema ERP empresarial | ERP Team |
| `app-hotels` | Gestión hotelera | Hotels Team |
| `app-restaurants` | Gestión de restaurantes | Restaurants Team |
| `packages-frontend` | Paquetes frontend reutilizables | Platform Team |
| `packages-dotnet` | Paquetes backend .NET reutilizables | Platform Team |
| `packages-shared-contracts` | Contratos compartidos entre servicios | Platform Team |
| `service-identity` | Servicio de identidad y autenticación | Platform Team |
| `service-billing` | Servicio de facturación y suscripciones | Platform Team |
| `worker-platform` | Plataforma de workers en Go | Platform Team |
| `documentation` | Documentación técnica y de producto | Documentation Team |

---

## Modelos de Equipo

### Platform Team
- **Responsabilidad:** Core, seguridad, infraestructura, estándares y servicios compartidos
- **Composición:** Arquitectos, DevOps, Seguridad, QA especializada
- **Métricas:** Tiempo de respuesta, estabilidad, cobertura de pruebas, calidad del código

### Product Teams
- **Responsabilidad:** Producto, código y evolución de aplicaciones específicas
- **Composición:** Product Manager, Ingenieros Frontend/Backend, QA, UX/UI
- **Métricas:** Velocidad de entrega, satisfacción del cliente, calidad del producto

### Enablement Teams
- **Responsabilidad:** Soporte técnico, automatización, herramientas y procesos
- **Composición:** QA especializado, DevOps, Automatización, Documentación
- **Métricas:** Tiempo de resolución, cobertura de automatización, calidad de documentación

---

## Principios de Autonomía

Cada equipo debe poder:

1. **Desarrollar** su código sin depender de otros equipos
2. **Probar** sus cambios con pipelines independientes
3. **Publicar** sus paquetes en GitHub Packages
4. **Desplegar** sus aplicaciones en entornos propios
5. **Monitorear** su rendimiento y errores

Esto se logra mediante:
- APIs bien definidas y versionadas
- Contratos compartidos
- Estándares técnicos comunes
- Herramientas de integración continua

---

## Flujo de Trabajo

### Para Nuevas Funcionalidades

1. Product Team define requerimientos
2. Platform Team proporciona componentes reutilizables
3. Product Team implementa funcionalidad específica
4. QA valida contra estándares
5. CI/CD despliega automáticamente
6. Monitoreo detecta problemas
7. Feedback mejora el ciclo

### Para Actualizaciones de Componentes Compartidos

1. Platform Team actualiza componente
2. CI/CD verifica compatibilidad con todos los consumidores
3. Notificación automática a Product Teams afectados
4. Product Teams actualizan dependencias según necesidad

---

## Comunicación entre Equipos

### Canales Oficiales
- **Slack:** #platform-team, #pos-team, #erp-team, etc.
- **GitHub Issues:** Para seguimiento técnico
- **Confluence:** Documentación de decisiones y procesos
- **Retrospectivas semanales:** Entre equipos relacionados

### Principios
- Comunicación asincrónica preferida
- Documentación como fuente de verdad
- Decisiones técnicas registradas en ADRs
- Reuniones solo cuando es estrictamente necesario

---

## Evolución del Modelo

El modelo de equipos evolucionará según las necesidades:

- **Fase 1 (Inicio):** Platform Team + Product Teams principales
- **Fase 2 (Crecimiento):** Specialized Enablement Teams
- **Fase 3 (Madurez):** Cross-functional Squads con responsabilidad completa

Esta evolución será guiada por métricas de rendimiento y feedback continuo.