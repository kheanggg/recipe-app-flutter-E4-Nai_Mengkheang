import 'package:flutter/material.dart';
import 'features/favorite/ui/favorite_screen.dart';
import 'features/explore/ui/explore_screen.dart';
import 'features/home/ui/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // List of screens corresponding to the navigation bar items
  final List<Widget> _screens = [
    const HomeScreen(),
    const ExploreScreen(),
    const FavoriteScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _screens[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled, size: 30),
            activeIcon: Icon(Icons.home_filled, size: 30),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_rounded, size: 30),
            activeIcon: Icon(Icons.explore_rounded, size: 30),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, size: 30),
            activeIcon: Icon(Icons.favorite, size: 30),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
