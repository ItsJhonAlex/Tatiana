# 🤖 Tatiana Bot 2.0 - Discord AI Bot with Web Dashboard

<div align="center">

![Tatiana Bot Banner](https://img.shields.io/badge/Tatiana%20Bot-2.0-purple?style=for-the-badge&logo=discord)
![Python](https://img.shields.io/badge/Python-3.12-blue?style=for-the-badge&logo=python)
![Next.js](https://img.shields.io/badge/Next.js-14-black?style=for-the-badge&logo=next.js)
![FastAPI](https://img.shields.io/badge/FastAPI-0.104-green?style=for-the-badge&logo=fastapi)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-15-blue?style=for-the-badge&logo=postgresql)

A next-generation Discord bot with AI capabilities, advanced moderation, gamification systems, and a comprehensive web dashboard for administration.

[🚀 Quick Start](#-quick-start) • [📚 Documentation](#-documentation) • [🏗️ Architecture](#-architecture) • [🤝 Contributing](#-contributing)

</div>

---

## ✨ Features

### 🤖 Discord Bot
- **AI-Powered Conversations**: Intelligent responses using Gemini AI
- **Advanced Moderation**: Automated spam detection, content filtering, and moderation tools
- **Economy System**: Virtual currency, daily rewards, gambling, and leaderboards
- **Gamification**: Pokémon catching, trading cards, inventory management
- **Multi-Language Support**: Configurable per-server language settings
- **Slash Commands**: Modern Discord slash command support

### 🌐 Web Dashboard
- **Server Management**: Configure bot settings, manage channels and roles
- **User Management**: View profiles, economy stats, and moderation history
- **Real-time Analytics**: Bot usage statistics, command analytics, user engagement
- **Moderation Panel**: Review logs, quick actions, AutoMod configuration
- **AI Management**: Conversation history, prompt management, token usage tracking
- **Mobile Responsive**: Works perfectly on desktop, tablet, and mobile

### 🛠️ Technical Features
- **Microservices Architecture**: Scalable and maintainable design
- **Real-time Updates**: WebSocket connections for live dashboard updates
- **High Performance**: Optimized for speed with caching and connection pooling
- **Security First**: JWT authentication, OAuth2, role-based access control
- **Docker Support**: Containerized deployment with Docker Compose
- **Comprehensive Testing**: Unit tests, integration tests, and E2E testing

---

## 🚀 Quick Start

### Prerequisites

- **Python 3.12+** (for bot and API)
- **Node.js 18+** (for dashboard)
- **PostgreSQL 15+** (primary database)
- **Redis 7+** (caching and sessions)
- **Docker & Docker Compose** (recommended)

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/tatiana-bot-2.0.git
cd tatiana-bot-2.0
```

### 2. Environment Setup

Copy the environment template and configure your variables:

```bash
cp .env.example .env
```

Edit `.env` with your configuration:

```env
# Bot Configuration
DISCORD_TOKEN=your_discord_bot_token
GEMINI_API_KEY=your_gemini_api_key
BOT_PREFIX=!

# Database
DATABASE_URL=postgresql://user:password@localhost:5432/tatiana
REDIS_URL=redis://localhost:6379

# Web Dashboard
NEXTAUTH_SECRET=your_nextauth_secret
NEXTAUTH_URL=http://localhost:3000
DISCORD_CLIENT_ID=your_discord_client_id
DISCORD_CLIENT_SECRET=your_discord_client_secret

# API Configuration
API_HOST=0.0.0.0
API_PORT=8000
JWT_SECRET=your_jwt_secret
```

### 3. Docker Setup (Recommended)

```bash
# Start all services with Docker Compose
docker-compose up -d

# View logs
docker-compose logs -f

# Stop services
docker-compose down
```

### 4. Manual Setup (Alternative)

#### Backend Setup

```bash
# Navigate to bot directory
cd bot

# Install Python dependencies
pip install -r requirements.txt

# Run database migrations
alembic upgrade head

# Start the bot
python main.py
```

```bash
# Navigate to API directory
cd api

# Install Python dependencies
pip install -r requirements.txt

# Start the API server
uvicorn main:app --reload --host 0.0.0.0 --port 8000
```

#### Frontend Setup

```bash
# Navigate to dashboard directory
cd dashboard

# Install Node.js dependencies
npm install
# or with pnpm (preferred)
pnpm install

# Start development server
npm run dev
# or
pnpm dev
```

### 5. Access the Application

- **Web Dashboard**: http://localhost:3000
- **API Documentation**: http://localhost:8000/docs
- **Bot Status**: Check your Discord server

---

## 📚 Documentation

### 📋 Project Documentation
- [📋 Requirements Specification](docs/REQUIREMENTS.md) - Functional and non-functional requirements
- [🏗️ System Architecture](docs/ARCHITECTURE.md) - Detailed system architecture and components
- [🛠️ Technical Specification](docs/TECHNICAL_SPECIFICATION.md) - Technical details and specifications

### 🔧 Development Guides
- [🚀 Development Setup](docs/DEVELOPMENT_SETUP.md) - Detailed development environment setup
- [📦 Deployment Guide](docs/DEPLOYMENT.md) - Production deployment instructions
- [🧪 Testing Guide](docs/TESTING.md) - Testing strategies and guidelines
- [🔒 Security Guide](docs/SECURITY.md) - Security best practices and implementation

### 📖 API Documentation
- [🌐 REST API Reference](docs/API_REFERENCE.md) - Complete API endpoint documentation
- [🔌 WebSocket Events](docs/WEBSOCKET_EVENTS.md) - Real-time event documentation
- [🔑 Authentication](docs/AUTHENTICATION.md) - Authentication and authorization guide

---

## 🏗️ Architecture

### System Overview

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Discord Bot   │    │   Web Dashboard │    │   Admin Panel   │
│   (Python)      │    │   (Next.js)     │    │   (React)       │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         └───────────────────────┼───────────────────────┘
                                 │
                    ┌─────────────────┐
                    │   API Gateway   │
                    │   (FastAPI)     │
                    └─────────────────┘
                                 │
                ┌────────────────┼────────────────┐
                │                │                │
    ┌─────────────────┐ ┌─────────────────┐ ┌─────────────────┐
    │   PostgreSQL    │ │     Redis       │ │   Gemini AI     │
    │   (Primary DB)  │ │   (Cache/Queue) │ │   (AI Service)  │
    └─────────────────┘ └─────────────────┘ └─────────────────┘
```

### Technology Stack

**Backend:**
- **Discord Bot**: Python 3.12 + discord.py 2.4+
- **Web API**: FastAPI 0.104+ with async/await
- **Database**: PostgreSQL 15 + Redis 7
- **AI**: Google Gemini AI

**Frontend:**
- **Framework**: Next.js 14 (App Router)
- **UI**: Tailwind CSS + Shadcn/UI
- **State**: Zustand + TanStack Query
- **Real-time**: WebSocket integration

**DevOps:**
- **Containerization**: Docker + Docker Compose
- **Database**: PostgreSQL with migrations
- **Caching**: Redis for performance
- **Monitoring**: Structured logging

---

## 🛠️ Development

### Project Structure

```
tatiana-bot-2.0/
├── bot/                    # Discord bot service
│   ├── cogs/              # Command modules
│   ├── services/          # Business logic
│   ├── models/            # Data models
│   └── utils/             # Helper functions
├── api/                   # FastAPI web service
│   ├── routers/           # API routes
│   ├── services/          # Business logic
│   ├── models/            # Pydantic models
│   └── middleware/        # Custom middleware
├── dashboard/             # Next.js web dashboard
│   ├── src/app/           # App Router pages
│   ├── src/components/    # React components
│   ├── src/hooks/         # Custom hooks
│   └── src/services/      # API services
├── docs/                  # Documentation
├── docker/                # Docker configurations
├── database/              # Database migrations
└── scripts/               # Utility scripts
```

### Development Principles

- **Modular Design**: Keep files small (100-200 lines max)
- **Single Responsibility**: One function per file/class
- **Type Safety**: TypeScript for frontend, type hints for Python
- **Error Handling**: Comprehensive error handling throughout
- **Testing**: Unit tests, integration tests, E2E tests
- **Documentation**: Code comments in English, docs in English/Spanish

### Code Quality

- **Linting**: ESLint (TypeScript), Black (Python)
- **Formatting**: Prettier (TypeScript), Black (Python)
- **Pre-commit Hooks**: Automated code quality checks
- **Type Checking**: mypy (Python), TypeScript strict mode

---

## 🧪 Testing

### Running Tests

```bash
# Backend tests
cd bot && python -m pytest
cd api && python -m pytest

# Frontend tests
cd dashboard && npm test
# or
cd dashboard && pnpm test

# E2E tests
cd dashboard && npm run test:e2e
# or
cd dashboard && pnpm test:e2e
```

### Test Coverage

- **Backend**: >80% coverage for critical components
- **Frontend**: >70% coverage for components and hooks
- **Integration**: API endpoint testing
- **E2E**: Critical user journeys

---

## 📊 Performance

### Targets

- **Bot Response Time**: <200ms (95th percentile)
- **AI Response Time**: <3 seconds (95th percentile)
- **Dashboard Load Time**: <2 seconds (95th percentile)
- **API Response Time**: <100ms (95th percentile)

### Optimization

- **Database**: Connection pooling, optimized queries
- **Caching**: Redis for frequently accessed data
- **Frontend**: Code splitting, lazy loading, optimized bundles
- **CDN**: Static asset delivery optimization

---

## 🔒 Security

### Implementation

- **Authentication**: Discord OAuth2 + JWT tokens
- **Authorization**: Role-based access control (RBAC)
- **Data Protection**: Encryption at rest and in transit
- **Input Validation**: Comprehensive input sanitization
- **Rate Limiting**: API and bot command rate limiting

### Best Practices

- **Environment Variables**: Sensitive data in env vars
- **Secret Management**: Secure secret storage
- **HTTPS**: All external communications encrypted
- **Audit Logging**: Security event logging

---

## 🚀 Deployment

### Production Deployment

```bash
# Production with Docker Compose
docker-compose -f docker-compose.prod.yml up -d

# Manual deployment
./scripts/deploy.sh production
```

### Environment Configuration

- **Development**: Local development with hot reload
- **Staging**: Pre-production testing environment
- **Production**: High-availability production setup

---

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md) for details.

### Development Workflow

1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/amazing-feature`)
3. **Commit** your changes (`git commit -m 'feat: add amazing feature'`)
4. **Push** to the branch (`git push origin feature/amazing-feature`)
5. **Open** a Pull Request

### Commit Convention

We follow [Conventional Commits](https://www.conventionalcommits.org/):

```bash
feat(bot): add new economy command
fix(api): resolve authentication issue
docs: update README with setup instructions
style: format code with prettier
refactor(dashboard): restructure components
test: add unit tests for auth service
chore: update dependencies
```

---

## 📞 Support

### Community

- **Discord Server**: [Join our community](https://discord.gg/your-server)
- **GitHub Issues**: [Report bugs or request features](https://github.com/yourusername/tatiana-bot-2.0/issues)
- **Documentation**: [Read our docs](https://tatiana-bot-docs.com)

### Contact

- **Email**: support@tatiana-bot.com
- **Discord**: @YourUsername#1234
- **Twitter**: [@TatianaBot](https://twitter.com/tatianabot)

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- **Discord.py Community**: For the amazing Discord library
- **FastAPI Team**: For the incredible web framework
- **Next.js Team**: For the powerful React framework
- **Google**: For the Gemini AI API
- **All Contributors**: Who make this project possible

---

<div align="center">

**Made with ❤️ by the Tatiana Bot Team**

⭐ **Star us on GitHub** — it helps!

[🏠 Homepage](https://tatiana-bot.com) • [📚 Docs](https://docs.tatiana-bot.com) • [💬 Discord](https://discord.gg/tatiana)

</div> 