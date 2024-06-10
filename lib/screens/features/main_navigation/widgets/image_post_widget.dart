import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/screens/features/main_navigation/widgets/text_post_widget.dart';

class ImagePostWidget extends StatelessWidget {
  final Post post;

  const ImagePostWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(
          color: Colors.grey,
          thickness: 1.0,
          height: 3.0,
        ),
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 11,
                horizontal: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    post.duration,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                  Gaps.h10,
                  const Icon(Icons.more_horiz),
                ],
              ),
            ),
            ListTile(
              leading: const CircleAvatar(
                backgroundImage: AssetImage('assets/user_placeholder.png'),
              ),
              title: Text(
                post.user,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
              ),
              subtitle: Text(
                post.text,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
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
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.add_circle,
                  color: Colors.black,
                  size: 19,
                ),
              ),
            ),
          ],
        ),
        Gaps.v10,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: 200,
            child: PageView.builder(
              itemCount: post.images.length,
              itemBuilder: (context, index) {
                return Image.asset(post.images[index], fit: BoxFit.contain);
              },
            ),
          ),
        ),
        Gaps.v10,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Gaps.h20,
              Gaps.h24,
              IconButton(
                icon: const Icon(Icons.favorite_border, color: Colors.black),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.comment, color: Colors.black),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.share, color: Colors.black),
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
                        decoration: const BoxDecoration(
                          color: Colors.white,
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
                        decoration: const BoxDecoration(
                          color: Colors.white,
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
                        decoration: const BoxDecoration(
                          color: Colors.white,
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
                '${post.replies} replies • ${post.likes} likes',
                style: TextStyle(
                  color: Colors.grey[700],
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
