import 'package:flutter/material.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/screens/features/main_navigation/screens/activity/widgets/activity_tile.dart';
import 'package:tictok_clone/screens/features/main_navigation/screens/activity/widgets/activity.dart';
import 'package:tictok_clone/screens/features/main_navigation/screens/activity/widgets/category_button.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  int _selectedIndex = 0;
  final List<String> categories = [
    'All',
    'Replies',
    'Mentions',
    'Verifications'
  ];

  final List<Activity> activities = [
    Activity(
        username: 'john_mobbin',
        stat: 'Mentioned you',
        message:
            'Here\'s a thread you should follow if you love botany @jane_mobbin',
        time: '4h',
        action: ''),
    Activity(
        username: 'john_mobbin',
        stat:
            'Starting out my gardening club with three gardening club with three',
        message: "Count me in",
        time: '4h',
        action: ''),
    Activity(
        username: 'the.plantdads',
        stat: 'Followed you',
        message: "",
        time: '5h',
        action: 'Following'),
    Activity(
        username: 'the.plantdads',
        stat: 'Definitely broken! 👀🌱🧵',
        time: '5h',
        action: '',
        message: ""),
    Activity(
        username: 'theberryjungle',
        stat: '👀🌱🧵',
        time: '5h',
        action: '',
        message: ""),
  ];
  void _onCategorySelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // 필요한 경우 _filterActivities() 등을 호출하여 목록을 필터링합니다.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(categories.length, (index) {
                  return Row(children: [
                    CategoryButton(
                      label: categories[index],
                      isSelected: _selectedIndex == index,
                      onTap: () => _onCategorySelected(index),
                    ),
                    const SizedBox(
                      width: 10,
                    )
                  ]);
                }),
              ),
            ),
          ),
          Gaps.v20,
          Expanded(
            child: ListView.builder(
              itemCount: activities.length,
              itemBuilder: (context, index) {
                final activity = activities[index];
                return ActivityTile(activity: activity);
              },
            ),
          ),
        ],
      ),
    );
  }
}
