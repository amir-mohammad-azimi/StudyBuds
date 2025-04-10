# StudyBuds

## 📱 Project Overview

StudyBuds is a comprehensive platform designed to help university students form and manage study groups. This capstone project demonstrates full-stack development skills with a mobile application, backend services, and integration with third-party platforms.

### Key Features
- **Secure Authentication**: University credential-based login system
- **Study Group Management**: Create, join, and manage study groups
- **Real-time Communication**: Telegram integration for group chats
- **Course-based Matching**: Find study partners based on enrolled courses
- **Push Notifications**: Stay updated on group activities

## 🛠️ Technology Stack

### Mobile Application
- **Flutter**: Cross-platform mobile framework with Material Design
- **Bloc Pattern**: State management architecture
- **Firebase**: Push notifications and analytics

### Backend Services
- **Node.js/Express**: RESTful API development
- **PostgreSQL**: Relational database for data persistence
- **Sequelize ORM**: Database modeling and migration
- **JWT**: Authentication and session management
- **Telegram Bot API**: Chat integration

### DevOps & Testing
- **Docker**: Containerization for easy deployment
- **Cucumber & Appium**: Behavior-driven testing
- **CI/CD**: Automated testing and deployment pipeline

## 📂 Project Structure

```
StudyBuds/
├── mobile_app/            # Flutter mobile application
│   ├── lib/               # Dart source code
│   ├── android/           # Android configuration
│   └── assets/            # Images, fonts, and raw assets
├── backend/               # Node.js backend services
│   ├── src/               # Source code
│   │   ├── config/        # Configuration files
│   │   ├── controllers/   # API controllers
│   │   ├── models/        # Database models
│   │   ├── routes/        # API routes
│   │   ├── service/       # Business logic
│   │   ├── telegram/      # Telegram bot integration
│   │   └── utils/         # Utility functions
│   └── api_testing/       # API testing suite
├── test/                  # End-to-end testing
│   ├── features/          # Cucumber feature files
│   ├── steps/             # Test step definitions
│   └── utils/             # Testing utilities
└── unige/                 # University integration services
```

## 🚀 Getting Started

### Prerequisites
- Node.js (v14+)
- Flutter SDK (2.5+)
- Docker and Docker Compose
- PostgreSQL

### Setup and Installation

1. Clone the repository
   ```
   git clone https://github.com/amir-mohammad-azimi/StudyBuds.git
   ```

2. Start backend services
   ```
   cd StudyBuds
   docker-compose up -d
   ```

3. Run the mobile application
   ```
   cd mobile_app
   flutter pub get
   flutter run
   ```

## 🧪 Testing

The application includes comprehensive testing:

- Unit tests for backend services
- Integration tests for API endpoints
- End-to-end tests using Cucumber and Appium

Run tests with:
```
cd test
npm install
npm test
```

## 📊 Project Highlights

- **Microservices Architecture**: Designed with scalability in mind
- **Security-First Approach**: Secure authentication and data protection
- **Behavior-Driven Development**: Features implemented based on detailed user stories
- **Cross-Platform Development**: Single codebase for iOS and Android
