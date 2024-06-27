import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/utils.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  bool _isPrivateProfile = false;

  final List<Map<String, dynamic>> _tabs = [
    {
      "title": "Private profile",
      "icon": FontAwesomeIcons.lock,
      "premessage": "",
      "preitem": Switch(
        value: false,
        onChanged: (value) {},
      ),
    },
    {
      "title": "Mentions",
      "icon": FontAwesomeIcons.at,
      "premessage": "Everyone",
      "preitem": const Icon(Icons.arrow_forward_ios, size: 16),
    },
    {
      "title": "Muted",
      "icon": FontAwesomeIcons.bellSlash,
      "premessage": "",
      "preitem": const Icon(Icons.arrow_forward_ios, size: 16),
    },
    {
      "title": "Hidden Words",
      "icon": FontAwesomeIcons.eyeSlash,
      "premessage": "",
      "preitem": const Icon(Icons.arrow_forward_ios, size: 16),
    },
    {
      "title": "Profiles you follow",
      "icon": FontAwesomeIcons.userGroup,
      "premessage": "",
      "preitem": const Icon(Icons.arrow_forward_ios, size: 16),
    },
  ];

  final List<Map<String, dynamic>> _tabs2 = [
    {
      "title": "Blocked profiles",
      "icon": FontAwesomeIcons.stop,
      "premessage": "",
      "preitem": const Icon(Icons.open_in_new, size: 16),
    },
    {
      "title": "Hide likes",
      "icon": FontAwesomeIcons.eyeSlash,
      "premessage": "",
      "preitem": const Icon(Icons.open_in_new, size: 16),
    },
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
          icon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.arrow_back,
                  color: !isDarkMode(context) ? Colors.black : Colors.white),
              const SizedBox(width: 5),
              Text(
                'Back',
                style: TextStyle(
                    color: !isDarkMode(context) ? Colors.black : Colors.white),
              ),
            ],
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: !isDarkMode(context) ? Colors.white : Colors.black,
        elevation: 0,
        titleSpacing: 0,
        leadingWidth: 100,
      ),
      body: Container(
        color: !isDarkMode(context) ? Colors.white : Colors.black,
        child: ListView(
          children: [
            // First list
            ..._tabs.map((tab) {
              return Column(
                children: [
                  ListTile(
                    leading: (tab["icon"] == null)
                        ? const SizedBox.shrink()
                        : FaIcon(
                            tab["icon"],
                            color: !isDarkMode(context)
                                ? Colors.black
                                : Colors.white,
                            size: 24,
                          ),
                    title: Text(
                      tab["title"],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: tab["preitem"] ?? const SizedBox.shrink(),
                    subtitle: tab["premessage"] != ""
                        ? Text(
                            tab["premessage"],
                            style: TextStyle(color: Colors.grey[600]),
                          )
                        : null,
                    onTap: () {
                      if (tab["title"] == "Private profile") {
                        setState(() {
                          _isPrivateProfile = !_isPrivateProfile;
                        });
                      }
                    },
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
                ],
              );
            }),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Other privacy settings",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Some settings, like restrict, apply to both Threads and Instagram and can be managed on Instagram.",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.open_in_new,
                    color: Colors.grey,
                    size: 24,
                  ),
                ],
              ),
            ),

            // Second list
            ..._tabs2.map((tab) {
              return Column(
                children: [
                  ListTile(
                    leading: (tab["icon"] == null)
                        ? const SizedBox.shrink()
                        : FaIcon(
                            tab["icon"],
                            color: !isDarkMode(context)
                                ? Colors.black
                                : Colors.white,
                            size: 24,
                          ),
                    title: Text(
                      tab["title"],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: tab["preitem"] ?? const SizedBox.shrink(),
                    subtitle: tab["premessage"] != ""
                        ? Text(
                            tab["premessage"],
                            style: TextStyle(color: Colors.grey[600]),
                          )
                        : null,
                    onTap: () {},
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
