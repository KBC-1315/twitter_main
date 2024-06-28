import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/screens/features/main_navigation/screens/home/detail_view_screen.dart';
import 'package:tictok_clone/utils.dart';

enum PostType { text, image }

class Post {
  final String duration;
  final String user;
  final String text;
  final List<String> images;
  final int replies;
  final int likes;
  final PostType type;

  Post({
    required this.user,
    this.text = '',
    this.images = const [],
    this.duration = "",
    this.replies = 0,
    this.likes = 0,
    required this.type,
  });
}

class TextPostWidget extends ConsumerStatefulWidget {
  final Post post;
  const TextPostWidget({super.key, required this.post});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TextPostWidgetState();
}

class _TextPostWidgetState extends ConsumerState<TextPostWidget> {
  void _onThreeDotTap(BuildContext context) async {
    await showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => const DetailViewScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          color: !isDarkMode(context, ref) ? Colors.grey : Colors.white,
          thickness: 1.0,
          height: 3.0,
        ),
        Stack(
          children: [
            ListTile(
              leading: const CircleAvatar(
                backgroundImage: AssetImage('assets/user_placeholder.png'),
              ),
              title: Text(
                widget.post.user,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
              ),
              subtitle: Text(
                widget.post.text,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Positioned(
              right: 388,
              bottom: 18,
              child: Container(
                height: 19,
                width: 19,
                padding: const EdgeInsets.all(0.1),
                decoration: BoxDecoration(
                  color:
                      !isDarkMode(context, ref) ? Colors.white : Colors.black,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.add_circle,
                  color:
                      !isDarkMode(context, ref) ? Colors.black : Colors.white,
                  size: 19,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 11,
                horizontal: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    widget.post.duration,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: !isDarkMode(context, ref)
                          ? Colors.grey
                          : Colors.white,
                    ),
                  ),
                  Gaps.h10,
                  GestureDetector(
                    onTap: () => _onThreeDotTap(context),
                    child: const Icon(Icons.more_horiz),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Gaps.h20,
              Container(
                width: 1,
                height: 30,
                decoration: BoxDecoration(
                  color: !isDarkMode(context, ref) ? Colors.grey : Colors.black,
                ),
              ),
              Gaps.h24,
              IconButton(
                icon: Icon(Icons.favorite_border,
                    color: !isDarkMode(context, ref)
                        ? Colors.black
                        : Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.comment,
                    color: !isDarkMode(context, ref)
                        ? Colors.black
                        : Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.share,
                    color: !isDarkMode(context, ref)
                        ? Colors.black
                        : Colors.white),
                onPressed: () {},
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: Stack(
                  clipBehavior: Clip.none, // 부모 위젯의 경계를 넘어가게 허용
                  children: [
                    Positioned(
                      left: 0,
                      top: 20,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: !isDarkMode(context, ref)
                              ? Colors.white
                              : Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: const CircleAvatar(
                          radius: 12,
                          backgroundImage:
                              AssetImage('assets/user_placeholder.png'),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 15,
                      top: 20, // 첫 번째 CircleAvatar에 비해 오른쪽으로 이동
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: !isDarkMode(context, ref)
                              ? Colors.white
                              : Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: const CircleAvatar(
                          radius: 12,
                          backgroundImage:
                              AssetImage('assets/user_placeholder.png'),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 6,
                      top: 2, // 첫 번째 CircleAvatar에 비해 오른쪽으로 이동
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: !isDarkMode(context, ref)
                              ? Colors.white
                              : Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: const CircleAvatar(
                          radius: 12,
                          backgroundImage:
                              AssetImage('assets/user_placeholder.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Gaps.h10,
              Text(
                '${widget.post.replies} replies • ${widget.post.likes} likes',
                style: TextStyle(
                  color: !isDarkMode(context, ref)
                      ? Colors.grey[700]
                      : Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ), // 간격 추가
      ],
    );
  }
}
