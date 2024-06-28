import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/utils.dart';

class PersistentTabBar extends SliverPersistentHeaderDelegate {
  final WidgetRef ref;
  final TabController tabController;

  PersistentTabBar({required this.ref, required this.tabController});

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
        color: !isDarkMode(context, ref) ? Colors.white : Colors.black,
      ),
      child: TabBar(
        controller: tabController,
        indicatorSize: TabBarIndicatorSize.label,
        labelPadding: const EdgeInsets.only(
          bottom: Sizes.size20,
          top: Sizes.size20,
        ),
        indicatorColor: !isDarkMode(context, ref) ? Colors.black : Colors.white,
        labelColor: !isDarkMode(context, ref) ? Colors.black : Colors.white,
        unselectedLabelColor: Colors.grey,
        tabs: const [
          Tab(
            child: Text(
              "Threads",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Tab(
            child: Text(
              "Replies",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
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
