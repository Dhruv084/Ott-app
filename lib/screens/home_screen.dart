import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../models/media_model.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/featured_content.dart';
import '../widgets/category_section.dart';
import '../widgets/bottom_navigation.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentNavIndex = 0;
  String _searchQuery = '';

  // Sample data for demonstration
  late List<Media> trendingItems;
  late List<Media> comingSoonItems;
  late List<Media> bestForKidsItems;
  late List<Media> allItems;

  @override
  void initState() {
    super.initState();
    _initializeSampleData();
  }

  void _initializeSampleData() {
    // Trending items
    trendingItems = [
      Media(
        id: '1',
        title: 'Avengers',
        genre: 'Action, Adventure',
        imageUrl: 'assets/images/avengers.jpg',
        description: 'The Avengers assemble to save the world.',
        rating: 8.5,
        duration: '2h 30m',
        isNew: false,
      ),
      Media(
        id: '2',
        title: 'The Matrix',
        genre: 'Sci-Fi, Action',
        imageUrl: 'assets/images/matrix.jfif',
        description: 'A computer hacker learns the truth about reality.',
        rating: 8.7,
        duration: '2h 16m',
        isNew: false,
      ),
      Media(
        id: '3',
        title: 'Inception',
        genre: 'Thriller, Sci-Fi',
        imageUrl: 'assets/images/inception.jfif',
        description: 'A skilled thief who steals corporate secrets.',
        rating: 8.8,
        duration: '2h 28m',
        isNew: false,
      ),
      Media(
        id: '4',
        title: 'Interstellar',
        genre: 'Sci-Fi, Drama',
        imageUrl: 'assets/images/interstellar.jfif',
        description: 'A team of astronauts travel through a wormhole.',
        rating: 8.6,
        duration: '2h 49m',
        isNew: false,
      ),
    ];

    // Coming soon items
    comingSoonItems = [
      Media(
        id: '5',
        title: 'Dora',
        genre: 'Animation, Adventure',
        imageUrl: 'assets/images/dora.jfif',
        description: 'The explorer returns for a new adventure.',
        rating: 7.2,
        duration: '1h 42m',
        isNew: true,
      ),
      Media(
        id: '6',
        title: 'Black Widow',
        genre: 'Action, Thriller',
        imageUrl: 'assets/images/blackwidow.jfif',
        description: 'Natasha Romanoff faces her past.',
        rating: 7.8,
        duration: '2h 14m',
        isNew: true,
      ),
      Media(
        id: '7',
        title: 'Space Force',
        genre: 'Comedy, Drama',
        imageUrl: 'assets/images/spaceforce.jfif',
        description: 'A new branch of the US military.',
        rating: 7.5,
        duration: '1h 30m',
        isNew: true,
      ),
    ];

    // Best for kids items
    bestForKidsItems = [
      Media(
        id: '8',
        title: 'Finding Nemo',
        genre: 'Animation, Adventure',
        imageUrl: 'assets/images/nemo.jfif',
        description: 'A clownfish searches for his son.',
        rating: 8.1,
        duration: '1h 40m',
        isNew: false,
      ),
      Media(
        id: '9',
        title: 'Toy Story',
        genre: 'Animation, Comedy',
        imageUrl: 'assets/images/toystory.jfif',
        description: 'Woody and Buzz go on an adventure.',
        rating: 8.3,
        duration: '1h 21m',
        isNew: false,
      ),
      Media(
        id: '10',
        title: 'Frozen',
        genre: 'Animation, Musical',
        imageUrl: 'assets/images/frozen.jfif',
        description: 'Two sisters on a magical journey.',
        rating: 7.4,
        duration: '1h 42m',
        isNew: false,
      ),
    ];

    allItems = [
      ...trendingItems,
      ...comingSoonItems,
      ...bestForKidsItems,
    ];
  }

  List<Media> _getFilteredItems() {
    if (_searchQuery.isEmpty) {
      return allItems;
    }
    return allItems
        .where((item) =>
            item.title.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredItems = _getFilteredItems();
    final featuredMedia = trendingItems.isNotEmpty ? trendingItems[0] : null;

    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            const Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'StreamHub',
                    style: TextStyle(
                      color: AppColors.accentPink,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.notifications_none,
                    color: AppColors.accentPink,
                    size: 28,
                  ),
                ],
              ),
            ),
            // Search bar
            CustomSearchBar(
              onSearch: (query) {
                setState(() {
                  _searchQuery = query;
                });
              },
              onChanged: (query) {
                setState(() {
                  _searchQuery = query;
                });
              },
            ),
            // Content
            Expanded(
              child: _searchQuery.isEmpty
                  ? _buildHomeContent(featuredMedia)
                  : _buildSearchResults(filteredItems),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentNavIndex,
        onTap: (index) {
          if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfileScreen(),
              ),
            );
          } else {
            setState(() {
              _currentNavIndex = index;
            });
          }
        },
      ),
    );
  }

  Widget _buildHomeContent(Media? featured) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Featured content
          if (featured != null)
            FeaturedContent(
              media: featured,
              onPlayTap: () {
                _showMessage('Playing: ${featured.title}');
              },
            ),
          // Categories
          CategorySection(
            categoryName: 'TRENDING NOW',
            items: trendingItems,
            onSeeAll: () {
              _showMessage('Show all trending');
            },
          ),
          CategorySection(
            categoryName: 'COMING SOON',
            items: comingSoonItems,
            onSeeAll: () {
              _showMessage('Show all coming soon');
            },
          ),
          CategorySection(
            categoryName: 'BEST FOR KIDS',
            items: bestForKidsItems,
            onSeeAll: () {
              _showMessage('Show all kids content');
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildSearchResults(List<Media> items) {
    if (items.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off,
              color: AppColors.accentPink.withOpacity(0.5),
              size: 64,
            ),
            const SizedBox(height: 16),
            Text(
              'No results found for "$_searchQuery"',
              style: const TextStyle(
                color: AppColors.textDark,
                fontSize: 16,
              ),
            ),
          ],
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.6,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            _showMessage('Tapped: ${items[index].title}');
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.primaryPurple.withOpacity(0.8),
                  AppColors.accentPink.withOpacity(0.6),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.accentPink.withOpacity(0.2),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: items[index].imageUrl.isNotEmpty
                      ? Image.asset(
                          items[index].imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: AppColors.primaryDark,
                              child: Center(
                                child: Text(
                                  items[index].title.substring(0, min(3, items[index].title.length)),
                                  style: const TextStyle(
                                    color: AppColors.accentPink,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      : Container(
                          color: AppColors.primaryDark,
                          child: Center(
                            child: Text(
                              items[index].title.substring(0, min(3, items[index].title.length)),
                              style: const TextStyle(
                                color: AppColors.accentPink,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        AppColors.primaryDark.withOpacity(0.8),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 12,
                  left: 8,
                  right: 8,
                  child: Text(
                    items[index].title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.accentPink,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

int min(int a, int b) => a < b ? a : b;
