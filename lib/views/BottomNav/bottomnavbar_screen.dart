import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie/views/BottomNavScreens/HomeScreen/home_screen.dart';
import 'package:movie/views/BottomNavScreens/TrendingScreen/trending_screen.dart';
import 'package:movie/views/BottomNavScreens/WatchlistScreen/watchlist_screen.dart';
import 'package:movie/views/ProfileScreen/profile_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({
    super.key,
  });

  @override
  _BottomNavBarScreenState createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _selectedIndex = 0;

  final List<String> _iconPaths = [
    'assets/icons/homeicon.svg',
    'assets/icons/trending.svg',
    'assets/icons/watchlist.svg',
    'assets/icons/profile.svg',
  ];

  late List<Widget> _screens;

  @override
  Widget build(BuildContext context) {
    _screens = [
      const HomeScreen(),
      const TrendingScreen(),
      const WatchlistScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(78, 0, 0, 0),
        items: [
          BottomNavigationBarItem(
            backgroundColor: const Color.fromARGB(78, 0, 0, 0),
            icon: SvgPicture.asset(
              _iconPaths[0],
              width: 30,
              height: 30,
              color: _getIconColor(0),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: const Color.fromARGB(78, 0, 0, 0),
            icon: SvgPicture.asset(
              _iconPaths[1],
              width: 30,
              height: 30,
              color: _getIconColor(1),
            ),
            label: 'Trending',
          ),
          BottomNavigationBarItem(
            backgroundColor: const Color.fromARGB(78, 0, 0, 0),
            icon: SvgPicture.asset(
              _iconPaths[2],
              width: 30,
              height: 30,
              color: _getIconColor(2),
            ),
            label: 'Watchlist',
          ),
          BottomNavigationBarItem(
            backgroundColor: const Color.fromARGB(78, 0, 0, 0),
            icon: SvgPicture.asset(
              _iconPaths[3],
              width: 30,
              height: 30,
              color: _getIconColor(3),
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Color _getIconColor(int index) {
    return _selectedIndex == index ? Colors.white : Colors.grey;
  }
}
