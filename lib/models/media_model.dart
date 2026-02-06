class Media {
  final String id;
  final String title;
  final String genre;
  final String imageUrl;
  final String description;
  final double rating;
  final String duration;
  final bool isNew;

  Media({
    required this.id,
    required this.title,
    required this.genre,
    required this.imageUrl,
    required this.description,
    required this.rating,
    required this.duration,
    this.isNew = false,
  });
}

class MediaCategory {
  final String categoryName;
  final List<Media> items;

  MediaCategory({
    required this.categoryName,
    required this.items,
  });
}
