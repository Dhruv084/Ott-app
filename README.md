# StreamHub OTT - Over-The-Top Media Streaming Application

A modern, professional Flutter application for streaming movies and TV shows with an intuitive and engaging user interface.

## Features

✨ **Core Features:**
- **Movie/Show Tiles**: Beautiful grid and horizontal tile displays for movies and shows
- **Search Functionality**: Real-time search to find movies and shows
- **Featured Content Section**: Large highlighted section for featured content with play, bookmark, and share options
- **Multiple Categories**: Organize content into categories like "Trending Now", "Coming Soon", "Best for Kids"
- **Bottom Navigation**: Easy navigation between Home, Favorites, Live, Downloads, and Profile
- **Responsive Design**: Optimized layouts for different screen sizes
- **Dark Theme**: Modern purple and pink themed interface

## Project Structure

```
lib/
├── constants/
│   └── colors.dart          # App color palette
├── models/
│   └── media_model.dart     # Data models for Media and MediaCategory
├── screens/
│   └── home_screen.dart     # Main home screen with search and categories
├── widgets/
│   ├── movie_tile.dart      # Reusable movie/show tile widget
│   ├── featured_content.dart # Featured content banner
│   ├── category_section.dart # Horizontal scrollable category sections
│   ├── custom_search_bar.dart # Search input widget
│   └── bottom_navigation.dart # Bottom navigation bar
└── main.dart               # App entry point
```

## Getting Started

### Prerequisites
- Flutter SDK (version 2.19.0 or higher)
- Dart SDK

### Installation

1. Navigate to the project directory:
```bash
cd ott_app
```

2. Get dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Usage

### Home Screen
- View trending content, coming soon items, and kids content
- Use the search bar to find specific movies or shows
- Tap on any tile to view more details
- Use the featured content section to play, bookmark, or share content

### Navigation
- **Home**: Browse all content categories
- **Favorites**: View your bookmarked content (placeholder)
- **Live**: Watch live streams (placeholder)
- **Downloads**: Access downloaded content (placeholder)
- **Profile**: View your profile (placeholder)

## Customization

### Colors
Edit [constants/colors.dart](lib/constants/colors.dart) to customize the app theme.

### Content
Modify sample data in `_initializeSampleData()` method in [screens/home_screen.dart](lib/screens/home_screen.dart) to add your own content.

### Layout
Adjust spacing, sizes, and animations in the widget files to match your design preferences.

## Available Widgets

### MovieTile
Displays a movie or show tile with optional "NEW" badge.

### FeaturedContent
Large featured content section with description, rating, and action buttons.

### CategorySection
Horizontal scrollable list of media items with a category title.

### CustomSearchBar
Search input with clear functionality.

### BottomNavBar
Navigation bar with 5 main sections.

## Screenshots

The app features:
- Dark purple and pink color scheme
- Gradient overlays for visual depth
- Smooth animations and transitions
- Intuitive user interface

## Future Enhancements

- Video playback functionality
- User authentication and profiles
- Personalized recommendations
- Watchlist/Favorites persistence
- Payment integration for premium content
- Push notifications
- Dark/Light theme toggle

## License

This project is open source and available under the MIT License.

## Support

For questions or issues, please create an issue in the repository.

---

**Built with ❤️ using Flutter**
