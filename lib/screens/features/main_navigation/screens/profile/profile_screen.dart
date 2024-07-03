import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/screens/features/main_navigation/screens/home/detail_view_screen.dart';
import 'package:tictok_clone/screens/features/main_navigation/screens/post/post_screen.dart';
import 'package:tictok_clone/screens/features/main_navigation/screens/profile/settings/setting_screen.dart';
import 'package:tictok_clone/screens/features/main_navigation/screens/home/widgets/image_post_widget.dart';
import 'package:tictok_clone/screens/features/main_navigation/screens/profile/widgets/persistent_tabbar.dart';
import 'package:tictok_clone/screens/features/main_navigation/screens/home/widgets/text_post_widget.dart';
import 'package:tictok_clone/utils.dart';

class UserProfileScreen extends ConsumerStatefulWidget {
  const UserProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UserProfileScreenState();
}

class _UserProfileScreenState extends ConsumerState<UserProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onSettingTap() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SettingScreen()));
  }

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
        builder: (context) => PostScreen());
  }

  final List<Post> posts2 = [
    Post(
        user: "Test1",
        text: "This is a text post",
        type: PostType.text,
        duration: "2m"),
    Post(
      user: "Test3",
      text: "Another text post",
      type: PostType.text,
      duration: "2h",
    ),
    Post(
      user: "Test5",
      text: "This is a text post",
      type: PostType.text,
    ),
    Post(
      user: "Test7",
      text: "Another text post",
      type: PostType.text,
    ),
  ];
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
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  title: const FaIcon(
                    FontAwesomeIcons.globe,
                    size: 25,
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: const FaIcon(
                        FontAwesomeIcons.instagram,
                        size: 25,
                      ),
                    ),
                    IconButton(
                      onPressed: _onSettingTap,
                      icon: const FaIcon(
                        FontAwesomeIcons.gear,
                        size: 25,
                      ),
                    ),
                  ],
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Gaps.v20,
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "@Username",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 24,
                                  ),
                                ),
                                Gaps.v5,
                                Row(
                                  children: [
                                    const Text("jane_mobbin"),
                                    Gaps.h10,
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 5),
                                      decoration: BoxDecoration(
                                          color: !isDarkMode(context, ref)
                                              ? Colors.grey.shade200
                                              : Colors.grey,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Text(
                                        "threads.net",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: !isDarkMode(context, ref)
                                              ? Colors.grey.shade500
                                              : Colors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const CircleAvatar(
                              radius: 30,
                              foregroundColor: Colors.teal,
                              backgroundColor: Colors.blue,
                              foregroundImage: NetworkImage(
                                  "https://avatars.githubusercontent.com/u/3612017?v=4"),
                              child: Text("User"),
                            ),
                          ],
                        ),
                      ),
                      Gaps.v12,
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Plant enthusiast!",
                              style: TextStyle(
                                fontSize: 20,
                                color: !isDarkMode(context, ref)
                                    ? Colors.black
                                    : Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gaps.v14,
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 50,
                              height: 30,
                              child: Stack(
                                clipBehavior: Clip.none, // 부모 위젯의 경계를 넘어가게 허용
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
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
                                        backgroundImage: AssetImage(
                                            'assets/user_placeholder.png'),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 20,
                                    top: 0, // 첫 번째 CircleAvatar에 비해 오른쪽으로 이동
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
                                        backgroundImage: AssetImage(
                                            'assets/user_placeholder.png'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Gaps.h10,
                            Text(
                              "2 followers",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.grey.shade500,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gaps.v14,
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 200,
                              height: 50,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: Sizes.size12,
                                ),
                                decoration: BoxDecoration(
                                  color: !isDarkMode(context, ref)
                                      ? Colors.white
                                      : Colors.black,
                                  border:
                                      Border.all(color: Colors.grey, width: 1),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(6),
                                  ),
                                ),
                                child: Text(
                                  'Edit profile',
                                  style: TextStyle(
                                    color: !isDarkMode(context, ref)
                                        ? Colors.black
                                        : Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 200,
                              height: 50,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: Sizes.size12,
                                ),
                                decoration: BoxDecoration(
                                  color: !isDarkMode(context, ref)
                                      ? Colors.white
                                      : Colors.black,
                                  border:
                                      Border.all(color: Colors.grey, width: 1),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(6),
                                  ),
                                ),
                                child: Text(
                                  'Share profile',
                                  style: TextStyle(
                                    color: !isDarkMode(context, ref)
                                        ? Colors.black
                                        : Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gaps.v14,
                    ],
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate:
                      PersistentTabBar(ref: ref, tabController: _tabController),
                ),
              ];
            },
            body: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
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
                ListView.builder(
                  itemCount: posts2.length,
                  itemBuilder: (context, index) {
                    final post = posts2[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: post.type == PostType.text
                          ? TextPostWidget(post: post)
                          : ImagePostWidget(post: post),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
