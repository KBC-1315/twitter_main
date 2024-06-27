import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tictok_clone/screens/features/main_navigation/screens/activity/activity_screen.dart';
import 'package:tictok_clone/screens/features/main_navigation/screens/home/home_screen.dart';
import 'package:tictok_clone/screens/features/main_navigation/screens/post/post_screen.dart';
import 'package:tictok_clone/screens/features/main_navigation/screens/profile/profile_screen.dart';
import 'package:tictok_clone/screens/features/main_navigation/screens/search/search_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  _MainNavigationScreenState createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
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
      builder: (context) => const PostScreen(),
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
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.amber[50],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search),
            label: "Search",
            backgroundColor: Colors.blue[100],
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () => _onNewPostTap(context),
              child: const Icon(Icons.add_circle_outline),
            ),
            label: "Post",
            backgroundColor: Colors.green[100],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.notifications),
            label: "Notifications",
            backgroundColor: Colors.purple[100],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: "Profile",
            backgroundColor: Colors.lightBlue[300],
          ),
        ],
      ),
    );
  }
}
