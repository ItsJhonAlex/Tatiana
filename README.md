# 🎮 Tatiana Bot 2.0
## The Most Advanced Discord Bot for Modern Communities

[![Python](https://img.shields.io/badge/Python-3.13.4-blue.svg)](https://python.org)
[![UV](https://img.shields.io/badge/UV-package%20manager-green.svg)](https://github.com/astral-sh/uv)
[![Discord.py](https://img.shields.io/badge/Discord.py-2.5.2-blue.svg)](https://discordpy.readthedocs.io/)
[![FastAPI](https://img.shields.io/badge/FastAPI-0.115.14-green.svg)](https://fastapi.tiangolo.com/)
[![Node.js](https://img.shields.io/badge/Node.js-22%20LTS-green.svg)](https://nodejs.org/)
[![PNPM](https://img.shields.io/badge/PNPM-package%20manager-orange.svg)](https://pnpm.io/)
[![Next.js](https://img.shields.io/badge/Next.js-15.2-black.svg)](https://nextjs.org/)
[![TypeScript](https://img.shields.io/badge/TypeScript-5.8.3-blue.svg)](https://typescriptlang.org/)
[![React](https://img.shields.io/badge/React-19.1.0-blue.svg)](https://react.dev/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-17-blue.svg)](https://postgresql.org/)
[![Redis](https://img.shields.io/badge/Redis-8-red.svg)](https://redis.io/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

> **🚀 A complete rewrite of Tatiana Bot with cutting-edge technology, AI integration, and modern architecture.**

---

## 🌟 Overview

**Tatiana Bot 2.0** is a revolutionary Discord bot that combines the power of artificial intelligence, modern web technologies, and microservices architecture to deliver an unparalleled experience for Discord communities. Built from the ground up with scalability, performance, and user experience in mind.

### ✨ What Makes Tatiana Bot 2.0 Special?

- 🤖 **AI-Powered Conversations** with Google Gemini AI
- 🎮 **85+ Commands** across 11 specialized categories
- 💰 **Virtual Economy System** with transactions and rewards
- 🐾 **Pokémon Catching & Trading** system
- 🃏 **Yu-Gi-Oh Card Collection** system
- 🛡️ **Advanced Moderation** with AutoMod capabilities
- 🌐 **Real-time Web Dashboard** with analytics
- 🚀 **Modern Microservices Architecture**
- 📱 **Mobile-Responsive Design**
- 🔧 **Extensive Customization Options**

---

## 🏗️ Architecture Overview

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Discord Bot   │    │   FastAPI       │    │   Next.js       │
│   (Python 3.13)│◄──►│   Backend       │◄──►│   Dashboard     │
│   discord.py    │    │   (0.115.14)    │    │   (v15.2)       │
│   2.5.2         │    │                 │    │                 │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         │              ┌─────────────────┐              │
         │              │   PostgreSQL    │              │
         └──────────────►│   Database      │◄─────────────┘
                        │   (v17)         │
                        └─────────────────┘
                                 │
                        ┌─────────────────┐
                        │   Redis Cache   │
                        │   (v8)          │
                        └─────────────────┘
```

### 🧩 Technology Stack

#### **Backend Services**
- **Python 3.13.4** - Latest stable Python release
- **discord.py 2.5.2** - Modern Discord API wrapper
- **FastAPI 0.115.14** - High-performance API framework
- **PostgreSQL 17** - Advanced relational database
- **Redis 8** - In-memory data store

#### **Frontend Dashboard**
- **Next.js 15.2** - React framework with App Router
- **React 19.1.0** - Latest React with new features
- **TypeScript 5.8.3** - Type-safe JavaScript
- **Tailwind CSS** - Utility-first CSS framework
- **Shadcn/ui** - Modern component library

#### **AI & External Services**
- **Google Gemini AI** - Advanced conversational AI
- **OpenWeather API** - Weather information
- **CoinGecko API** - Cryptocurrency data
- **Pokémon API** - Pokémon data and images

#### **DevOps & Infrastructure**
- **Docker & Docker Compose** - Containerization
- **GitHub Actions** - CI/CD pipeline
- **Nginx** - Reverse proxy and load balancer
- **Redis** - Caching and session management

---

## 🚀 Quick Start

### Prerequisites

- **Docker Desktop** 20.10+
- **Node.js** 22 LTS+ (for local development)
- **Python** 3.13+ (for local development)
- **UV** (Python package manager - auto-installed)
- **PNPM** (Node.js package manager)
- **Git** 2.30+

### 🐳 One-Command Setup (Recommended)

```bash
# Clone the repository
git clone https://github.com/ItsJhonAlex/tatiana-bot-2.0.git
cd tatiana-bot-2.0

# Setup environment variables
cp .env.example .env

# Edit .env with your configuration
nano .env

# Start all services
docker-compose up -d
```

### 📱 Access Your Services

- **Discord Bot**: Automatically connects to Discord
- **Web Dashboard**: http://localhost:3000
- **API Documentation**: http://localhost:8000/docs
- **Database**: localhost:5432
- **Redis**: localhost:6379

---

## 🎯 Key Features

### 🤖 AI-Powered Interactions
- **Natural Language Processing** with Google Gemini
- **Context-Aware Responses** 
- **Multi-Language Support** (Spanish/English)
- **Smart Command Recognition**

### 🎮 Gaming Systems
- **Pokémon Catching** - Catch, trade, and battle
- **Card Collection** - Yu-Gi-Oh card system
- **Virtual Economy** - Earn and spend virtual currency
- **Mini-Games** - Interactive entertainment

### 🛡️ Moderation Tools
- **AutoMod System** - Automated content filtering
- **User Management** - Kicks, bans, timeouts
- **Role Management** - Dynamic role assignment
- **Audit Logs** - Complete action tracking

### 📊 Analytics & Insights
- **Real-time Statistics** - Server metrics and usage
- **User Activity Tracking** - Engagement analytics
- **Command Usage Analytics** - Performance insights
- **Custom Dashboards** - Personalized views

---

## 📚 Documentation

### 📖 Complete Documentation
- [📋 **Project Summary**](docs/PROJECT_SUMMARY.md) - High-level overview
- [🏗️ **Architecture Guide**](docs/ARCHITECTURE.md) - System design details
- [⚡ **Quick Start**](docs/QUICK_START.md) - Get up and running fast
- [📋 **Requirements**](docs/REQUIREMENTS.md) - System requirements
- [🔧 **Technical Specs**](docs/TECHNICAL_SPECIFICATION.md) - Detailed specifications

### 🛠️ Development Guides
- [🚀 **Implementation Plan**](docs/IMPLEMENTATION_PLAN.md) - Development roadmap
- [📦 **Migration Guide**](docs/MIGRATION_GUIDE.md) - Upgrade from v1.0
- [✅ **Roadmap Checklist**](docs/ROADMAP_CHECKLIST.md) - Progress tracking
- [🗺️ **Development Roadmap**](docs/DEVELOPMENT_ROADMAP.md) - Feature timeline

### 📖 Reference Materials
- [✨ **Features Overview**](docs/FEATURES.md) - Complete feature list
- [⚡ **Commands Reference**](docs/COMMANDS_REFERENCE.md) - All bot commands
- [📄 **Commands List**](COMMANDS.md) - Quick command reference

---

## 🛠️ Development

### 🏃‍♂️ Local Development Setup

```bash
# Backend Development
cd api
uv venv
source .venv/bin/activate  # Linux/Mac
.venv\Scripts\activate     # Windows
uv pip install -r requirements.txt
uvicorn main:app --reload

# Frontend Development
cd dashboard
pnpm install
pnpm dev

# Bot Development
cd bot
uv venv
source .venv/bin/activate  # Linux/Mac
.venv\Scripts\activate     # Windows
uv pip install -r requirements.txt
python main.py
```

### 🧪 Testing

```bash
# Backend Tests
cd api
source .venv/bin/activate
pytest tests/ -v --cov

# Frontend Tests
cd dashboard
pnpm test
pnpm test:e2e

# Bot Tests
cd bot
source .venv/bin/activate
pytest tests/ -v
```

### 📦 Building for Production

```bash
# Build all services
docker-compose -f docker-compose.prod.yml build

# Deploy with optimizations
docker-compose -f docker-compose.prod.yml up -d
```

---

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md) for details.

### 📝 Development Standards
- **Code Quality**: 80%+ test coverage
- **File Limits**: 200 lines max (150 for React components)
- **Commit Format**: Conventional Commits
- **Language**: English for code comments

### 🐛 Bug Reports & 💡 Feature Requests
- Use our [Issue Templates](.github/ISSUE_TEMPLATE/)
- Follow the [Code of Conduct](CODE_OF_CONDUCT.md)
- Check existing issues before creating new ones

---

## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

---

## 👥 Team

**Lead Developer**: Jonathan Alejandro Rodríguez López ([@ItsJhonAlex](https://github.com/ItsJhonAlex))

---

## 🙏 Acknowledgments

- **Discord.py Community** - Excellent library support
- **FastAPI Team** - Amazing web framework
- **Next.js Team** - Incredible React framework
- **Vercel** - Hosting and deployment platform
- **Google** - Gemini AI integration
- **Open Source Community** - Inspiration and tools

---

## 📞 Support

- **Documentation**: [docs/](docs/)
- **Issues**: [GitHub Issues](https://github.com/ItsJhonAlex/tatiana-bot-2.0/issues)
- **Discussions**: [GitHub Discussions](https://github.com/ItsJhonAlex/tatiana-bot-2.0/discussions)
- **Email**: support@tatiana-bot.com

---

<div align="center">
  <p><strong>Built with ❤️ for the Discord community</strong></p>
  <p>© 2025 Tatiana Bot 2.0 - All rights reserved</p>
</div> 