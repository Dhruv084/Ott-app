# 🎬 StreamHub OTT App

A modern Over-The-Top (OTT) media streaming application built with Flutter. StreamHub provides an engaging user interface for browsing movies, shows, and recommendations with powerful search functionality.

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)

## ✨ Features

### 🏠 Home Screen
- Clean and intuitive interface
- Featured content showcase
- Multiple content categories (Trending Now, Coming Soon, Best for Kids)
- Smooth scrolling experience
- Bottom navigation bar

### 🔍 Search Functionality
- **Real-time Filtering**: Search results update as you type
- **Grid View Results**: Organized display of search results
- **Clear Button**: Quick clear of search input
- **No Results Handling**: User-friendly messages

### 🎯 Content Display
- Movie/Show tiles with gradient overlays
- NEW badges for latest releases
- Rating display
- Responsive design for different screen sizes
- Touch-optimized interactions

### 👤 Profile Section
- User profile management
- Settings and preferences
- Watch history
- Favorites list

## 🎨 Design

### Color Theme
- **Background**: Deep Purple (#1a0033)
- **Primary Accent**: Vibrant Purple (#6B21A8)
- **Interactive**: Hot Pink (#EC4899)
- **Secondary**: Cyan Blue (#00D4FF)
- **Text**: Light Gray (#E0E0E0)

### Design Philosophy
- Modern & Professional interface
- Dark theme for comfortable viewing
- Gradient overlays for visual depth
- High contrast for excellent readability

## 📁 Project Structure

```
lib/
├── main.dart                    # Application entry point
├── constants/
│   └── colors.dart             # Color definitions
├── models/
│   └── media_model.dart        # Data models
├── screens/
│   ├── home_screen.dart        # Main home screen
│   └── profile_screen.dart     # User profile
└── widgets/
    ├── bottom_navigation.dart  # Bottom nav bar
    ├── category_section.dart   # Category display
    ├── custom_search_bar.dart  # Search widget
    ├── featured_content.dart   # Featured section
    └── movie_tile.dart         # Movie/show tiles
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (>=2.19.0 <4.0.0)
- Dart SDK
- Android Studio / VS Code
- Android Emulator / iOS Simulator / Physical Device

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Dhruv084/Ott-app.git
   cd Ott-app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## 📱 Screens

### Home Screen
The main landing page featuring:
- Header with app name and notification icon
- Search bar for content discovery
- Featured content with play button and actions
- Multiple scrollable categories
- Bottom navigation

### Profile Screen
User profile section with:
- User information
- Account settings
- Watch history
- Favorite content

## 🛠️ Built With

- **Flutter** - UI framework
- **Dart** - Programming language
- **Material Design** - Design system

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
```

## 🎯 Key Components

### CustomSearchBar Widget
Real-time search functionality with:
- Text input field
- Clear button
- Search callback
- Change callback for real-time updates

### MovieTile Widget
Reusable component for displaying content:
- Two size variants (normal and large)
- Gradient overlay
- NEW badge for recent releases
- Title display
- Tap animation

### CategorySection Widget
Horizontal scrollable sections:
- Category title with "See All" button
- Scrollable content list
- Responsive layout

## 🌟 Features in Detail

### Search Implementation
```dart
CustomSearchBar(
  onSearch: (query) => setState(() => _searchQuery = query),
  onChanged: (query) => setState(() => _searchQuery = query),
)
```

### Media Model
```dart
class MediaModel {
  final String title;
  final String image;
  final bool isNew;
  final String? rating;
}
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is created for educational purposes.

## 👨‍💻 Author

**Dhruv084**
- GitHub: [@Dhruv084](https://github.com/Dhruv084)

## 📞 Support

For support, please open an issue in the GitHub repository.

---

Made with ❤️ using Flutter