# 🤝 Contributing Guide - Tatiana Bot 2.0

Thank you for your interest in contributing to Tatiana Bot 2.0! This guide will help you make effective and valuable contributions to the project.

## 📋 Table of Contents

- [🎯 Ways to Contribute](#-ways-to-contribute)
- [🚀 Development Environment Setup](#-development-environment-setup)
- [💻 Development Process](#-development-process)
- [📝 Code Standards](#-code-standards)
- [🧪 Testing](#-testing)
- [📚 Documentation](#-documentation)
- [🐛 Reporting Bugs](#-reporting-bugs)
- [✨ Requesting Features](#-requesting-features)
- [🔄 Pull Requests](#-pull-requests)
- [🏆 Recognition](#-recognition)

---

## 🎯 Ways to Contribute

### 💻 Code Development
- **Implement new features**
- **Fix bugs and issues**
- **Improve performance**
- **Optimize existing code**
- **Add unit/integration tests**

### 📝 Documentation
- **Improve existing documentation**
- **Create new guides and tutorials**
- **Translate documentation**
- **Update code examples**
- **Create video or educational content**

### 🐛 Testing and QA
- **Report bugs with details**
- **Create comprehensive test cases**
- **Perform manual feature testing**
- **Verify cross-platform compatibility**
- **Performance testing**

### 🎨 Design and UX
- **Improve dashboard interface**
- **Create graphic assets**
- **Optimize user experience**
- **Design new UI components**
- **Improve accessibility**

### 🌍 Community
- **Help in Discord/GitHub Issues**
- **Create educational content**
- **Organize events/workshops**
- **Moderate community**
- **Translate content**

---

## 🚀 Development Environment Setup

### 📋 Prerequisites

```bash
# Check required versions
python3 --version    # 3.12+
node --version       # 18+
docker --version     # 20+
pnpm --version      # 8+
```

### ⚡ Quick Setup

1. **Fork and Clone Repository**
```bash
# Fork the repo on GitHub first
git clone https://github.com/YOUR_USERNAME/TatianaBot-2.0.git
cd TatianaBot-2.0

# Add upstream remote
git remote add upstream https://github.com/ItsJhonAlex/TatianaBot-2.0.git
```

2. **Environment Configuration**
```bash
# Copy environment variables
cp .env.example .env
# Edit .env with your values

# Run automated setup
chmod +x scripts/setup.sh
./scripts/setup.sh
```

3. **Initialize Services**
```bash
# Start services with Docker
docker-compose up -d

# Verify everything works
docker-compose ps
```

4. **Install Development Dependencies**
```bash
# Bot dependencies
cd bot
python -m venv venv
source venv/bin/activate  # Linux/Mac
# venv\Scripts\activate   # Windows
pip install -r requirements.txt
pip install -r requirements-dev.txt

# API dependencies
cd ../api
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
pip install -r requirements-dev.txt

# Dashboard dependencies
cd ../dashboard
pnpm install
```

### ✅ Setup Verification

```bash
# Verify bot
cd bot && source venv/bin/activate
python -m pytest tests/ -v

# Verify API
cd ../api && source venv/bin/activate
python -m pytest tests/ -v

# Verify dashboard
cd ../dashboard
pnpm test
pnpm build
```

---

## 💻 Development Process

### 🌊 Git Flow

We use simplified **GitHub Flow**:

```
main branch (production-ready)
    ↓
feature/feature-name (development)
    ↓
Pull Request → Review → Merge
```

### 📝 Branching Strategy

```bash
# Create new feature branch
git checkout main
git pull upstream main
git checkout -b feature/your-feature-name

# Work on your feature
git add .
git commit -m "feat(component): your descriptive message"

# Push and create PR
git push origin feature/your-feature-name
# Create Pull Request on GitHub
```

### 🏷️ Naming Conventions

#### Branch Names
```bash
feature/add-pokemon-trading
fix/resolve-database-connection
docs/update-api-documentation
refactor/optimize-command-system
test/add-economy-tests
chore/update-dependencies
```

#### Commit Messages
We follow **Conventional Commits**:

```bash
# Format: <type>(<scope>): <description>

# Available types:
feat     # New feature
fix      # Bug fix
docs     # Documentation
style    # Formatting, doesn't affect logic
refactor # Refactor without changing functionality
test     # Add/modify tests
chore    # Maintenance tasks
perf     # Performance improvements
ci       # Changes to CI configuration

# Examples:
feat(bot): add pokemon catch command
fix(api): resolve JWT token validation
docs(readme): update installation instructions
test(economy): add balance transfer tests
refactor(database): optimize user queries
```

### 📁 File Structure

```
Tatiana-Bot-2.0/
├── bot/                    # Discord bot service
│   ├── src/
│   │   ├── cogs/          # Command modules (max 200 lines)
│   │   ├── services/      # Business logic (max 200 lines)
│   │   ├── models/        # Data models (max 150 lines)
│   │   └── utils/         # Helper functions (max 100 lines)
│   └── tests/             # Bot tests
├── api/                   # FastAPI backend
│   ├── src/
│   │   ├── routers/       # API routes (max 150 lines)
│   │   ├── services/      # Business services (max 200 lines)
│   │   ├── models/        # Pydantic models (max 100 lines)
│   │   └── core/          # Core functionality
│   └── tests/             # API tests
├── dashboard/             # Next.js frontend
│   ├── src/
│   │   ├── app/           # App router pages (max 100 lines)
│   │   ├── components/    # React components (max 150 lines)
│   │   ├── hooks/         # Custom hooks (max 100 lines)
│   │   └── services/      # API clients (max 150 lines)
│   └── __tests__/         # Frontend tests
└── docs/                  # Documentation
```

---

## 📝 Code Standards

### 🐍 Python (Bot & API)

#### Style Guide
- **PEP 8** compliance mandatory
- **Type hints** on all functions
- **Docstrings** for public functions
- **Max line length**: 88 characters (Black default)

#### Well-Formatted Code Example
```python
from typing import Optional, List
import asyncio
from datetime import datetime

class UserService:
    """Service for managing user operations."""
    
    def __init__(self, database_url: str) -> None:
        self.database_url = database_url
    
    async def get_user_balance(
        self, 
        user_id: int, 
        guild_id: int
    ) -> Optional[int]:
        """
        Get user balance for a specific guild.
        
        Args:
            user_id: Discord user ID
            guild_id: Discord guild ID
            
        Returns:
            User balance or None if user not found
        """
        # Implementation here
        pass
    
    async def update_balance(
        self,
        user_id: int,
        guild_id: int,
        amount: int,
        reason: str = "Manual update"
    ) -> bool:
        """Update user balance with transaction logging."""
        # Implementation here
        pass
```

#### Quality Tools
```bash
# Formatting with Black
black src/ tests/

# Linting with flake8
flake8 src/ tests/

# Type checking with mypy
mypy src/

# Import sorting with isort
isort src/ tests/
```

### 🟨 TypeScript (Dashboard)

#### Style Guide
- **ESLint + Prettier** configured
- **Strict TypeScript** mode
- **Functional components** preferred
- **Custom hooks** for reusable logic

#### Component Example
```typescript
import React from 'react';
import { useQuery } from '@tanstack/react-query';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { useServerStats } from '@/hooks/useServerStats';

interface ServerStatsProps {
  serverId: string;
  refreshInterval?: number;
}

export const ServerStats: React.FC<ServerStatsProps> = ({ 
  serverId, 
  refreshInterval = 30000 
}) => {
  const { data: stats, isLoading, error } = useServerStats(
    serverId,
    { refetchInterval: refreshInterval }
  );

  if (isLoading) {
    return <div className="animate-pulse">Loading...</div>;
  }

  if (error) {
    return <div className="text-red-500">Error loading stats</div>;
  }

  return (
    <Card className="w-full">
      <CardHeader>
        <CardTitle>Server Statistics</CardTitle>
      </CardHeader>
      <CardContent>
        <div className="grid grid-cols-2 gap-4">
          <div>
            <p className="text-sm font-medium">Members</p>
            <p className="text-2xl font-bold">{stats?.memberCount}</p>
          </div>
          <div>
            <p className="text-sm font-medium">Online</p>
            <p className="text-2xl font-bold text-green-600">
              {stats?.onlineCount}
            </p>
          </div>
        </div>
      </CardContent>
    </Card>
  );
};
```

#### Quality Tools
```bash
# Linting and formatting
pnpm lint
pnpm lint:fix
pnpm format

# Type checking
pnpm type-check

# Build verification
pnpm build
```

### 📋 General Rules
- **Files maximum 200 lines** (150 for React components)
- **Functions maximum 50 lines**
- **Descriptive names** over comments
- **Single Responsibility Principle**
- **DRY (Don't Repeat Yourself)**
- **Comments in English** for code
- **Proper error handling** always

---

## 🧪 Testing

### 🎯 Testing Strategy

#### Coverage Requirements
- **Backend**: Minimum 80% coverage
- **Frontend**: Minimum 70% coverage
- **Critical paths**: 100% coverage

#### Types of Tests

```bash
# Unit Tests
pytest bot/tests/unit/
pytest api/tests/unit/
pnpm test:unit

# Integration Tests
pytest bot/tests/integration/
pytest api/tests/integration/
pnpm test:integration

# E2E Tests (Dashboard)
pnpm test:e2e
```

### 🐍 Python Testing

```python
# bot/tests/test_economy.py
import pytest
from unittest.mock import Mock, AsyncMock
from src.services.economy import EconomyService

class TestEconomyService:
    @pytest.fixture
    def economy_service(self):
        return EconomyService(database_url="sqlite:///:memory:")
    
    @pytest.mark.asyncio
    async def test_get_balance_existing_user(self, economy_service):
        # Arrange
        user_id = 123456789
        guild_id = 987654321
        expected_balance = 1000
        
        # Act
        balance = await economy_service.get_user_balance(user_id, guild_id)
        
        # Assert
        assert balance == expected_balance
    
    @pytest.mark.asyncio
    async def test_transfer_funds_insufficient_balance(self, economy_service):
        # Test should verify that you can't transfer more than you have
        with pytest.raises(ValueError, match="Insufficient balance"):
            await economy_service.transfer_funds(
                from_user=123,
                to_user=456,
                amount=9999999,
                guild_id=789
            )
```

### 🟨 Frontend Testing

```typescript
// dashboard/__tests__/components/ServerStats.test.tsx
import { render, screen } from '@testing-library/react';
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';
import { ServerStats } from '@/components/ServerStats';

const createTestQueryClient = () => new QueryClient({
  defaultOptions: {
    queries: { retry: false },
    mutations: { retry: false },
  },
});

describe('ServerStats', () => {
  it('displays loading state initially', () => {
    const queryClient = createTestQueryClient();
    
    render(
      <QueryClientProvider client={queryClient}>
        <ServerStats serverId="123" />
      </QueryClientProvider>
    );
    
    expect(screen.getByText('Loading...')).toBeInTheDocument();
  });
  
  it('displays server statistics when loaded', async () => {
    // Mock API response
    const mockStats = {
      memberCount: 1500,
      onlineCount: 342
    };
    
    // Test implementation...
  });
});
```

### 🏃‍♂️ Testing Commands

```bash
# Pre-commit testing (MANDATORY!)
# Backend
cd bot && python -m pytest tests/ -v --cov=src
cd api && python -m pytest tests/ -v --cov=src

# Frontend
cd dashboard && pnpm test

# Performance testing
cd dashboard && pnpm test:performance

# Complete testing
./scripts/test-all.sh
```

---

## 📚 Documentation

### 📝 Types of Documentation

#### 1. **Code Documentation**
- **Docstrings**: All public functions
- **Type hints**: Mandatory in Python
- **JSDoc**: For complex TS functions
- **README**: For each important module

#### 2. **API Documentation**
- **OpenAPI/Swagger**: Auto-generated for FastAPI
- **Endpoint examples**: Example requests/responses
- **Authentication flow**: How to authenticate
- **Error codes**: Complete error list

#### 3. **User Documentation**
- **Command reference**: Complete command list
- **Setup guides**: For end users
- **FAQ**: Frequently asked questions
- **Troubleshooting**: Problem resolution

### ✍️ Writing Guidelines

#### Spanish Documentation (User-facing)
```markdown
# ✨ Economy Commands

The economy system allows users to earn and spend virtual coins on your server.

## 💰 Available Commands

### `/balance [user]`
Shows current coin balance.

**Examples:**
- `/balance` - Your balance
- `/balance @user` - Another user's balance

**Required permissions:** None
**Cooldown:** 5 seconds
```

#### English Documentation (Technical)
```python
def transfer_funds(
    from_user: int, 
    to_user: int, 
    amount: int, 
    guild_id: int
) -> bool:
    """
    Transfer virtual currency between users.
    
    This function handles the complete transfer process including:
    - Balance validation
    - Transaction logging
    - Atomic operations to prevent race conditions
    
    Args:
        from_user: Source user Discord ID
        to_user: Destination user Discord ID  
        amount: Amount to transfer (must be positive)
        guild_id: Discord guild where transfer occurs
        
    Returns:
        True if transfer successful, False otherwise
        
    Raises:
        ValueError: If amount is negative or zero
        InsufficientBalanceError: If source user lacks funds
        UserNotFoundError: If either user doesn't exist
        
    Example:
        >>> success = transfer_funds(123, 456, 100, 789)
        >>> print(f"Transfer successful: {success}")
    """
```

---

## 🐛 Reporting Bugs

### 📋 Before Reporting

1. **Search existing issues** on GitHub
2. **Check documentation** to ensure it's not expected behavior
3. **Test in clean environment** (without modifications)
4. **Gather necessary information**

### 🔍 Required Information

Use our **bug report template**:

```markdown
**Bug Description**
Clear and concise description of the problem.

**Steps to Reproduce**
1. Go to '...'
2. Execute command '...'
3. Observe error

**Expected Behavior**
What you expected to happen.

**Actual Behavior**  
What actually happened.

**Screenshots/Logs**
If applicable, add screenshots and logs.

**Environment:**
 - OS: [e.g., Ubuntu 22.04]
 - Python Version: [e.g., 3.12.1]
 - Bot Version: [e.g., 2.0.1]
 - Discord.py Version: [e.g., 2.4.0]

**Additional Context**
Any other relevant information.
```

---

## ✨ Requesting Features

### 💡 Feature Request Process

1. **Open Discussion** on GitHub first
2. **Explain use case** in detail  
3. **Propose implementation** if you have ideas
4. **Wait for feedback** from community
5. **Create Issue** if there's consensus

### 📝 Feature Request Template

```markdown
**Is your feature request related to a problem?**
Clear description of the problem: "I'm frustrated when..."

**Describe the solution you'd like**
Clear and concise description of what you want to happen.

**Describe alternatives you've considered**
Description of alternative solutions or features.

**Mockups/Examples**
If you have them, add mockups or examples from other bots.

**Additional context**
Any other context or screenshots about the feature request.
```

---

## 🔄 Pull Requests

### 📋 Pre-PR Checklist

- [ ] **Branch updated** with latest main
- [ ] **Tests passing** locally
- [ ] **Clean linting** (no warnings)
- [ ] **Documentation updated** if necessary
- [ ] **CHANGELOG updated** if important feature/fix
- [ ] **Descriptive commits** following conventional commits

### 🚀 PR Process

1. **Create PR** with complete template
2. **Assign reviewers** appropriately
3. **Respond to feedback** constructively
4. **Make requested changes**
5. **Wait for approval** from maintainers

### 📝 PR Template

```markdown
## 📋 Description
Brief description of changes.

## 🔗 Related Issue
Fixes #(issue number)

## 🧪 Type of Change
- [ ] Bug fix (non-breaking change)
- [ ] New feature (non-breaking change)
- [ ] Breaking change (affects existing functionality)
- [ ] Documentation

## ✅ Testing
- [ ] Existing tests pass
- [ ] Added new tests
- [ ] Tested manually

## 📝 Checklist
- [ ] My code follows style guide
- [ ] I did self-review of my code
- [ ] I commented complex code
- [ ] I updated documentation
- [ ] My changes generate no warnings
- [ ] I added tests that prove my fix/feature
- [ ] New and existing tests pass

## 📸 Screenshots (if applicable)
Add screenshots for visual changes.
```

### 🔍 Review Process

#### For Reviewers
- **Review within max 48 hours**
- **Constructive and specific feedback**
- **Suggest improvements, not just criticize**
- **Approve if meets standards**
- **Request changes if needs work**

#### For Submitters
- **Respond to comments within max 72 hours**
- **Make requested changes**
- **Explain reasoning if you disagree**
- **Maintain professionalism always**

---

## 🏆 Recognition

### 🌟 Recognition System

#### GitHub
- **Contributor credits** in releases
- **Hall of Fame** in README
- **Special mentions** for exceptional contributions

#### Discord
- **Contributor role** special
- **Early access** to new features
- **Direct line** with maintainers

#### Code
- **Author attribution** in significant code
- **Shoutouts** in commit messages
- **Documentation credits**

### 🎯 Contribution Levels

#### 🥉 **Contributor**
- First merged contribution
- GitHub badge
- Discord contributor role

#### 🥈 **Active Contributor**  
- 5+ merged PRs
- Help in community
- Mention in quarterly updates

#### 🥇 **Core Contributor**
- 25+ merged PRs
- Significant features implemented
- Mentoring new contributors
- Special Discord perks

#### 💎 **Maintainer**
- Trusted with review permissions
- Architecture decision input
- Direct commit access (selected areas)
- Listed as project maintainer

---

## 📞 Support and Help

### 💬 Communication Channels

#### GitHub
- **Issues**: For bugs and features
- **Discussions**: For ideas and help
- **PRs**: For code reviews

#### Discord
- **Development Channel**: Real-time chat
- **Help Channel**: Technical help
- **Showcase Channel**: Show your work

#### Email
- **Maintainers**: [maintainers@tatiana-bot.com](mailto:maintainers@tatiana-bot.com)
- **Security**: [security@tatiana-bot.com](mailto:security@tatiana-bot.com)

### 🕐 Response Times

- **Critical issues**: 24 hours
- **Bug reports**: 48 hours  
- **Feature requests**: 1 week
- **PRs**: 48 hours for first review
- **Questions**: 72 hours

### 📚 Learning Resources

#### For Discord.py Newcomers
- **[Discord.py Documentation](https://discordpy.readthedocs.io/)**
- **[Real Python Discord Bot Tutorial](https://realpython.com/how-to-make-a-discord-bot-python/)**
- **[Our Internal Tutorial](docs/LEARNING_RESOURCES.md)**

#### For React/Next.js
- **[Next.js Documentation](https://nextjs.org/docs)**
- **[React Query Guide](https://tanstack.com/query/latest)**
- **[Tailwind CSS Docs](https://tailwindcss.com/docs)**

#### For FastAPI
- **[FastAPI Documentation](https://fastapi.tiangolo.com/)**
- **[SQLAlchemy Tutorial](https://docs.sqlalchemy.org/en/20/tutorial/)**

---

## 🙏 Acknowledgments

Thank you for considering contributing to Tatiana Bot 2.0! Your time and effort help make this project better for the entire Discord community.

### 💖 Special Contributors

Special thanks to everyone who has contributed to the project:

- **[@ItsJhonAlex](https://github.com/ItsJhonAlex)** - Creator & Lead Maintainer
- **[Automatically updated contributor list]**

### 🌟 Inspiration

This project is inspired by the open source community and the belief that together we can create amazing tools that benefit millions of Discord users.

---

**Have questions?** Don't hesitate to open a Discussion on GitHub or join our Discord!

**Happy coding!** 🚀✨

---

**Version**: 1.0  
**Last Updated**: January 2025  
**Next Review**: April 2025 