import 'package:flutter/material.dart';
import '../constants/colors.dart';

class CustomSearchBar extends StatefulWidget {
  final Function(String) onSearch;
  final Function(String) onChanged;

  const CustomSearchBar({
    Key? key,
    required this.onSearch,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.primaryPurple.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.accentPink.withOpacity(0.3),
          width: 2,
        ),
      ),
      child: TextField(
        controller: _controller,
        style: const TextStyle(color: AppColors.white),
        onChanged: widget.onChanged,
        onSubmitted: widget.onSearch,
        decoration: InputDecoration(
          hintText: 'Search movies, shows...',
          hintStyle: TextStyle(
            color: AppColors.textDark.withOpacity(0.6),
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.accentPink,
          ),
          suffixIcon: _controller.text.isNotEmpty
              ? GestureDetector(
                  onTap: () {
                    _controller.clear();
                    widget.onChanged('');
                  },
                  child: const Icon(
                    Icons.close,
                    color: AppColors.accentPink,
                  ),
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
      ),
    );
  }
}
