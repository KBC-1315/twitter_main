import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/screens/features/main_navigation/privacy_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _isLoading = false;

  void _logOut() async {
    setState(() {
      _isLoading = true;
    });

    // Simulate a network request
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });

    // Show an alert dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("로그아웃 완료",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("확인"),
          ),
        ],
      ),
    );
  }

  void _onPrivacyTap() {
    context.push("/setting/privacy");
  }

  final List<Map<String, dynamic>> _tabs = [
    {
      "title": "Follow and invite friends",
      "icon": FontAwesomeIcons.userPlus,
      "onTap": () {}
    },
    {
      "title": "Notifications",
      "icon": FontAwesomeIcons.solidBell,
      "onTap": () {}
    },
    {
      "title": "Privacy",
      "icon": FontAwesomeIcons.lock,
      "onTap": (BuildContext context) {
        context.push("/setting/privacy");
      }
    },
    {"title": "Account", "icon": FontAwesomeIcons.solidUser, "onTap": () {}},
    {"title": "Help", "icon": FontAwesomeIcons.lifeRing, "onTap": () {}},
    {"title": "About", "icon": FontAwesomeIcons.circleInfo, "onTap": () {}}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Settings',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.arrow_back, color: Colors.black),
                SizedBox(width: 5), // 아이콘과 텍스트 사이의 간격
                Text(
                  'Back',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            onPressed: () {
              // 뒤로 가기 동작을 정의
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white,
          elevation: 0, // 그림자 제거
          titleSpacing: 0, // 타이틀의 위치를 조정
          leadingWidth: 100, // leading 위젯의 너비를 설정
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(6),
              bottomRight: Radius.circular(6),
            ),
          ),
          child: Column(
            children: _tabs.map((tab) {
              return ListTile(
                title: Row(
                  children: [
                    Gaps.h20,
                    FaIcon(
                      tab["icon"],
                      color: Colors.black,
                      size: 16,
                    ),
                    Gaps.h20,
                    Text(
                      tab["title"],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                onTap: () => tab["onTap"](context),
              );
            }).toList(),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
            child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: _logOut,
                child: const Text(
                  'Log out',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
              ),
              if (_isLoading)
                const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                    color: Colors.grey,
                  ),
                ),
            ],
          ),
        )));
  }
}
