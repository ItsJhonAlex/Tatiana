# 🤖 Tatiana Bot 2.0 - Technical Specification

## 📋 Project Overview

Tatiana Bot 2.0 is a next-generation Discord bot featuring AI-powered conversations, advanced moderation, gamification systems, and a comprehensive web dashboard for administration and user management.

## 🏗️ Architecture Overview

### High-Level Architecture
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

### Microservices Architecture
- **Discord Bot Service**: Handles Discord interactions
- **Web API Service**: REST API for dashboard and mobile apps
- **Authentication Service**: JWT-based auth for web dashboard
- **AI Service**: Gemini AI integration and prompt management
- **Database Service**: Data persistence and caching
- **File Service**: Asset management and CDN

## 🛠️ Technology Stack

### Backend Services
- **Discord Bot**: Python 3.13.5 with discord.py 2.5.2
- **Web API**: FastAPI 0.115.14 (async/await support)
- **Authentication**: JWT tokens with refresh mechanism
- **Task Queue**: Celery with Redis broker
- **WebSocket**: For real-time dashboard updates

### Frontend
- **Framework**: Next.js 15.2 (App Router)
- **UI Library**: Tailwind CSS + Shadcn/UI components
- **State Management**: Zustand for global state
- **API Client**: TanStack Query (React Query) for data fetching
- **Real-time**: WebSocket client for live updates
- **Charts**: Recharts for analytics visualization
- **React**: React 19.1.0 with latest features
- **TypeScript**: TypeScript 5.8.3 for type safety

### Database & Cache
- **Primary Database**: PostgreSQL 17 with asyncpg
- **Cache Layer**: Redis 8 for sessions and temporary data
- **ORM**: SQLAlchemy 2.0+ with Alembic migrations
- **Connection Pooling**: asyncpg connection pools

### AI & External Services
- **AI Provider**: Google Gemini AI (gemini-pro model)
- **Image Processing**: Pillow for image manipulation
- **File Storage**: AWS S3 or local storage with CDN
- **Monitoring**: Prometheus + Grafana (optional)

### DevOps & Deployment
- **Containerization**: Docker with multi-stage builds
- **Orchestration**: Docker Compose for development
- **Process Management**: Supervisor or systemd
- **Reverse Proxy**: Nginx for production
- **SSL**: Let's Encrypt certificates

## 📊 Database Schema

### Core Tables
```sql
-- Users table
CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,
    discord_id BIGINT UNIQUE NOT NULL,
    username VARCHAR(32) NOT NULL,
    discriminator VARCHAR(4),
    avatar_url TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE
);

-- Guilds table
CREATE TABLE guilds (
    id BIGSERIAL PRIMARY KEY,
    discord_id BIGINT UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    owner_id BIGINT REFERENCES users(discord_id),
    prefix VARCHAR(10) DEFAULT '!',
    language VARCHAR(5) DEFAULT 'es',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE
);

-- Economy system
CREATE TABLE user_economy (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT REFERENCES users(discord_id),
    guild_id BIGINT REFERENCES guilds(discord_id),
    balance BIGINT DEFAULT 0,
    daily_streak INTEGER DEFAULT 0,
    last_daily TIMESTAMP,
    total_earned BIGINT DEFAULT 0,
    total_spent BIGINT DEFAULT 0,
    UNIQUE(user_id, guild_id)
);

-- Moderation logs
CREATE TABLE moderation_logs (
    id BIGSERIAL PRIMARY KEY,
    guild_id BIGINT REFERENCES guilds(discord_id),
    user_id BIGINT REFERENCES users(discord_id),
    moderator_id BIGINT REFERENCES users(discord_id),
    action VARCHAR(20) NOT NULL,
    reason TEXT,
    duration INTEGER, -- For temporary actions (minutes)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE
);

-- AI Conversations
CREATE TABLE ai_conversations (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT REFERENCES users(discord_id),
    guild_id BIGINT REFERENCES guilds(discord_id),
    message_id BIGINT NOT NULL,
    user_message TEXT NOT NULL,
    ai_response TEXT NOT NULL,
    tokens_used INTEGER,
    response_time REAL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

## 🔧 API Endpoints

### Authentication
- `POST /api/auth/login` - Discord OAuth2 login
- `POST /api/auth/refresh` - Refresh JWT token
- `POST /api/auth/logout` - Logout and invalidate token

### Bot Management
- `GET /api/bot/status` - Bot status and statistics
- `GET /api/bot/guilds` - List bot guilds
- `POST /api/bot/restart` - Restart bot (admin only)

### Guild Management
- `GET /api/guilds` - List user's guilds
- `GET /api/guilds/{guild_id}` - Guild details
- `PUT /api/guilds/{guild_id}/config` - Update guild configuration
- `GET /api/guilds/{guild_id}/members` - Guild members
- `GET /api/guilds/{guild_id}/channels` - Guild channels

### User Management
- `GET /api/users/me` - Current user profile
- `PUT /api/users/me` - Update user profile
- `GET /api/users/{user_id}/economy` - User economy stats
- `GET /api/users/{user_id}/inventory` - User inventory

### Moderation
- `GET /api/moderation/logs` - Moderation logs
- `POST /api/moderation/warn` - Warn user
- `POST /api/moderation/mute` - Mute user
- `POST /api/moderation/ban` - Ban user

### Analytics
- `GET /api/analytics/overview` - Bot usage overview
- `GET /api/analytics/commands` - Command usage statistics
- `GET /api/analytics/users` - User activity statistics

## 🎨 Frontend Features

### Dashboard Pages
1. **Overview Dashboard**
   - Bot status and uptime
   - Server count and user count
   - Recent activity feed
   - Quick actions panel

2. **Server Management**
   - Server list with search/filter
   - Server configuration panel
   - Channel and role management
   - Member management

3. **Moderation Panel**
   - Moderation logs viewer
   - Quick moderation actions
   - AutoMod configuration
   - Reports and appeals

4. **User Profiles**
   - User statistics and achievements
   - Economy and inventory
   - Command usage history
   - Preferences and settings

5. **Analytics**
   - Interactive charts and graphs
   - Command usage analytics
   - User engagement metrics
   - Server growth statistics

6. **AI Management**
   - Conversation history
   - AI response configuration
   - Token usage monitoring
   - Custom prompts management

### Real-time Features
- Live bot status updates
- Real-time moderation alerts
- Live chat integration (optional)
- Server member activity feed

## 🔒 Security Considerations

### Authentication & Authorization
- JWT tokens with short expiration (15 minutes)
- Refresh tokens with rotation
- Role-based access control (RBAC)
- Discord OAuth2 integration
- Rate limiting on all endpoints

### Data Protection
- Password hashing with bcrypt
- SQL injection prevention with parameterized queries
- Input validation and sanitization
- CORS configuration for frontend
- HTTPS enforcement in production

### Bot Security
- Token rotation capabilities
- Permission validation
- Command cooldowns
- Spam protection
- Malicious content detection

## 🚀 Deployment Strategy

### Development Environment
```bash
# Docker Compose setup
docker-compose -f docker-compose.dev.yml up -d
```

### Production Environment
```bash
# Docker Compose with production configs
docker-compose -f docker-compose.prod.yml up -d
```

### Environment Variables
```env
# Bot Configuration
DISCORD_TOKEN=your_discord_bot_token
GEMINI_API_KEY=your_gemini_api_key
BOT_PREFIX=!

# Database
DATABASE_URL=postgresql://user:pass@localhost:5432/tatiana
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
JWT_EXPIRATION=900  # 15 minutes

# External Services
AWS_ACCESS_KEY_ID=your_aws_key
AWS_SECRET_ACCESS_KEY=your_aws_secret
AWS_S3_BUCKET=your_s3_bucket
```

## 📈 Performance Targets

### Bot Performance
- Command response time: < 200ms
- AI response time: < 3 seconds
- Memory usage: < 512MB
- CPU usage: < 10% average

### Web Dashboard
- Page load time: < 2 seconds
- API response time: < 100ms
- Bundle size: < 1MB gzipped
- Lighthouse score: > 90

### Database
- Query response time: < 50ms
- Connection pool: 10-20 connections
- Cache hit ratio: > 90%
- Backup frequency: Daily

## 🧪 Testing Strategy

### Backend Testing
- Unit tests with pytest
- Integration tests for API endpoints
- Database tests with test containers
- Mocking external services (Discord API, Gemini AI)

### Frontend Testing
- Unit tests with Jest and React Testing Library
- E2E tests with Playwright
- Component testing with Storybook
- Visual regression testing

### Load Testing
- API load testing with Artillery
- Database performance testing
- WebSocket connection testing
- Discord bot stress testing

## 📝 Development Phases

### Phase 1: Core Infrastructure (Weeks 1-2)
- Project setup and configuration
- Database schema and migrations
- Basic Discord bot structure
- Authentication system

### Phase 2: Bot Features (Weeks 3-4)
- Core bot commands
- AI integration
- Economy system
- Moderation features

### Phase 3: Web Dashboard (Weeks 5-6)
- Frontend setup and design system
- Dashboard pages and components
- API integration
- Real-time features

### Phase 4: Advanced Features (Weeks 7-8)
- Analytics and reporting
- Advanced moderation
- User management
- Performance optimization

### Phase 5: Testing & Deployment (Weeks 9-10)
- Comprehensive testing
- Documentation
- Production deployment
- Monitoring setup

## 🔄 Maintenance & Updates

### Automated Tasks
- Daily database backups
- Weekly dependency updates
- Monthly security audits
- Quarterly performance reviews

### Monitoring
- Application logs with structured logging
- Error tracking with Sentry (optional)
- Performance metrics with APM tools
- Health checks and alerts

---

**Documentation Version**: 1.0  
**Last Updated**: January 2025  
**Next Review**: February 2025 