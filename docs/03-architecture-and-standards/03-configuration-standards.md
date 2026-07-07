# Farutech Cloud Platform
## Configuración de Estándares y Convenciones

---

## Convenciones de Nomenclatura

### Repositorios
- Formato: `nombre-componente`
- Ejemplos: `cloud-platform`, `app-pos`, `packages-frontend`, `service-identity`
- Usar kebab-case (palabras separadas por guiones)

### Branches
- `feature/nombre-caracteristica` - Nuevas funcionalidades
- `bugfix/nombre-correccion` - Correcciones de errores
- `hotfix/nombre-emergencia` - Correcciones urgentes
- `release/vX.X.X` - Versiones de lanzamiento
- `epic/nombre-epica` - Épicas grandes

### Commits
- Usar formato: `tipo(scope): descripción`
- Tipos: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`
- Ejemplos:
  - `feat(auth): add Microsoft login support`
  - `fix(tenant): resolve data isolation issue`
  - `docs(api): update authentication guide`

### Código
- C#: PascalCase para clases, camelCase para variables
- TypeScript/JavaScript: camelCase para todo
- Archivos: kebab-case
- Constantes: UPPER_SNAKE_CASE

---

## Estructura de Proyectos

### Aplicaciones
```
app-name/
├── src/
│   ├── frontend/     # React + Vite + TypeScript
│   │   ├── components/
│   │   ├── pages/
│   │   ├── hooks/
│   │   ├── utils/
│   │   └── types/
│   ├── backend/      # .NET 10
│   │   ├── Controllers/
│   │   ├── Models/
│   │   ├── Services/
│   │   ├── Infrastructure/
│   │   └── DTOs/
│   └── worker/       # Go
│       ├── handlers/
│       ├── models/
│       └── utils/
├── tests/
│   ├── unit/
│   ├── integration/
│   └── e2e/
├── docs/
├── docker/
└── deploy/
```

### Paquetes Reutilizables
```
package-name/
├── src/
├── tests/
├── docs/
├── config/
└── CHANGELOG.md
```

---

## Estándares de Código

### C# (.NET 10)
- Usar `var` cuando el tipo sea obvio
- Usar expresiones lambda cuando sea conciso
- Implementar interfaces explícitamente cuando sea necesario
- Usar async/await para operaciones asíncronas
- Implementar disposables correctamente
- Usar attributes para validación y documentación

### TypeScript/React
- Usar interfaces en lugar de tipos cuando sea posible
- Usar generics para componentes reutilizables
- Implementar memoización cuando sea necesario
- Usar hooks personalizados para lógica compartida
- Implementar manejo de errores global
- Usar Zod para validación de esquemas

### Go (Workers)
- Usar error handling explícito
- Implementar graceful shutdown
- Usar context para cancelación
- Implementar worker pools para tareas concurrentes
- Usar estructuras de datos thread-safe cuando sea necesario

---

## Pruebas

### Unitarias
- Cobertura mínima del 80%
- Probar todos los caminos lógicos
- Usar mocks solo cuando sea necesario
- Probar casos límite y de error

### Integración
- Usar TestContainers para bases de datos
- Probar integraciones con servicios externos
- Validar aislamiento multi-tenant
- Probar flujos completos de negocio

### E2E
- Probar flujos críticos de usuario
- Usar Playwright o Cypress
- Probar en diferentes navegadores
- Automatizar en CI/CD

---

## Seguridad

### Autenticación
- JWT con firma asimétrica
- Refresh tokens con rotación
- Tiempos de expiración apropiados
- Protección contra CSRF

### Autorización
- Validación de tenant en cada request
- Control de acceso basado en roles
- Validación de permisos por recurso
- Auditoría de operaciones sensibles

### Datos
- Encryptar datos sensibles en reposo
- Validar y sanitizar entradas
- Prevenir inyección SQL
- Usar consultas parametrizadas

---

## Observabilidad

### Logging
- Logs estructurados en JSON
- Niveles apropiados (debug, info, warn, error)
- Contexto de tenant en logs
- No loggear datos sensibles

### Métricas
- Tiempos de respuesta
- Errores por tipo
- Uso de recursos
- Métricas de negocio

### Tracing
- Tracing distribuido
- Correlación de requests
- Identificación de cuellos de botella
- Seguimiento de flujos

---

## Despliegue

### CI/CD
- Validación de estándares en PR
- Ejecución de pruebas automáticas
- Análisis de seguridad
- Deployment automático a staging
- Approval manual para producción

### Ambientes
- Desarrollo: Local y equipo
- Testing: Integración continua
- Staging: Pre-producción
- Producción: Ambiente real

---

## Documentación

### Código
- Documentar APIs con comentarios XML
- Usar regiones para organizar código
- Comentarios solo cuando sea necesario
- Nombrar variables y funciones de forma clara

### Proyectos
- README con propósito y ejecución
- ARCHITECTURE con diseño y decisiones
- CHANGELOG con historial de cambios
- DOCUMENTATION con guías y tutoriales

---

## Revisión de Código

### Requisitos
- Al menos una aprobación
- Pruebas pasando
- Análisis de seguridad limpio
- Cumplimiento de estándares

### Checklist
- [ ] Funcionalidad implementada correctamente
- [ ] Pruebas cubriendo escenarios
- [ ] Cumple con estándares de código
- [ ] Consideraciones de seguridad aplicadas
- [ ] Documentación actualizada
- [ ] No introduce deuda técnica