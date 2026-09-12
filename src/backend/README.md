# FaruTech Cloud Platform — Control Plane & Provisioning Engine

> **Núcleo Tecnológico PaaS Multi-SaaS (`plt-core-platform`)**  
> Implementado green-field en **.NET 10** bajo principios de Clean Architecture.

---

## 1. Arquitectura y Componentes

El Control Plane es el cerebro de orquestación de Cloud Platform, responsable de aprovisionar infraestructura y resolver enrutamiento dinámico para las aplicaciones cliente y del marketplace.

```text
src/backend/
├── Farutech.Platform.Domain/          # Entidades centrales (Organization, Instance, IsolationMode)
├── Farutech.Platform.Application/     # Casos de uso (IProvisioningEngine, DTOs de aprovisionamiento)
├── Farutech.Platform.Infrastructure/  # Motores de persistencia y aprovisionamiento PostgreSQL
├── Program.cs                         # Endpoints REST (Minimal API .NET 10)
└── Farutech.Platform.ControlPlane.csproj
```

---

## 2. Modos de Aislamiento Soportados

1. **Shared Mode (Planes Estándar):**
   - Aislamiento lógico mediante schema PostgreSQL (`org_{id}`).
   - Enrutamiento dinámico por subdominio: `{instanceId}.{organizationId}.farutech.app`.
   - Infraestructura de cómputo compartida con header de aislamiento `X-Tenant-Id`.

2. **Dedicated Mode (Planes Enterprise):**
   - Contenedor / pod exclusivo con límites de CPU y memoria garantizados.
   - Base de datos PostgreSQL aislada con credenciales exclusivas.
   - Soporte para dominios personalizados del cliente (ej. `app.cliente.com`) con certificados SSL automáticos.

---

## 3. Endpoints de la API

| Método | Endpoint | Propósito |
|---|---|---|
| `GET` | `/health` | Healthcheck y metadatos del runtime .NET 10 |
| `POST` | `/api/v1/provisioning/instances` | Aprovisionamiento automatizado de nueva instancia SaaS |
| `GET` | `/api/v1/routing/resolve?host={host}` | Resolución dinámica de tenant para Ingress y Gateway |

---

## 4. Compilación y Ejecución Local

```bash
cd Cloud-Platform/src/backend

# 1. Restaurar dependencias
dotnet restore

# 2. Compilar
dotnet build --nologo

# 3. Ejecutar servicio
dotnet run
```
