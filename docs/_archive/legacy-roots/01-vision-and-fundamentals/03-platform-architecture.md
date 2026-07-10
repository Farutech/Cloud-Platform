# Farutech Cloud Platform - Architecture

## 1. Introducción

Farutech Cloud Platform es una plataforma SaaS modular construida con arquitectura de monolito modular. La arquitectura sigue los principios de Clean Architecture con un enfoque de monolito modular que permite la evolución gradual hacia microservicios cuando sea necesario.

## 2. Visión Arquitectónica

### 2.1 Arquitectura de Monolito Modular
La plataforma se implementa inicialmente como un monolito modular que:
- Permite una rápida iteración y desarrollo
- Mantiene bajo acoplamiento entre módulos
- Facilita la implementación y operación
- Permite la evolución gradual hacia microservicios

### 2.2 Principios de Diseño
- **Separación de Responsabilidades**: Cada capa tiene responsabilidades claramente definidas
- **Inversión de Dependencias**: Las capas internas no dependen de capas externas
- **Acoplamiento Débil**: Los componentes están débilmente acoplados
- **Cohesión Alta**: Las funcionalidades relacionadas están agrupadas

## 3. Estructura de Capas

### 3.1 Capa de Presentación (Presentation Layer)
- Minimal APIs
- Controllers
- DTOs de entrada/salida
- Manejo de autenticación/autorización HTTP

### 3.2 Capa de Aplicación (Application Layer)
- Casos de uso
- Validadores (FluentValidation)
- DTOs de dominio
- Interfaces de servicios externos
- Handlers de comandos y queries

### 3.3 Capa de Dominio (Domain Layer)
- Entidades de negocio
- Value Objects
- Interfaces de repositorios
- Excepciones de dominio
- Lógica de negocio pura

### 3.4 Capa de Infraestructura (Infrastructure Layer)
- Implementaciones de repositorios
- Configuración de Entity Framework
- Servicios externos (email, notificaciones)
- Configuración de autenticación
- Logging y observabilidad

## 4. Modelo de Multi-Tenancy

### 4.1 Modelo de Tenant Compuesto
La plataforma implementa un modelo de tenant compuesto:
- **Organización**: Representa al cliente
- **Instancia**: Representa una implementación específica de una aplicación para la organización

### 4.2 Estrategia de Aislamiento
- **Shared Mode**: Aislamiento lógico mediante schemas de PostgreSQL
- **Dedicated Mode**: Aislamiento físico con recursos dedicados

### 4.3 Implementación Técnica
- PostgreSQL con schemas por organización
- Row Level Security (RLS) para aislamiento adicional
- Filtrado automático por tenant en consultas
- Contexto de tenant en cada solicitud

## 5. Tecnologías y Stack Técnico

### 5.1 Backend
- **Framework**: .NET 10
- **Arquitectura**: Clean Architecture + Vertical Slice Architecture
- **ORM**: Entity Framework Core 10
- **Base de Datos**: PostgreSQL 16+
- **Autenticación**: JWT + Identity Server
- **Autorización**: ABAC + RBAC híbrido
- **Colas**: MediatR + Background Services o RabbitMQ

### 5.2 Frontend
- **Framework**: React 19+
- **Empaquetado**: Vite 6+
- **Lenguaje**: TypeScript 5+
- **Estilos**: Tailwind CSS o Styled Components
- **Formularios**: React Hook Form + Zod
- **Manejo de Estado**: Zustand o React Query

### 5.3 Workers y Procesamiento Asíncrono
- **Lenguaje**: Go 1.23+
- **Colas**: RabbitMQ o Apache Kafka
- **Procesamiento**: Workers concurrentes
- **Monitoreo**: Prometheus + Grafana

### 5.4 Infraestructura
- **Contenedores**: Docker
- **Orquestación**: Docker Compose (inicial) → Kubernetes (futuro)
- **Despliegue**: Coolify (inicial) → Azure Container Apps (futuro)
- **Dominios**: Proxy inverso con NGINX

## 6. Arquitectura de Microfrontends

### 6.1 Modelo de Implementación
- Module Federation para compartir componentes
- Contenedor principal (shell)
- Microfrontends independientes por aplicación
- Contexto compartido de usuario y tenant

### 6.2 Comunicación
- Event Driven Architecture para comunicación entre microfrontends
- Contexto de usuario y tenant compartido
- Servicios comunes de autenticación y autorización

## 7. Seguridad

### 7.1 Autenticación
- OAuth 2.0 / OpenID Connect
- JWT tokens con refresh
- Soporte para proveedores externos (Microsoft, Google)
- Autenticación multifactor (MFA)

### 7.2 Autorización
- Modelo híbrido RBAC + ABAC
- Políticas basadas en claims
- Control de acceso a nivel de recurso
- Auditoría de operaciones sensibles

### 7.3 Protección de Datos
- Cifrado de datos sensibles en reposo
- Validación y sanitización de entradas
- Prevención de inyección SQL y XSS
- Gestión segura de secrets

## 8. Observabilidad

### 8.1 Logging
- Logs estructurados en JSON
- Niveles de log apropiados
- Contexto de tenant en logs
- No loggear datos sensibles

### 8.2 Métricas
- Tiempos de respuesta
- Errores por tipo
- Uso de recursos
- Métricas de negocio

### 8.3 Tracing
- Tracing distribuido
- Correlación de requests
- Identificación de cuellos de botella
- Seguimiento de flujos

## 9. Estrategia de Despliegue

### 9.1 Ambientes
- Development: Local y equipo
- Testing: Integración continua
- Staging: Pre-producción
- Production: Ambiente real

### 9.2 CI/CD
- Validación de estándares en PR
- Ejecución de pruebas automáticas
- Análisis de seguridad
- Deployment automático a staging
- Approval manual para producción

## 10. Escalabilidad y Rendimiento

### 10.1 Escalabilidad Horizontal
- Statelessness de servicios
- Caching distribuido (Redis)
- Balanceo de carga
- Auto-scaling basado en métricas

### 10.2 Optimizaciones
- Caching a nivel de aplicación
- Indexación de base de datos
- Paginación de resultados
- Compresión de respuestas

## 11. Estrategia de Evolución

### 11.1 Deuda Técnica
- Gestión activa de deuda técnica
- Revisión continua de arquitectura
- Modernización progresiva
- Retrospectivas técnicas regulares

### 11.2 Adaptabilidad
- Arquitectura evolutiva
- Patrones de diseño flexibles
- Interfaces bien definidas
- Pruebas de regresión automatizadas