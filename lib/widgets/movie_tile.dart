import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../models/media_model.dart';

class MovieTile extends StatelessWidget {
  final Media media;
  final VoidCallback onTap;
  final bool isLarge;

  const MovieTile({
    Key? key,
    required this.media,
    required this.onTap,
    this.isLarge = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.accentPink.withOpacity(0.3),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: isLarge ? double.infinity : 140,
                height: isLarge ? 300 : 200,
                decoration: BoxDecoration(
                  color: AppColors.primaryPurple,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.primaryPurple.withOpacity(0.8),
                      AppColors.accentPink.withOpacity(0.6),
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
                              return Container(
                                color: AppColors.primaryDark,
                                child: Center(
                                  child: Text(
                                    media.title.length > 3
                                        ? media.title.substring(0, 3).toUpperCase()
                                        : media.title.toUpperCase(),
                                    style: const TextStyle(
                                      color: AppColors.accentPink,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            },
                          )
                        : Container(
                            color: AppColors.primaryDark,
                            child: Center(
                              child: Text(
                                media.title.length > 3
                                    ? media.title.substring(0, 3).toUpperCase()
                                    : media.title.toUpperCase(),
                                style: const TextStyle(
                                  color: AppColors.accentPink,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                    // Overlay gradient
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            AppColors.primaryDark.withOpacity(0.7),
                          ],
                        ),
                      ),
                    ),
                    // Content
                    Positioned(
                      bottom: 12,
                      left: 12,
                      right: 12,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            media.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (isLarge)
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                media.genre,
                                style: const TextStyle(
                                  color: AppColors.textDark,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    // New badge
                    if (media.isNew)
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.accentPink,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'NEW',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
