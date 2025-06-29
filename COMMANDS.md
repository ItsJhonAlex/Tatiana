# 🛠️ Tatiana Bot 2.0 - Development Commands Reference

## 🚀 Quick Start

```bash
# Initial setup
./scripts/setup.sh

# Start all services with Docker
docker-compose up -d

# View logs
docker-compose logs -f
```

## 📦 Dependencies

### Python
```bash
# Install UV package manager (if not installed)
curl -LsSf https://astral.sh/uv/install.sh | sh

# Bot dependencies
cd bot && uv venv && source .venv/bin/activate && uv pip install -r requirements.txt

# API dependencies  
cd api && uv venv && source .venv/bin/activate && uv pip install -r requirements.txt
```

### Node.js
```bash
# Dashboard dependencies (preferred)
cd dashboard && pnpm install

# Note: Use Node.js 22 LTS for best compatibility
```

## 🐳 Docker Operations

```bash
# Start services
docker-compose up -d

# View logs
docker-compose logs -f [service-name]

# Restart service
docker-compose restart [service-name]

# Stop services
docker-compose down

# Clean rebuild
docker-compose down -v && docker-compose build && docker-compose up -d
```

## 🗄️ Database

```bash
# Connect to PostgreSQL
docker exec -it tatiana-postgres psql -U tatiana_user -d tatiana_db

# Connect to Redis
docker exec -it tatiana-redis redis-cli

# Database migrations
cd bot && alembic upgrade head
```

## 🧪 Testing

```bash
# Python tests (activate venv first)
source .venv/bin/activate && python -m pytest

# Node.js tests
cd dashboard && pnpm test

# E2E tests
cd dashboard && pnpm test:e2e
```

## 🔧 Development

### Bot
```bash
cd bot
source .venv/bin/activate
python main.py
```

### API
```bash
cd api
source .venv/bin/activate
uvicorn main:app --reload
```

### Dashboard
```bash
cd dashboard
pnpm dev
```

## 📊 Health Checks

```bash
# API health
curl http://localhost:8000/health

# Database connection
docker exec tatiana-postgres pg_isready -U tatiana_user

# Redis connection
docker exec tatiana-redis redis-cli ping
``` 