# FEATURE-002: VPS & Coolify Provisioning

**Épica Padre:** [EPIC-001](../epics/EPIC-001.md)  
**Estado:** 🔴 To Do  
**Prioridad:** Must Have (MoSCoW)  
**Story Points:** 8 SP  
**Horas Estimadas:** 24h  
**Responsable:** DevOps Engineer  
**Versión:** 1.0

---

## 📋 Descripción

Provisionar y configurar un VPS (Virtual Private Server) con Coolify instalado para servir como entorno de despliegue inicial de la plataforma Farutech Cloud Platform.

Coolify proporcionará una experiencia tipo Heroku/Vercel self-hosted, permitiendo despliegues automáticos desde GitHub con gestión simplificada de bases de datos, SSL y dominios.

## 🎯 Objetivo

Tener un entorno de despliegue funcional donde se pueda desplegar la plataforma y las aplicaciones del ecosistema de manera automatizada, segura y escalable inicialmente en un solo servidor.

## 👤 User Stories Asociadas

| ID | Story | Estado | SP | Tasks |
|----|-------|--------|-----|-------|
| [STORY-006](../stories/STORY-006.md) | Como DevOps, quiero provisionar VPS en proveedor cloud | 🔴 To Do | 3 | 5 |
| [STORY-007](../stories/STORY-007.md) | Como DevOps, quiero instalar Coolify en el VPS | 🔴 To Do | 3 | 4 |
| [STORY-008](../stories/STORY-008.md) | Como Admin, quiero configurar dominio y SSL | 🔴 To Do | 2 | 4 |

**Total**: 3 Stories | 13 Tasks | 8 SP

## ✅ Definition of Ready

- [ ] FEATURE-001 completada (GitHub Org lista)
- [ ] Proveedor de VPS seleccionado (Hetzner, DigitalOcean, AWS Lightsail)
- [ ] Presupuesto aprobado para infraestructura mensual (~$20-40/mes inicial)
- [ ] Dominio comprado y DNS configurables
- [ ] Credenciales de proveedor cloud disponibles en GitHub Secrets

## ✅ Definition of Done

- [ ] VPS creado con Ubuntu 22.04 LTS, 4GB RAM, 2 vCPU mínimo
- [ ] Coolify instalado y accesible vía web (https://coolify.farutech.com)
- [ ] SSL configurado con Let's Encrypt
- [ ] Dominio personalizado conectado
- [ ] Conexión a GitHub establecida para deploy automático
- [ ] Base de datos PostgreSQL disponible en Coolify
- [ ] Documentación de acceso y credenciales guardada en vault
- [ ] Tests de conectividad y despliegue de prueba exitosos

## 🔗 Dependencias

- **Bloqueada por:** FEATURE-001 (GitHub Organization Setup)
- **Bloquea a:** 
  - FEATURE-003 (Docker Base Images)
  - FEATURE-004 (CI/CD Pipeline Setup)
  - FEATURE-006 (Monitoring Stack Deployment)

## 🛠️ Requisitos Técnicos

### Especificaciones VPS Mínimas
- **OS:** Ubuntu 22.04 LTS
- **CPU:** 2 vCPU (4 recomendado)
- **RAM:** 4 GB (8 recomendado)
- **Disco:** 80 GB SSD
- **Red:** 1 Gbps, IP pública estática

### Software Requerido
- Docker Engine 24+
- Docker Compose 2.20+
- Coolify v4+
- Nginx Proxy Manager (incluido en Coolify)
- PostgreSQL 15+ (via Coolify)
- Redis 7+ (via Coolify)

## 📊 Métricas de Éxito

- ✅ VPS accesible vía SSH con key authentication
- ✅ Coolify dashboard accesible desde navegador sin errores
- ✅ SSL válido (A+ en SSL Labs test)
- ✅ Deploy automático desde GitHub funciona en < 5 minutos
- ✅ PostgreSQL aceptando conexiones seguras
- ✅ Uptime > 99% en primera semana

## ⚠️ Riesgos y Mitigación

| Riesgo | Impacto | Probabilidad | Mitigación |
|--------|---------|--------------|------------|
| VPS se cae frecuentemente | Alto | Media | Elegir proveedor con SLA > 99.9%, monitoreo activo |
| Coolify tiene bugs críticos | Medio | Baja | Usar versión stable, no nightly; tener plan B manual |
| SSL no renueva automáticamente | Alto | Baja | Configurar alertas de expiración, verificar semanalmente |
| Credentials leak | Crítico | Media | Usar GitHub Secrets, nunca commitear .env |

## 🔍 Referencias Técnicas

- [Coolify Documentation](https://coolify.io/docs/)
- [Hetzner Cloud API](https://docs.hetzner.cloud/)
- [DigitalOcean API](https://docs.digitalocean.com/reference/api/)
- [Let's Encrypt Setup](https://letsencrypt.org/getting-started/)
- [Docker Security Best Practices](https://docs.docker.com/engine/security/)

## 💰 Costos Estimados

| Concepto | Costo Mensual | Anual |
|----------|---------------|-------|
| VPS (Hetzner CX31) | €5.99 | €71.88 |
| Dominio farutech.com | $1.50 | $18.00 |
| Backup storage (opcional) | €3.00 | €36.00 |
| **TOTAL** | **€10.49** | **€125.88** |

*Nota: Precios pueden variar según proveedor y región*

## 📝 Notas de Implementación

- Preferir Hetzner por costo-beneficio para etapa inicial
- Configurar backups automáticos diarios del VPS
- Habilitar firewall (ufw) permitiendo solo puertos necesarios (22, 80, 443)
- Crear usuario no-root con sudo para operaciones diarias
- Configurar fail2ban para protección contra brute-force
- Documentar IPs, usuarios y contraseñas en vault seguro (no en git)

---

**Historial de Cambios:**
- v1.0 (2025-01-XX): Creación inicial de la feature

