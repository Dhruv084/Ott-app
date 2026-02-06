import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../models/media_model.dart';
import 'movie_tile.dart';

class CategorySection extends StatelessWidget {
  final String categoryName;
  final List<Media> items;
  final VoidCallback? onSeeAll;

  const CategorySection({
    Key? key,
    required this.categoryName,
    required this.items,
    this.onSeeAll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                categoryName,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: onSeeAll,
                child: const Text(
                  'See All',
                  style: TextStyle(
                    color: AppColors.accentPink,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return MovieTile(
                media: items[index],
                onTap: () {},
              );
            },
          ),
        ),
      ],
    );
  }
}
