# 🌐 Flutter API Integration - Week 4 Task

A comprehensive Flutter application demonstrating **RESTful API integration** with proper error handling, loading indicators, and clean architecture.

## 🎯 Learning Objectives

- ✅ Understand RESTful API integration
- ✅ Fetch and parse JSON data in Flutter
- ✅ Display data using ListView
- ✅ Build user profile screens
- ✅ Implement error handling
- ✅ Show loading indicators

## 🚀 Features

### Task 1: HTTP Requests & JSON Parsing
- Send HTTP GET requests to JSONPlaceholder API
- Parse JSON responses
- Display posts in a ListView
- Refresh functionality

### Task 2: User Profile Screen
- Fetch user data from API
- Display user details (name, email, phone)
- Show profile pictures using cached network images
- Detailed user information (address, company)

### Task 3: Error Handling & Loading
- Loading spinner while fetching data
- Error messages for failed requests
- Retry functionality
- Proper state management

## 📂 Project Structure

lib/
├── main.dart # App entry point
├── models/
│ ├── post.dart # Post data model
│ └── user.dart # User data model
├── services/
│ └── api_service.dart # API service with all HTTP methods
└── screens/
├── home_screen.dart # Home screen with navigation
├── posts_screen.dart # Posts list screen
└── user_profile_screen.dart # User profile screen


## 🛠️ Technologies Used

| Technology | Purpose |
|------------|---------|
| **Flutter** | UI Framework |
| **Dart** | Programming Language |
| **http** | HTTP requests |
| **cached_network_image** | Profile picture caching |
| **JSONPlaceholder** | Free fake API |

