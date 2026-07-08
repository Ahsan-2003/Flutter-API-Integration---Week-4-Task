# 📱 API Integration Flutter App

A Flutter application demonstrating REST API integration with proper error handling and loading indicators.

## 🎯 Features

- ✅ **Task 1: HTTP Requests & JSON Parsing**
  - Fetch data from JSONPlaceholder API
  - Parse JSON response
  - Display posts in ListView

- ✅ **Task 2: User Profile Screen**
  - Fetch user data from API
  - Display name, email, and profile picture
  - Detailed user information

- ✅ **Task 3: Error Handling & Loading**
  - Loading spinner while fetching data
  - Proper error messages
  - Retry functionality

## 📸 Screenshots

| Home Screen | Posts List | User Profile |
|-------------|------------|--------------|
| <img width="554" height="1046" alt="image" src="https://github.com/user-attachments/assets/e2b18ee8-43ed-4c55-bcee-72baace8f20b" />|<img width="452" height="1047" alt="image" src="https://github.com/user-attachments/assets/618505c0-5c37-4fbe-a8a3-c32aa023ab8e" />| <img width="449" height="1043" alt="image" src="https://github.com/user-attachments/assets/181e7a22-1090-4651-a99c-5d05ef45cb5c" />

## 🛠️ Technologies Used

- **Flutter** - UI Framework
- **http** - API calls
- **cached_network_image** - Profile pictures

## 📂 Project Structure
lib/
├── main.dart
├── models/
│ └── user.dart
├── services/
│ └── api_service.dart
└── screens/
├── home_screen.dart
├── posts_screen.dart
└── user_profile_screen.dart

## 🚀 Getting Started

### Prerequisites
- Flutter SDK installed
- Android Studio / VS Code

### Installation

1. Clone the repository
```bash
git clone https://github.com/yourusername/api_integration_app.git
