import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/screens/features/main_navigation/screens/profile/settings/privacy_screen.dart';
import 'package:tictok_clone/screens/features/main_navigation/view_models/config_vm.dart';
import 'package:tictok_clone/utils.dart';

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
        backgroundColor: !isDarkMode(context) ? Colors.white : Colors.black,
        appBar: AppBar(
          title: const Text(
            'Settings',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.arrow_back,
                    color: !isDarkMode(context) ? Colors.black : Colors.white),
                const SizedBox(width: 5), // 아이콘과 텍스트 사이의 간격
                Text(
                  'Back',
                  style: TextStyle(
                      color:
                          !isDarkMode(context) ? Colors.black : Colors.white),
                ),
              ],
            ),
            onPressed: () {
              // 뒤로 가기 동작을 정의
              Navigator.pop(context);
            },
          ),
          backgroundColor: !isDarkMode(context) ? Colors.white : Colors.black,
          elevation: 0, // 그림자 제거
          titleSpacing: 0, // 타이틀의 위치를 조정
          leadingWidth: 100, // leading 위젯의 너비를 설정
        ),
        body: Container(
            decoration: BoxDecoration(
              color: !isDarkMode(context) ? Colors.white : Colors.black,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(6),
                bottomRight: Radius.circular(6),
              ),
            ),
            child: Column(
              children: [
                ListTile(
                  title: Row(
                    children: [
                      Gaps.h16,
                      Gaps.h2,
                      FaIcon(
                        !isDarkMode(context)
                            ? FontAwesomeIcons.sun
                            : FontAwesomeIcons.moon,
                        color:
                            !isDarkMode(context) ? Colors.black : Colors.white,
                        size: 20,
                      ),
                      Gaps.h14,
                      Text(
                        !isDarkMode(context) ? "Light Mode" : "Dark Mode",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: !isDarkMode(context)
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ],
                  ),
                  trailing: Switch(
                    value: context.watch<ConfigViewModel>().darked,
                    onChanged: (value) {
                      context.read<ConfigViewModel>().setDarked(value);
                      setState(() {});
                    },
                    activeColor:
                        !isDarkMode(context) ? Colors.black : Colors.white,
                  ),
                  onTap: () {
                    bool currentMode = context.read<ConfigViewModel>().darked;
                    context.read<ConfigViewModel>().setDarked(!currentMode);
                    setState(() {});
                  },
                ),
                ..._tabs.map((tab) {
                  return ListTile(
                    title: Row(
                      children: [
                        Gaps.h20,
                        FaIcon(
                          tab["icon"],
                          color: !isDarkMode(context)
                              ? Colors.black
                              : Colors.white,
                          size: 16,
                        ),
                        Gaps.h20,
                        Text(
                          tab["title"],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: !isDarkMode(context)
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                      ],
                    ),
                    onTap: () => tab["onTap"](context),
                  );
                }),
              ],
            )),
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
