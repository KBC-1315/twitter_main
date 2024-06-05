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

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void _onLoginTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const LoginScreen(),
    ));
  }

  void _onEmailTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const UsernameScreen(),
      ),
    );
  }

  void _onTermsPressed(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const TermScreen(),
      ),
    );
  }

  void _onPrivacyPressed(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const PrivacypolicyScreen(),
      ),
    );
  }

  void _onCookiePressed(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CookieScreen(),
      ),
    );
  }

  void _onCreateAccountPressed(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SignupFormScreen(isPassed: false),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size40,
          ),
          child: Column(
            children: [
              Gaps.v80,
              const FaIcon(
                FontAwesomeIcons.twitter,
                size: Sizes.size36,
                color: Color.fromRGBO(79, 152, 233, 1),
              ),
              Gaps.v80,
              Gaps.v80,
              const Text(
                "See what's happening in the world right now.",
                style: TextStyle(
                  fontSize: Sizes.size36 + Sizes.size2,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Gaps.v80,
              Gaps.v40,
              const AuthButton(
                icon: FaIcon(FontAwesomeIcons.google, size: Sizes.size28),
                text: "Continue with Google",
                textColor: Colors.black,
                backgroundColor: Colors.white,
              ),
              Gaps.v16,
              const AuthButton(
                icon: FaIcon(FontAwesomeIcons.apple, size: Sizes.size28),
                text: "Continue with Apple",
                textColor: Colors.black,
                backgroundColor: Colors.white,
              ),
              Gaps.v20,
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 1.0,
                    width: 500.0,
                    color: Colors.grey.shade400,
                  ),
                  Container(
                    width: 20,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: const Text(
                      "or",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Gaps.v10,
              GestureDetector(
                onTap: () => _onCreateAccountPressed(context),
                child: const AuthButton(
                    text: "Create account",
                    icon: FaIcon(FontAwesomeIcons.a,
                        color: Colors.black, size: 0),
                    backgroundColor: Colors.black,
                    textColor: Colors.white),
              ),
              Gaps.v48,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text("By signing up, you agree to out"),
                  Gaps.h6,
                  GestureDetector(
                      onTap: () => _onTermsPressed(context),
                      child: const Text(
                        "Terms",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      )),
                  const Text(","),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => _onPrivacyPressed(context),
                    child: const Text(
                      "Privacy Policy",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  const Text(", and "),
                  Gaps.h6,
                  GestureDetector(
                      onTap: () => _onCookiePressed(context),
                      child: const Text(
                        "Cookie Use",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      )),
                  const Text(","),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey.shade50,
        elevation: 2,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: Sizes.size20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Gaps.h24,
                const Text(
                  "Have an account already?",
                ),
                Gaps.h5,
                GestureDetector(
                  onTap: () => _onLoginTap(context),
                  child: const Text(
                    "Log in",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
