import 'package:flutter/material.dart';
import 'package:tictok_clone/screens/features/main_navigation/home_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  _MainNavigationScreenState createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomeScreen(),
          const PlaceholderWidget("Search"),
          const PlaceholderWidget("Post"),
          const PlaceholderWidget("Notifications"),
          const PlaceholderWidget("Profile"),
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
            icon: const Icon(Icons.add_circle_outline),
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

class PlaceholderWidget extends StatelessWidget {
  final String text;

  const PlaceholderWidget(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text),
    );
  }
}
