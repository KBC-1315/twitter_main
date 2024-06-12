import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/screens/features/main_navigation/detail_view_screen.dart';
import 'package:tictok_clone/screens/features/main_navigation/post_screen.dart';
import 'package:tictok_clone/screens/features/main_navigation/widgets/image_post_widget.dart';
import 'package:tictok_clone/screens/features/main_navigation/widgets/nav_tab.dart';
import 'package:tictok_clone/screens/features/main_navigation/widgets/post_video_button.dart';
import 'package:tictok_clone/screens/features/main_navigation/widgets/text_post_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _onThreeDotTap() {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => const DetailViewScreen());
  }

  void _onNewPostTap() {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => const PostScreen());
  }

  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Post> posts = [
    Post(
        user: "Test1",
        text: "This is a text post",
        type: PostType.text,
        duration: "2m"),
    Post(
      user: "Test2",
      text: "Hello",
      images: ["assets/image1.png", "assets/image2.png"],
      type: PostType.image,
      duration: "10m",
    ),
    Post(
      user: "Test3",
      text: "Another text post",
      type: PostType.text,
      duration: "2h",
    ),
    Post(
      user: "Test4",
      images: ["assets/image3.png"],
      type: PostType.image,
      duration: "2h",
    ),
    Post(
      user: "Test5",
      text: "This is a text post",
      type: PostType.text,
    ),
    Post(
      user: "Test6",
      images: ["assets/image1.png", "assets/image2.png"],
      type: PostType.image,
    ),
    Post(
      user: "Test7",
      text: "Another text post",
      type: PostType.text,
    ),
    Post(
      user: "Test8",
      images: ["assets/image3.png"],
      type: PostType.image,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.size2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavTab(
                text: "Home",
                isSelected: _selectedIndex == 0,
                icon: FontAwesomeIcons.house,
                selectedIcon: FontAwesomeIcons.house,
                onTap: () => _onTap(0),
              ),
              NavTab(
                text: "Discover",
                isSelected: _selectedIndex == 1,
                icon: FontAwesomeIcons.compass,
                selectedIcon: FontAwesomeIcons.solidCompass,
                onTap: () => _onTap(1),
              ),
              Gaps.h24,
              GestureDetector(
                onTap: _onNewPostTap,
                child: const PostVideoButton(),
              ),
              Gaps.h24,
              NavTab(
                text: "Inbox",
                isSelected: _selectedIndex == 3,
                icon: FontAwesomeIcons.message,
                selectedIcon: FontAwesomeIcons.solidMessage,
                onTap: () => _onTap(3),
              ),
              NavTab(
                text: "Profile",
                isSelected: _selectedIndex == 4,
                icon: FontAwesomeIcons.user,
                selectedIcon: FontAwesomeIcons.solidUser,
                onTap: () => _onTap(4),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.facebook, size: 40),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: post.type == PostType.text
                      ? TextPostWidget(post: post)
                      : ImagePostWidget(post: post),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
