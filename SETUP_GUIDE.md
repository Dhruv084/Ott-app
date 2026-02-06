# StreamHub OTT - Setup and Build Guide

## Quick Start

### 1. Install Flutter Dependencies
```bash
cd ott_app
flutter pub get
```

### 2. Run the Application

**For Development:**
```bash
flutter run
```

**For Android Emulator:**
```bash
flutter run -d emulator-5554
```

**For iOS Simulator:**
```bash
flutter run -d ios
```

**For Web:**
```bash
flutter run -d chrome
```

### 3. Build Release APK (Android)
```bash
flutter build apk --release
```

The APK will be located at: `build/app/outputs/apk/release/app-release.apk`

### 4. Build Release App Bundle (Android)
```bash
flutter build appbundle --release
```

### 5. Build for iOS
```bash
flutter build ios --release
```

### 6. Build for Web
```bash
flutter build web --release
```

## Project Features

### Implemented Features:
1. ✅ **Home Screen** with multiple content categories
2. ✅ **Search Functionality** - Real-time filtering of movies/shows
3. ✅ **Featured Content Section** - Large banner with play, bookmark, and share buttons
4. ✅ **Movie/Show Tiles** - Reusable components for displaying media
5. ✅ **Multiple Categories** - Trending, Coming Soon, Best for Kids
6. ✅ **Bottom Navigation** - 5-tab navigation system
7. ✅ **Professional Styling** - Dark theme with purple and pink accents
8. ✅ **Search Results Grid** - Beautiful grid layout for search results
9. ✅ **Responsive Design** - Works on various screen sizes

### UI Components:
- `MovieTile` - Displays individual movie/show tiles
- `FeaturedContent` - Large featured content banner
- `CategorySection` - Horizontal scrollable content sections
- `CustomSearchBar` - Search input with real-time filtering
- `BottomNavBar` - Navigation with 5 sections

## Architecture

### File Structure:
```
lib/
├── constants/
│   └── colors.dart              # Color constants
├── models/
│   └── media_model.dart         # Data classes
├── screens/
│   └── home_screen.dart         # Main UI logic
├── widgets/
│   ├── movie_tile.dart          # Movie tile component
│   ├── featured_content.dart    # Featured banner
│   ├── category_section.dart    # Category list
│   ├── custom_search_bar.dart   # Search bar
│   └── bottom_navigation.dart   # Nav bar
└── main.dart                    # App entry point
```

## Customization Guide

### Change App Name
Edit `pubspec.yaml`:
```yaml
name: your_app_name
description: Your app description
```

### Change Theme Colors
Edit `lib/constants/colors.dart`:
```dart
class AppColors {
  static const Color primaryDark = Color(0xFF1a0033);
  static const Color accentPink = Color(0xFFEC4899);
  // ... modify colors here
}
```

### Add More Content
Edit `lib/screens/home_screen.dart` in `_initializeSampleData()` method:
```dart
void _initializeSampleData() {
  trendingItems = [
    Media(
      id: '1',
      title: 'Your Movie Title',
      genre: 'Genre',
      imageUrl: 'image_url',
      description: 'Description',
      rating: 8.5,
      duration: '2h 30m',
    ),
    // Add more items
  ];
}
```

## Testing

### Run Tests
```bash
flutter test
```

### Check for Lint Issues
```bash
flutter analyze
```

## Performance Optimization

### Shrink App Size
```bash
flutter build apk --split-per-abi
```

### Enable Obfuscation
```bash
flutter build apk --obfuscate --split-debug-info=build/app/outputs/symbols
```

## Troubleshooting

### Common Issues:

1. **Pub Get Fails**
   ```bash
   flutter clean
   flutter pub get
   ```

2. **Build Cache Issues**
   ```bash
   flutter clean
   flutter pub get
   flutter run
   ```

3. **SDK Issues**
   ```bash
   flutter upgrade
   flutter doctor
   ```

## Dependencies

All dependencies are included in `pubspec.yaml`:
- **flutter**: UI framework
- **cupertino_icons**: iOS-style icons

## Version Info

- **Flutter Version**: 2.19.0+
- **Dart Version**: 2.19.0+
- **Minimum Android**: SDK 21 (Android 5.0)
- **Minimum iOS**: iOS 11.0

## App Information

- **App Name**: StreamHub
- **App Version**: 1.0.0
- **Build Number**: 1

## Future Enhancements

Consider implementing:
- Video player integration
- User authentication
- Firebase integration
- Push notifications
- Offline content support
- Advanced search filters
- User profiles and watchlists
- Payment integration

## Support & Documentation

- [Flutter Documentation](https://docs.flutter.dev)
- [Dart Documentation](https://dart.dev/guides)
- [Material Design Guidelines](https://material.io/design)

---

**Happy Coding! 🚀**
