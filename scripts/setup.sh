#!/bin/bash

# 🤖 Tatiana Bot 2.0 - Development Environment Setup Script
# This script helps you set up the development environment quickly

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Logging functions
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

log_header() {
    echo -e "${PURPLE}================================${NC}"
    echo -e "${PURPLE}$1${NC}"
    echo -e "${PURPLE}================================${NC}"
}

# Check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Main setup function
main() {
    log_header "🚀 Tatiana Bot 2.0 Setup"
    
    # Check prerequisites
    check_prerequisites
    
    # Setup environment
    setup_environment
    
    # Create directory structure
    create_directories
    
    # Setup Python virtual environment
    setup_python_env
    
    # Setup Node.js environment
    setup_node_env
    
    # Setup Docker environment
    setup_docker_env
    
    # Final instructions
    show_final_instructions
    
    log_success "Setup completed successfully! 🎉"
}

# Check prerequisites
check_prerequisites() {
    log_header "🔍 Checking Prerequisites"
    
    local missing_deps=()
    
    # Check Python
    if command_exists python3; then
        local python_version=$(python3 --version | cut -d' ' -f2)
        log_success "Python $python_version found"
    else
        log_error "Python 3.12+ is required"
        missing_deps+=("python3")
    fi
    
    # Check Node.js
    if command_exists node; then
        local node_version=$(node --version)
        log_success "Node.js $node_version found"
    else
        log_error "Node.js 18+ is required"
        missing_deps+=("nodejs")
    fi
    
    # Check Docker
    if command_exists docker; then
        local docker_version=$(docker --version | cut -d' ' -f3 | cut -d',' -f1)
        log_success "Docker $docker_version found"
    else
        log_warning "Docker not found - Docker Compose setup will be skipped"
    fi
    
    # Check Docker Compose
    if command_exists docker-compose; then
        local compose_version=$(docker-compose --version | cut -d' ' -f3 | cut -d',' -f1)
        log_success "Docker Compose $compose_version found"
    else
        log_warning "Docker Compose not found - Docker setup will be skipped"
    fi
    
    # Check Git
    if command_exists git; then
        log_success "Git found"
    else
        log_error "Git is required"
        missing_deps+=("git")
    fi
    
    # Check package managers
    if command_exists pnpm; then
        log_success "pnpm found (preferred)"
    elif command_exists npm; then
        log_success "npm found"
    else
        log_error "npm or pnpm is required"
        missing_deps+=("npm")
    fi
    
    if [ ${#missing_deps[@]} -ne 0 ]; then
        log_error "Missing dependencies: ${missing_deps[*]}"
        log_info "Please install the missing dependencies and run this script again"
        exit 1
    fi
}

# Setup environment
setup_environment() {
    log_header "⚙️ Setting up Environment"
    
    if [ ! -f .env ]; then
        log_info "Creating .env file from template..."
        cp .env.example .env
        log_success ".env file created"
        log_warning "Please edit .env file with your actual configuration values"
    else
        log_info ".env file already exists"
    fi
}

# Create directory structure
create_directories() {
    log_header "📁 Creating Directory Structure"
    
    local directories=(
        "logs"
        "uploads"
        "database/migrations"
        "database/seeds"
        "database/init"
        "scripts"
        "nginx"
        "docker"
    )
    
    for dir in "${directories[@]}"; do
        if [ ! -d "$dir" ]; then
            mkdir -p "$dir"
            log_success "Created directory: $dir"
        else
            log_info "Directory already exists: $dir"
        fi
    done
}

# Setup Python virtual environment
setup_python_env() {
    log_header "🐍 Setting up Python Environment"
    
    # Bot environment
    if [ ! -d "bot/venv" ]; then
        log_info "Creating Python virtual environment for bot..."
        cd bot
        python3 -m venv venv
        source venv/bin/activate
        
        if [ -f "requirements.txt" ]; then
            log_info "Installing bot dependencies..."
            pip install --upgrade pip
            pip install -r requirements.txt
            log_success "Bot dependencies installed"
        else
            log_warning "bot/requirements.txt not found"
        fi
        
        deactivate
        cd ..
    else
        log_info "Bot virtual environment already exists"
    fi
    
    # API environment
    if [ ! -d "api/venv" ]; then
        log_info "Creating Python virtual environment for API..."
        cd api
        python3 -m venv venv
        source venv/bin/activate
        
        if [ -f "requirements.txt" ]; then
            log_info "Installing API dependencies..."
            pip install --upgrade pip
            pip install -r requirements.txt
            log_success "API dependencies installed"
        else
            log_warning "api/requirements.txt not found"
        fi
        
        deactivate
        cd ..
    else
        log_info "API virtual environment already exists"
    fi
}

# Setup Node.js environment
setup_node_env() {
    log_header "🟨 Setting up Node.js Environment"
    
    if [ -d "dashboard" ]; then
        cd dashboard
        
        if [ -f "package.json" ]; then
            log_info "Installing dashboard dependencies..."
            
            if command_exists pnpm; then
                pnpm install
                log_success "Dashboard dependencies installed with pnpm"
            else
                npm install
                log_success "Dashboard dependencies installed with npm"
            fi
        else
            log_warning "dashboard/package.json not found"
        fi
        
        cd ..
    else
        log_warning "Dashboard directory not found"
    fi
}

# Setup Docker environment
setup_docker_env() {
    log_header "🐳 Setting up Docker Environment"
    
    if command_exists docker && command_exists docker-compose; then
        log_info "Docker and Docker Compose are available"
        log_info "You can run 'docker-compose up -d' to start all services"
        
        # Check if Docker daemon is running
        if docker info >/dev/null 2>&1; then
            log_success "Docker daemon is running"
        else
            log_warning "Docker daemon is not running. Please start Docker first."
        fi
    else
        log_warning "Docker or Docker Compose not available"
        log_info "Manual setup will be required"
    fi
}

# Show final instructions
show_final_instructions() {
    log_header "📋 Next Steps"
    
    echo -e "${CYAN}1. Configure your environment:${NC}"
    echo "   - Edit .env file with your Discord bot token and other credentials"
    echo "   - Set up your Discord application at https://discord.com/developers/applications"
    echo "   - Get your Gemini AI API key from Google AI Studio"
    echo ""
    
    echo -e "${CYAN}2. Choose your development approach:${NC}"
    echo ""
    echo -e "${YELLOW}Option A: Docker Compose (Recommended)${NC}"
    echo "   docker-compose up -d"
    echo "   docker-compose logs -f"
    echo ""
    
    echo -e "${YELLOW}Option B: Manual Setup${NC}"
    echo "   # Terminal 1 - Database"
    echo "   # Start PostgreSQL and Redis manually"
    echo ""
    echo "   # Terminal 2 - API"
    echo "   cd api && source venv/bin/activate && uvicorn main:app --reload"
    echo ""
    echo "   # Terminal 3 - Bot"
    echo "   cd bot && source venv/bin/activate && python main.py"
    echo ""
    echo "   # Terminal 4 - Dashboard"
    if command_exists pnpm; then
        echo "   cd dashboard && pnpm dev"
    else
        echo "   cd dashboard && npm run dev"
    fi
    echo ""
    
    echo -e "${CYAN}3. Access your application:${NC}"
    echo "   - Web Dashboard: http://localhost:3000"
    echo "   - API Documentation: http://localhost:8000/docs"
    echo "   - Bot: Check your Discord server"
    echo ""
    
    echo -e "${CYAN}4. Optional tools:${NC}"
    echo "   - PgAdmin: http://localhost:5050 (with --profile admin)"
    echo "   - Redis Commander: http://localhost:8081 (with --profile admin)"
    echo ""
    
    echo -e "${GREEN}Happy coding! 🚀${NC}"
}

# Run main function
main "$@" 