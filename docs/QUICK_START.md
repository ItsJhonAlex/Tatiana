# 🚀 Tatiana Bot 2.0 - Quick Start Guide

## ⚡ Start Developing NOW!

Este guía te ayudará a empezar el desarrollo de Tatiana Bot 2.0 **inmediatamente** siguiendo el roadmap paso a paso.

## 🎯 Primer Día - Setup Completo

### **📋 Pre-requisitos (15 minutos)**

1. **Verificar herramientas**:
```bash
# Verificar versiones
python3 --version    # Necesitas 3.12+
node --version       # Necesitas 18+
docker --version     # Necesitas Docker
pnpm --version      # Instalar si no tienes

# Si no tienes pnpm:
npm install -g pnpm
```

2. **Crear Bot en Discord** (5 min):
   - Ve a: https://discord.com/developers/applications
   - "New Application" → Nombre: "Tatiana Bot 2.0"
   - Bot → "Add Bot" → Copy Token
   - OAuth2 → URL Generator → Bot + applications.commands

3. **Obtener API Key de Gemini** (5 min):
   - Ve a: https://aistudio.google.com/app/apikey
   - "Create API Key" → Copy

### **🔧 Setup del Proyecto (30 minutos)**

```bash
# 1. Navegar al proyecto
cd /home/itsjhonalex/Desarrollo/Proyectos/Tatiana

# 2. Configurar Git
git init
git add .
git commit -m "feat: initial project structure with complete documentation"

# 3. Configurar entorno
cp .env.example .env
# Editar .env con tus tokens (Discord, Gemini, etc.)

# 4. Ejecutar setup automático
chmod +x scripts/setup.sh
./scripts/setup.sh

# 5. Probar Docker
docker-compose up postgres redis -d
docker-compose logs -f
```

### **✅ Verificación (10 minutos)**

```bash
# Verificar que todo funciona
docker-compose ps                    # Debe mostrar containers Up
docker exec tatiana-postgres pg_isready  # Debe mostrar "accepting connections"
docker exec tatiana-redis redis-cli ping # Debe mostrar "PONG"
```

**🎉 ¡Si todo está verde, estás listo para el Día 2!**

---

## 📅 Tu Plan de los Próximos 7 Días

### **📋 Días 1-5: FASE 1 - Infraestructura**

#### **Día 1** ✅ (Completado arriba)
- [x] Setup del proyecto
- [x] Docker funcionando
- [x] Variables configuradas

#### **Día 2** 🎯 (Siguiente)
**Objetivo**: Base de datos funcionando
```bash
# Crear estructura bot
mkdir -p bot/src/{config,core,cogs,services,models,utils}
mkdir -p bot/tests

# Instalar dependencias
cd bot
python -m venv venv
source venv/bin/activate
pip install discord.py asyncpg sqlalchemy alembic python-dotenv

# Configurar Alembic
alembic init migrations
```

**Meta del día**: Base de datos con schema completo

#### **Día 3** 🎯
**Objetivo**: Bot básico conectado
```bash
# Crear bot básico que se conecte a Discord
# Implementar sistema de logging
# Configuración desde .env
```

**Meta del día**: Ver bot online en Discord

#### **Día 4** 🎯
**Objetivo**: API básica funcionando
```bash
# Setup FastAPI
# Health checks
# JWT authentication básico
```

**Meta del día**: API responde en localhost:8000

#### **Día 5** 🎯
**Objetivo**: Testing configurado
```bash
# Configurar pytest
# Crear primeros tests
# Setup GitHub Actions
```

**Meta del día**: Tests corriendo y pasando

### **📋 Días 6-7: Comandos Básicos**

#### **Día 6** 🎯
**Objetivo**: Sistema de comandos
```bash
# /ping command
# /help command
# Sistema de cooldowns
```

#### **Día 7** 🎯
**Objetivo**: AI funcionando
```bash
# /chat command con Gemini
# Sistema de personalidades
# Context management
```

---

## 🛠️ Comandos Esenciales Diarios

### **🌅 Inicio del día**:
```bash
cd /home/itsjhonalex/Desarrollo/Proyectos/Tatiana
git pull origin main
docker-compose up -d
docker-compose logs --tail=20
```

### **💻 Durante desarrollo**:
```bash
# Tests frecuentes
cd bot && source venv/bin/activate && python -m pytest tests/ -v

# Commit frecuente
git add .
git commit -m "feat(bot): implement [feature]"
```

### **🌙 Final del día**:
```bash
git push origin main
docker-compose down
```

## 📝 Template de Commit Diario

```bash
# Ejemplos de commits siguiendo convenciones:
git commit -m "feat(bot): add ping command with latency display"
git commit -m "feat(db): implement user and guild schema"
git commit -m "fix(api): resolve JWT token validation issue"
git commit -m "test(bot): add unit tests for command system"
git commit -m "docs: update setup instructions"
```

## 🚨 Solución Rápida de Problemas

### **Docker no funciona**:
```bash
# Limpiar y reiniciar
docker-compose down -v
docker system prune -f
docker-compose up -d
```

### **Bot no se conecta**:
```bash
# Verificar token en .env
echo $DISCORD_TOKEN
# Revisar logs
docker-compose logs bot
```

### **Base de datos problemas**:
```bash
# Resetear DB
docker exec -it tatiana-postgres psql -U tatiana_user -d tatiana_db -c "DROP SCHEMA public CASCADE; CREATE SCHEMA public;"
cd bot && alembic upgrade head
```

## 📊 Progreso Visual - Primeros 7 Días

```
Día 1: [██████████] 100% ✅ Setup Complete
Día 2: [__________]   0% 🎯 Database Schema  
Día 3: [__________]   0% 🎯 Bot Connection
Día 4: [__________]   0% 🎯 FastAPI Setup
Día 5: [__________]   0% 🎯 Testing Setup
Día 6: [__________]   0% 🎯 Commands System
Día 7: [__________]   0% 🎯 AI Integration

SEMANA 1: [██________]  20% (1/5 días)
```

## 🎯 Criterios de Éxito por Día

### **Día 1** ✅
- [ ] Git repo inicializado
- [ ] Docker containers corriendo
- [ ] .env configurado correctamente
- [ ] Setup script ejecutado sin errores

### **Día 2** 🎯
- [ ] Schema SQL completo
- [ ] Alembic configurado
- [ ] Migración aplicada
- [ ] Tablas creadas en PostgreSQL

### **Día 3** 🎯
- [ ] Bot aparece online en Discord
- [ ] Logs estructurados funcionan
- [ ] Bot responde a menciones
- [ ] Configuración carga desde .env

### **Día 4** 🎯
- [ ] FastAPI corriendo en puerto 8000
- [ ] /health endpoint responde
- [ ] /docs muestra documentación
- [ ] JWT authentication básico

### **Día 5** 🎯
- [ ] Tests unitarios corriendo
- [ ] Coverage report generado
- [ ] GitHub Actions verde
- [ ] Quality gates pasando

## 🏆 Motivación y Tips

### **🔥 Tips para Mantener el Momentum**:
1. **Commit cada 30-60 minutos** - Progreso visible
2. **Celebra los pequeños wins** - Cada comando que funciona
3. **Usa el checklist** - Satisfacción de marcar ✅
4. **No te saltes los tests** - Te ahorrará tiempo después
5. **Documenta lo que aprendes** - Para futura referencia

### **⚡ Cuando te sientas abrumado**:
1. **Respira** - Es normal sentirse así
2. **Enfócate en UNA tarea** - No pienses en toda la semana
3. **Revisa lo que ya lograste** - Has llegado hasta aquí
4. **Pide ayuda** - La documentación está ahí para ayudarte

### **🎯 Mantén el enfoque**:
- **Una cosa a la vez** - No saltes entre tareas
- **Sigue el orden** - El roadmap está diseñado así por una razón
- **Prueba cada step** - No asumas que funciona
- **Documenta problemas** - Para no repetir errores

---

## 🚀 ¡EMPEZAR AHORA!

**📌 Tu próxima acción inmediata:**

1. **Abrir terminal**
2. **Navegar al proyecto**: `cd /home/itsjhonalex/Desarrollo/Proyectos/Tatiana`
3. **Ejecutar primer comando**: `git status`
4. **Seguir el setup de arriba**

**🎯 Meta de hoy**: Tener Docker corriendo y .env configurado

**🔥 Meta de mañana**: Base de datos con schema completo

---

**¡Vamos! ¡Tu viaje hacia Tatiana Bot 2.0 empieza AHORA! 🚀✨**

*Recuerda: Cada línea de código te acerca más al bot más avanzado que hayas creado.* 