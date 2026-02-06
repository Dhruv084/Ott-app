import 'package:flutter/material.dart';
import '../constants/colors.dart';

class BottomNavBar extends StatefulWidget {
  final Function(int) onTap;
  final int currentIndex;

  const BottomNavBar({
    Key? key,
    required this.onTap,
    required this.currentIndex,
  }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryDark.withOpacity(0.95),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        border: Border(
          top: BorderSide(
            color: AppColors.accentPink.withOpacity(0.3),
            width: 1,
          ),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: widget.currentIndex,
        onTap: widget.onTap,
        backgroundColor: Colors.transparent,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.accentPink,
        unselectedItemColor: AppColors.textDark.withOpacity(0.6),
        items: [
          _buildNavItem(Icons.home, 'Home', 0),
          _buildNavItem(Icons.favorite, 'Favorites', 1),
          _buildNavItem(Icons.live_tv, 'Live', 2),
          _buildNavItem(Icons.download, 'Downloads', 3),
          _buildNavItem(Icons.person, 'Profile', 4),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
    IconData icon,
    String label,
    int index,
  ) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      activeIcon: Icon(
        icon,
        color: AppColors.accentPink,
      ),
      label: label,
    );
  }
}
