import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/screens/features/authentication/cookie_screen.dart';
import 'package:tictok_clone/screens/features/authentication/login.dart';
import 'package:tictok_clone/screens/features/authentication/privacy_policy_screen.dart';
import 'package:tictok_clone/screens/features/authentication/signup_form_screen.dart';
import 'package:tictok_clone/screens/features/authentication/term_screen.dart';
import 'package:tictok_clone/screens/features/authentication/widgets/auth_button.dart';
import 'package:tictok_clone/screens/features/authentication/username_screen.dart';
import 'package:tictok_clone/screens/features/authentication/widgets/text_span_with_link.dart';

class CustomizeScreen extends StatefulWidget {
  final String? name;
  final String? contact;
  final String? birthday;

  const CustomizeScreen({super.key, this.name, this.contact, this.birthday});

  @override
  _CustomizeScreenState createState() => _CustomizeScreenState();
}

class _CustomizeScreenState extends State<CustomizeScreen> {
  late String name;
  late String contact;
  late String birthday;
  bool isSwitch = false;

  @override
  void initState() {
    super.initState();
    name = widget.name ?? '';
    contact = widget.contact ?? '';
    birthday = widget.birthday ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v80,
              const Center(
                child: FaIcon(
                  FontAwesomeIcons.twitter,
                  size: Sizes.size36,
                  color: Color.fromRGBO(79, 152, 233, 1),
                ),
              ),
              Gaps.v80,
              const Text(
                "Customize your experience",
                style: TextStyle(
                  fontSize: Sizes.size36 + Sizes.size2,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Gaps.v40,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Track where you see Twitter",
                    style: TextStyle(
                      fontSize: Sizes.size28,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const Text(
                    "content across the web",
                    style: TextStyle(
                      fontSize: Sizes.size28,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Gaps.v20,
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Twitter use this data to personalize your experience. This web browsing history will never be stored with your name, email, or phone number.",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Switch(
                        value: isSwitch,
                        onChanged: (value) {
                          setState(() {
                            isSwitch = value;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              Gaps.v40,
              RichText(
                text: TextSpan(
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                  children: [
                    const TextSpan(text: 'By signing up, you agree to our '),
                    TextSpanWithLink(
                      text: 'Terms',
                      url: Uri.parse('https://twitter.com/tos'),
                    ),
                    const TextSpan(text: ', '),
                    TextSpanWithLink(
                      text: 'Privacy Policy',
                      url: Uri.parse('https://twitter.com/privacy'),
                    ),
                    const TextSpan(text: ', and '),
                    TextSpanWithLink(
                      text: 'Cookie Use',
                      url: Uri.parse(
                          'https://help.twitter.com/en/rules-and-policies/twitter-cookies'),
                    ),
                    const TextSpan(
                      text:
                          '. Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy. ',
                    ),
                    TextSpanWithLink(
                      text: 'Learn more',
                      url: Uri.parse(
                          'https://help.twitter.com/en/rules-and-policies/twitter-privacy'),
                    ),
                  ],
                ),
              ),
              Gaps.v40,
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: GestureDetector(
          onTap: () => _onCreateAccountPressed(context),
          child: AuthButton(
            text: "Create account",
            icon: const FaIcon(
              FontAwesomeIcons.a,
              color: Colors.black,
              size: 0,
            ),
            backgroundColor: isSwitch ? Colors.black : Colors.grey,
            textColor: isSwitch ? Colors.white : Colors.grey,
          ),
        ),
      ),
    );
  }

  void _onCreateAccountPressed(BuildContext context) {
    if (isSwitch != false) {
      Navigator.pop(
        context,
        MaterialPageRoute(
          builder: (context) => SignupFormScreen(
              isPassed: true,
              name: widget.name,
              contact: widget.contact,
              birthday: widget.birthday),
        ),
      );
      setState(() {});
    }
  }
}
