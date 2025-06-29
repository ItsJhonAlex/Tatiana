# 🚀 Tatiana Bot 2.0 - Quick Start Guide

## 🎯 Overview

This quick start guide will help you set up and run Tatiana Bot 2.0 in development mode in less than 15 minutes.

## 📋 Prerequisites

Before starting, make sure you have:

### Required Software
- [Docker Desktop](https://www.docker.com/products/docker-desktop/) installed and running
- [Git](https://git-scm.com/) for version control
- A code editor (VS Code recommended)

### Discord Requirements
- A Discord account and server for testing
- A Discord application created in the [Discord Developer Portal](https://discord.com/developers/applications)
- Bot token and client credentials

### API Keys
- [Google Gemini AI API Key](https://makersuite.google.com/app/apikey) for AI functionality

## 🚀 Quick Setup (5 minutes)

### 1. Clone the Repository
```bash
git clone https://github.com/ItsJhonAlex/Tatiana.git
cd Tatiana
```

### 2. Environment Configuration
```bash
# Copy environment template
cp .env.example .env

# Edit the .env file with your credentials
nano .env  # or code .env in VS Code
```

**Required Environment Variables:**
```env
# Discord Configuration
DISCORD_TOKEN=your_bot_token_here
DISCORD_CLIENT_ID=your_client_id_here
DISCORD_CLIENT_SECRET=your_client_secret_here

# AI Configuration
GEMINI_API_KEY=your_gemini_api_key_here

# Security (generate strong secrets)
JWT_SECRET=your_jwt_secret_here
NEXTAUTH_SECRET=your_nextauth_secret_here
```

### 3. Start the Development Environment
```bash
# Start all services
docker-compose up -d

# View logs (optional)
docker-compose logs -f
```

### 4. Verify Installation
Open these URLs in your browser:
- **Dashboard**: http://localhost:3000
- **API Documentation**: http://localhost:8000/docs
- **API Health**: http://localhost:8000/health

## 🎮 First Steps

### 1. Invite the Bot to Your Server
1. Go to Discord Developer Portal
2. Select your application → OAuth2 → URL Generator
3. Select scopes: `bot`, `applications.commands`
4. Select permissions: `Administrator` (for testing)
5. Use the generated URL to invite the bot

### 2. Test Basic Commands
In your Discord server:
```
!ping                    # Test basic connectivity
!help                    # View available commands
!chat Hello Tatiana!     # Test AI integration
!balance                 # Check economy system
```

### 3. Access Web Dashboard
1. Visit http://localhost:3000
2. Click "Login with Discord"
3. Authorize the application
4. Explore server settings and statistics

## 📁 Project Structure

```
Tatiana/
├── api/                 # FastAPI backend service
├── bot/                 # Discord bot service
├── dashboard/           # Next.js frontend
├── database/            # Database schemas and migrations
├── docs/                # Complete documentation
├── nginx/               # Reverse proxy configuration
├── scripts/             # Utility scripts
├── .env.example         # Environment template
└── docker-compose.yml   # Development orchestration
```

## 🔧 Development Commands

### Container Management
```bash
# Start all services
docker-compose up -d

# Stop all services
docker-compose down

# Restart specific service
docker-compose restart bot

# View service logs
docker-compose logs -f bot
docker-compose logs -f api
docker-compose logs -f dashboard
```

### Database Operations
```bash
# Run migrations
docker-compose exec api alembic upgrade head

# Access PostgreSQL
docker-compose exec postgres psql -U tatiana_user -d tatiana_db

# Backup database
docker-compose exec postgres pg_dump -U tatiana_user tatiana_db > backup.sql
```

### Development Mode
```bash
# Enable hot reload for all services
docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d

# View development logs
docker-compose logs -f --tail=100
```

## 🛠️ Common Issues & Solutions

### Bot Not Responding
1. Check bot token is correct
2. Verify bot has necessary permissions
3. Check logs: `docker-compose logs bot`

### Database Connection Issues
1. Ensure PostgreSQL container is running
2. Check database credentials in .env
3. Run: `docker-compose restart postgres`

### API Not Loading
1. Check if port 8000 is available
2. Verify environment variables
3. Check logs: `docker-compose logs api`

### Dashboard Not Loading
1. Check if port 3000 is available
2. Verify NextAuth configuration
3. Check logs: `docker-compose logs dashboard`

## 🔍 Monitoring & Debugging

### Service Health Checks
```bash
# Check all service status
docker-compose ps

# Health check endpoints
curl http://localhost:8000/health          # API health
curl http://localhost:3000/api/health      # Dashboard health
```

### Log Analysis
```bash
# Real-time logs for all services
docker-compose logs -f

# Filter logs by service
docker-compose logs -f bot | grep ERROR
docker-compose logs -f api | grep WARNING
```

### Performance Monitoring
- **API Metrics**: http://localhost:8000/metrics
- **Database Stats**: Access via pgAdmin (http://localhost:5050)
- **Redis Stats**: Access via Redis Commander (http://localhost:8081)

## 📚 Next Steps

### Development
1. Read the [Technical Specification](./TECHNICAL_SPECIFICATION.md)
2. Review the [Architecture Guide](./ARCHITECTURE.md)
3. Check the [Contributing Guide](../CONTRIBUTING.md)

### Production Deployment
1. Read the [Deployment Guide](./DEPLOYMENT.md)
2. Review security configurations
3. Set up monitoring and backups

### Feature Development
1. Review the [Development Roadmap](./DEVELOPMENT_ROADMAP.md)
2. Check the [API Reference](./API_REFERENCE.md)
3. Read the [Bot Commands](./COMMANDS_REFERENCE.md)

## 🆘 Getting Help

### Documentation
- [Complete Documentation](./README.md)
- [FAQ](./FAQ.md)
- [Troubleshooting](./TROUBLESHOOTING.md)

### Community
- [GitHub Issues](https://github.com/ItsJhonAlex/Tatiana/issues)
- [Discord Server](https://discord.gg/your-server)
- [Discussions](https://github.com/ItsJhonAlex/Tatiana/discussions)

### Support
- Create an issue for bugs
- Use discussions for questions
- Check existing documentation first

---

## ⭐ Success!

If everything is working correctly, you should have:
- ✅ Bot responding to commands in Discord
- ✅ Web dashboard accessible and functional
- ✅ API responding to requests
- ✅ Database and cache operational

**Congratulations! Tatiana Bot 2.0 is now running in development mode.**

Ready to start developing? Check out the [Development Roadmap](./DEVELOPMENT_ROADMAP.md) for next steps!

*Recuerda: Cada línea de código te acerca más al bot más avanzado que hayas creado.* 