# 🏗️ Tatiana Bot 2.0 - System Architecture

## 🌐 Overview

Tatiana Bot 2.0 follows a modern microservices architecture with clear separation of concerns, scalability, and maintainability as core principles. The system is designed to handle high-volume Discord interactions while providing a responsive web dashboard experience.

## 🎯 Architecture Principles

### 1. **Modularity**
- Each service has a single, well-defined responsibility
- Services communicate through well-defined APIs
- Loose coupling between components
- High cohesion within components

### 2. **Scalability**
- Horizontal scaling capabilities
- Load distribution across multiple instances
- Efficient resource utilization
- Caching strategies for performance

### 3. **Reliability**
- Fault tolerance and graceful degradation
- Circuit breakers for external services
- Comprehensive error handling
- Automated recovery mechanisms

### 4. **Security**
- Zero-trust security model
- End-to-end encryption
- Role-based access control
- Regular security audits

## 🏛️ High-Level Architecture

```
                    ┌─────────────────────────────────────────────────────────┐
                    │                   Users                                 │
                    │  Discord Users  │  Web Dashboard  │  Mobile App         │
                    └─────────────────────────────────────────────────────────┘
                             │                │                 │
                    ┌─────────▼────────┐    ┌─▼──────────────┐  │
                    │   Discord API    │    │  Load Balancer │  │
                    │     Gateway      │    │    (Nginx)     │  │
                    └─────────┬────────┘    └─┬──────────────┘  │
                             │                │                 │
                    ┌─────────▼────────┐    ┌─▼──────────────┐  │
                    │   Discord Bot    │    │  Web Dashboard │  │
                    │   (Python)       │    │   (Next.js)    │◄─┘
                    └─────────┬────────┘    └─┬──────────────┘
                             │                │
                             └────────┬───────┘
                                     │
                            ┌─────────▼────────┐
                            │   API Gateway    │
                            │   (FastAPI)      │
                            └─────────┬────────┘
                                     │
                    ┌────────────────┼────────────────┐
                    │                │                │
            ┌───────▼─────────┐ ┌───▼────────┐ ┌────▼──────────┐
            │  Authentication │ │ Bot Service│ │ AI Service    │
            │    Service      │ │            │ │ (Gemini)      │
            └───────┬─────────┘ └───┬────────┘ └────┬──────────┘
                    │               │               │
                    └───────┬───────┼───────────────┘
                           │       │
                    ┌─────────▼────────┐
                    │   Data Layer     │
                    │                  │
                    │ ┌─────────────┐  │    ┌─────────────────┐
                    │ │ PostgreSQL  │  │    │     Redis       │
                    │ │ (Primary)   │  │    │ (Cache/Session) │
                    │ └─────────────┘  │    └─────────────────┘
                    └──────────────────┘
```

## 🏗️ Component Architecture

### 1. Discord Bot Service

**Technology**: Python 3.13.5 + discord.py 2.5.2  
**Responsibility**: Handle Discord interactions and bot commands

```python
# Architecture Overview
├── bot/
│   ├── __init__.py
│   ├── main.py              # Bot entry point
│   ├── config/
│   │   ├── settings.py      # Configuration management
│   │   └── logging.py       # Logging configuration
│   ├── cogs/                # Command modules (max 150 lines each)
│   │   ├── moderation.py
│   │   ├── economy.py
│   │   ├── ai_chat.py
│   │   ├── games.py
│   │   └── utils.py
│   ├── services/            # Business logic (max 200 lines each)
│   │   ├── database.py
│   │   ├── ai_service.py
│   │   ├── cache_service.py
│   │   └── external_api.py
│   ├── models/              # Data models
│   │   ├── user.py
│   │   ├── guild.py
│   │   └── economy.py
│   └── utils/               # Helper functions (max 100 lines each)
│       ├── validators.py
│       ├── formatters.py
│       └── permissions.py
```

#### Key Features:
- **Command Handlers**: Modular cog system for different functionalities
- **Event Listeners**: React to Discord events (messages, joins, leaves)
- **Database Integration**: Async database operations with connection pooling
- **AI Integration**: Context-aware conversations with Gemini AI
- **Caching**: Redis-based caching for performance optimization

#### Communication:
- **Inbound**: Discord Gateway API
- **Outbound**: FastAPI service, PostgreSQL, Redis, Gemini AI

### 2. Web API Service

**Technology**: FastAPI 0.115.14 with async/await  
**Responsibility**: REST API for web dashboard and mobile apps

```python
# Architecture Overview
├── api/
│   ├── __init__.py
│   ├── main.py              # FastAPI application
│   ├── config/
│   │   ├── settings.py
│   │   └── database.py
│   ├── routers/             # API routes (max 150 lines each)
│   │   ├── auth.py
│   │   ├── users.py
│   │   ├── guilds.py
│   │   ├── moderation.py
│   │   └── analytics.py
│   ├── services/            # Business logic (max 200 lines each)
│   │   ├── auth_service.py
│   │   ├── user_service.py
│   │   ├── guild_service.py
│   │   └── analytics_service.py
│   ├── models/              # Pydantic models
│   │   ├── requests.py
│   │   ├── responses.py
│   │   └── schemas.py
│   ├── middleware/          # Custom middleware
│   │   ├── auth.py
│   │   ├── cors.py
│   │   └── rate_limit.py
│   └── utils/               # Helper functions
│       ├── security.py
│       ├── validators.py
│       └── formatters.py
```

#### Key Features:
- **RESTful Endpoints**: CRUD operations for all resources
- **Authentication**: JWT-based auth with refresh tokens
- **Authorization**: Role-based access control (RBAC)
- **Validation**: Request/response validation with Pydantic
- **Documentation**: Auto-generated OpenAPI/Swagger docs
- **WebSocket Support**: Real-time updates for dashboard

#### API Endpoints Structure:
```
/api/v1/
├── /auth/
│   ├── POST /login          # Discord OAuth2 login
│   ├── POST /refresh        # Refresh JWT token
│   └── POST /logout         # Logout user
├── /users/
│   ├── GET /me              # Current user profile
│   ├── PUT /me              # Update user profile
│   └── GET /{id}/stats      # User statistics
├── /guilds/
│   ├── GET /                # List user guilds
│   ├── GET /{id}            # Guild details
│   ├── PUT /{id}/config     # Update guild config
│   └── GET /{id}/members    # Guild members
├── /moderation/
│   ├── GET /logs            # Moderation logs
│   ├── POST /warn           # Warn user
│   ├── POST /mute           # Mute user
│   └── POST /ban            # Ban user
└── /analytics/
    ├── GET /overview        # Bot statistics
    ├── GET /commands        # Command usage
    └── GET /activity        # User activity
```

### 3. Web Dashboard

**Technology**: Next.js 15.2 + React 19.1.0 + TypeScript 5.8.3  
**Responsibility**: User interface for bot management and analytics

```typescript
// Architecture Overview
├── dashboard/
│   ├── package.json
│   ├── next.config.js
│   ├── tailwind.config.js
│   ├── tsconfig.json
│   ├── src/
│   │   ├── app/              # Next.js App Router (max 100 lines each)
│   │   │   ├── layout.tsx
│   │   │   ├── page.tsx
│   │   │   ├── auth/
│   │   │   ├── dashboard/
│   │   │   ├── guilds/
│   │   │   └── users/
│   │   ├── components/       # Reusable components (max 150 lines each)
│   │   │   ├── ui/          # Basic UI components
│   │   │   ├── forms/       # Form components
│   │   │   ├── charts/      # Chart components
│   │   │   └── layout/      # Layout components
│   │   ├── hooks/           # Custom hooks (max 100 lines each)
│   │   │   ├── useAuth.ts
│   │   │   ├── useApi.ts
│   │   │   └── useWebSocket.ts
│   │   ├── services/        # API services (max 150 lines each)
│   │   │   ├── api.ts
│   │   │   ├── auth.ts
│   │   │   └── websocket.ts
│   │   ├── stores/          # State management (max 100 lines each)
│   │   │   ├── authStore.ts
│   │   │   ├── guildsStore.ts
│   │   │   └── uiStore.ts
│   │   ├── types/           # TypeScript definitions
│   │   │   ├── api.ts
│   │   │   ├── auth.ts
│   │   │   └── ui.ts
│   │   └── utils/           # Helper functions (max 80 lines each)
│   │       ├── formatters.ts
│   │       ├── validators.ts
│   │       └── constants.ts
│   └── public/              # Static assets
```

#### Key Features:
- **Server-Side Rendering**: Fast page loads with Next.js
- **Responsive Design**: Mobile-first approach with Tailwind CSS
- **Real-time Updates**: WebSocket integration for live data
- **Component Library**: Consistent UI with Shadcn/UI
- **State Management**: Zustand for global state
- **Data Fetching**: TanStack Query for server state

#### Dashboard Pages:
1. **Overview**: Bot statistics, recent activity, quick actions
2. **Guilds**: Server management, configuration, member list
3. **Users**: User profiles, economy, moderation history
4. **Moderation**: Logs, quick actions, AutoMod config
5. **Analytics**: Usage charts, performance metrics
6. **AI**: Conversation history, prompt management

### 4. Authentication Service

**Technology**: FastAPI + JWT + OAuth2  
**Responsibility**: User authentication and authorization

```python
# Component Structure
├── auth/
│   ├── oauth2.py           # Discord OAuth2 integration
│   ├── jwt_manager.py      # JWT token management
│   ├── permissions.py      # Role-based access control
│   └── middleware.py       # Authentication middleware
```

#### Features:
- **Discord OAuth2**: Seamless login with Discord
- **JWT Tokens**: Short-lived access tokens (15 min)
- **Refresh Tokens**: Long-lived tokens for token renewal
- **RBAC**: Role-based permissions system
- **Session Management**: Secure session handling

### 5. Database Layer

**Technology**: PostgreSQL 17 + Redis 8  
**Responsibility**: Data persistence and caching

#### PostgreSQL Schema:
```sql
-- Core Tables
users (id, discord_id, username, avatar_url, created_at, updated_at)
guilds (id, discord_id, name, owner_id, prefix, language, config)
user_guild_data (user_id, guild_id, balance, level, experience)

-- Moderation
moderation_logs (id, guild_id, user_id, moderator_id, action, reason, duration)
automod_rules (id, guild_id, rule_type, config, is_active)

-- AI & Analytics
ai_conversations (id, user_id, guild_id, message, response, tokens_used)
command_usage (id, command_name, user_id, guild_id, timestamp)
user_activity (id, user_id, guild_id, activity_type, timestamp)

-- Economy & Games
user_economy (user_id, guild_id, balance, daily_streak, last_daily)
user_inventory (id, user_id, item_type, item_id, quantity)
```

#### Redis Schema:
```redis
# Session Management
session:{user_id} -> {session_data}
refresh_token:{token_id} -> {user_id}

# Caching
cache:guild:{guild_id} -> {guild_data}
cache:user:{user_id} -> {user_data}

# Rate Limiting
rate_limit:{user_id}:{command} -> {count}

# Temporary Data
temp:verification:{user_id} -> {verification_data}
```

## 🔄 Data Flow

### 1. Discord Bot Interaction Flow
```
User sends command in Discord
         ↓
Discord Gateway receives message
         ↓
Bot processes command in appropriate cog
         ↓
Bot validates permissions and rate limits
         ↓
Bot executes business logic (database/AI)
         ↓
Bot sends response to Discord
         ↓
Bot logs interaction for analytics
```

### 2. Web Dashboard Flow
```
User accesses dashboard
         ↓
Next.js serves initial page (SSR)
         ↓
Client authenticates with Discord OAuth2
         ↓
FastAPI validates token and returns user data
         ↓
Dashboard fetches additional data via API
         ↓
WebSocket connection established for real-time updates
         ↓
User interacts with interface
         ↓
API calls update database
         ↓
Changes broadcast via WebSocket to other clients
```

### 3. AI Integration Flow
```
User sends message to bot
         ↓
Bot checks if AI response is needed
         ↓
Bot retrieves conversation context from database
         ↓
Bot sends request to Gemini AI with context
         ↓
AI generates response
         ↓
Bot validates and filters response
         ↓
Bot stores conversation in database
         ↓
Bot sends response to Discord
         ↓
Usage metrics updated in analytics
```

## 🛡️ Security Architecture

### 1. Authentication & Authorization
- **OAuth2 Flow**: Discord OAuth2 for user authentication
- **JWT Tokens**: Short-lived access tokens with refresh mechanism
- **RBAC**: Role-based access control for fine-grained permissions
- **Session Management**: Secure session handling with Redis

### 2. Network Security
- **HTTPS**: All external communications encrypted
- **CORS**: Proper CORS configuration for web dashboard
- **Rate Limiting**: Prevent abuse with rate limiting middleware
- **Input Validation**: All inputs validated and sanitized

### 3. Data Security
- **Encryption at Rest**: Sensitive data encrypted in database
- **Connection Security**: Encrypted database connections
- **Secrets Management**: Environment variables for sensitive data
- **Audit Logging**: All security-relevant actions logged

## 📊 Performance Considerations

### 1. Caching Strategy
- **Redis Cache**: Frequently accessed data cached
- **CDN**: Static assets served from CDN
- **Database Query Optimization**: Indexed queries and connection pooling
- **API Response Caching**: Cache API responses where appropriate

### 2. Scalability Design
- **Horizontal Scaling**: Services can be scaled independently
- **Load Balancing**: Traffic distributed across multiple instances
- **Database Sharding**: Support for database sharding if needed
- **Connection Pooling**: Efficient database connection management

### 3. Monitoring & Observability
- **Structured Logging**: JSON-formatted logs for easy parsing
- **Metrics Collection**: Performance metrics tracked
- **Health Checks**: Endpoint health monitoring
- **Error Tracking**: Centralized error tracking and alerting

## 🔧 Development & Deployment

### 1. Development Environment
```bash
# Docker Compose for local development
docker-compose -f docker-compose.dev.yml up -d
```

### 2. Production Deployment
```bash
# Docker Compose for production
docker-compose -f docker-compose.prod.yml up -d
```

### 3. CI/CD Pipeline
- **Code Quality**: Linting, formatting, and security scanning
- **Testing**: Unit, integration, and E2E tests
- **Build**: Docker image building and optimization
- **Deployment**: Automated deployment with rollback capabilities

---

**Document Version**: 1.0  
**Last Updated**: January 2025  
**Architect**: Technical Lead  
**Review Status**: Pending 