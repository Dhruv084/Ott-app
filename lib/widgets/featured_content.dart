import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../models/media_model.dart';

class FeaturedContent extends StatelessWidget {
  final Media media;
  final VoidCallback onPlayTap;

  const FeaturedContent({
    Key? key,
    required this.media,
    required this.onPlayTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Stack(
        children: [
          // Background image placeholder with gradient
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              height: 400,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.primaryPurple.withOpacity(0.7),
                    AppColors.accentPink.withOpacity(0.5),
                  ],
                ),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Image or placeholder
                  media.imageUrl.isNotEmpty
                      ? Image.asset(
                          media.imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    media.title,
                                    style: const TextStyle(
                                      color: AppColors.white,
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    media.genre,
                                    style: const TextStyle(
                                      color: AppColors.textDark,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                media.title,
                                style: const TextStyle(
                                  color: AppColors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                media.genre,
                                style: const TextStyle(
                                  color: AppColors.textDark,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                  // Content overlay
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            AppColors.primaryDark.withOpacity(0.9),
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildButton(
                                'Action',
                                AppColors.accentBlue,
                                () {},
                              ),
                              _buildButton(
                                media.duration,
                                AppColors.accentPink,
                                () {},
                              ),
                              _buildButton(
                                '${media.rating}',
                                AppColors.primaryPurple,
                                () {},
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            media.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: AppColors.textDark,
                              fontSize: 14,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton.icon(
                                onPressed: onPlayTap,
                                icon: const Icon(Icons.play_arrow),
                                label: const Text('Play'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.accentPink,
                                  foregroundColor: AppColors.white,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 32,
                                    vertical: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.bookmark,
                                  color: AppColors.white,
                                  size: 28,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.share,
                                  color: AppColors.white,
                                  size: 28,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String label, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
