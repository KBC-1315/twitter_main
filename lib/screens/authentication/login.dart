import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/screens/authentication/customize_screen.dart';
import 'package:tictok_clone/screens/authentication/login_form_screen.dart';
import 'package:tictok_clone/screens/authentication/signup_form_screen.dart';
import 'package:tictok_clone/screens/authentication/sign_up_screen.dart';
import 'package:tictok_clone/screens/authentication/view_models/social_auth_view_model.dart';
import 'package:tictok_clone/screens/authentication/widgets/auth_button.dart';
import 'package:tictok_clone/screens/authentication/widgets/email_screen.dart';
import 'package:tictok_clone/screens/features/main_navigation/main_navigation_screen.dart';
import 'package:tictok_clone/screens/features/main_navigation/view_models/login_view_model.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  void onSignupTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  void onEmailLoginTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginFormScreen(),
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
              const Text(
                "Log in to TikTok",
                style: TextStyle(
                  fontSize: Sizes.size28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v20,
              const Text(
                "Create a profile, follow other counts, make your own videos, and more.",
                style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Colors.black45,
                ),
                textAlign: TextAlign.center,
              ),
              Gaps.v40,
              GestureDetector(
                onTap: () => onEmailLoginTap(context),
                child: const AuthButton(
                  icon: FaIcon(FontAwesomeIcons.user),
                  text: "Use email & password",
                  textColor: Colors.black,
                  backgroundColor: Colors.white,
                ),
              ),
              Gaps.v16,
              GestureDetector(
                onTap: () =>
                    ref.read(socialAuthProvider.notifier).githubSignIn(context),
                child: const AuthButton(
                  icon: FaIcon(FontAwesomeIcons.github),
                  text: "Continue with Github",
                  textColor: Colors.black,
                  backgroundColor: Colors.white,
                ),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                ),
                Gaps.h5,
                GestureDetector(
                  onTap: () => onSignupTap(context),
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor,
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
