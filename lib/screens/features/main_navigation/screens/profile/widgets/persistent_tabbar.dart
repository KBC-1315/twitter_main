import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/utils.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: PersistentTabBar(),
            pinned: true,
          ),
          // 다른 컨텐츠 추가
        ],
      ),
    );
  }
}

class PersistentTabBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Colors.grey.shade200,
            width: 1,
          ),
        ),
        color: !isDarkMode(context) ? Colors.white : Colors.black,
      ),
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.label,
        labelPadding: const EdgeInsets.only(
          bottom: Sizes.size20,
          top: Sizes.size20,
        ),
        indicatorColor: !isDarkMode(context) ? Colors.black : Colors.white,
        labelColor: !isDarkMode(context) ? Colors.white : Colors.black,
        unselectedLabelColor: Colors.grey,
        tabs: [
          Tab(
            child: Text(
              "Threads",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: !isDarkMode(context) ? Colors.black : Colors.white,
              ),
            ),
          ),
          Tab(
            child: Text(
              "Replies",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: !isDarkMode(context) ? Colors.black : Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true; // 변경된 설정을 반영하기 위해 true로 설정
  }
}
