import 'package:flutter/material.dart';
import 'package:tictok_clone/screens/features/main_navigation/widgets/image_post_widget.dart';
import 'package:tictok_clone/screens/features/main_navigation/widgets/text_post_widget.dart';

class HomeScreen extends StatelessWidget {
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

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
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
