import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tictok_clone/screens/features/main_navigation/screens/activity/activity_screen.dart';
import 'package:tictok_clone/screens/features/main_navigation/screens/home/home_screen.dart';
import 'package:tictok_clone/screens/features/main_navigation/screens/post/post_screen.dart';
import 'package:tictok_clone/screens/features/main_navigation/screens/profile/profile_screen.dart';
import 'package:tictok_clone/screens/features/main_navigation/screens/search/search_screen.dart';
import 'package:tictok_clone/utils.dart';

class MainNavigationScreen extends ConsumerStatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  _MainNavigationScreenState createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends ConsumerState<MainNavigationScreen> {
  int _selectedIndex = 0;

  static const List<String> _tabs = [
    "/",
    "/search",
    "/post",
    "/activity",
    "/profile"
  ];

  void _onTap(int index) {
    if (index == 2) {
      _onNewPostTap(context);
    } else {
      setState(() {
        _selectedIndex = index;
      });
      context.go(_tabs[index]);
    }
  }

  void _onNewPostTap(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      builder: (context) => PostScreen(),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(offstage: _selectedIndex != 0, child: const HomeScreen()),
          Offstage(offstage: _selectedIndex != 1, child: const SearchScreen()),
          Offstage(
              offstage: _selectedIndex != 3, child: const ActivityScreen()),
          Offstage(
              offstage: _selectedIndex != 4, child: const UserProfileScreen()),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: _onTap,
        selectedItemColor:
            !isDarkMode(context, ref) ? Colors.black : Colors.white,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: "Home",
            backgroundColor: !isDarkMode(context, ref)
                ? Colors.amber[50]
                : const Color(0xFF333300),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search),
            label: "Search",
            backgroundColor: !isDarkMode(context, ref)
                ? Colors.blue[100]
                : const Color(0xFF003366),
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () => _onNewPostTap(context),
              child: const Icon(Icons.add_circle_outline),
            ),
            label: "Post",
            backgroundColor: !isDarkMode(context, ref)
                ? Colors.green[100]
                : const Color(0xFF003300),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.notifications),
            label: "Notifications",
            backgroundColor: !isDarkMode(context, ref)
                ? Colors.purple[100]
                : const Color(0xFF4B0082),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: "Profile",
            backgroundColor: !isDarkMode(context, ref)
                ? Colors.lightBlue[300]
                : const Color(0xFF003366),
          ),
        ],
      ),
    );
  }
}
