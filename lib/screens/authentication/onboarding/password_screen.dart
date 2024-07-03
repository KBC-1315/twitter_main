import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/screens/authentication/onboarding/interest_screen.dart';
import 'package:tictok_clone/screens/authentication/view_models/signup_view_model.dart';

class PasswordScreen extends ConsumerStatefulWidget {
  const PasswordScreen({
    super.key,
  });

  @override
  ConsumerState<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends ConsumerState<PasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();

  String _password = "";
  bool _obscureText = true;
  bool _allFieldsFilled = false;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
        _allFieldsFilled = _password.length >= 8;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _onClearTap() {
    _passwordController.clear();
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onNextButtonPressed() {
    if (_allFieldsFilled) {
      final state = ref.read(signUpForm.notifier).state;
      ref.read(signUpForm.notifier).state = {
        ...state,
        "password": _password,
      };
      Navigator.of(context).push(
        CupertinoPageRoute(
          builder: (context) => const InterestScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const FaIcon(
            FontAwesomeIcons.twitter,
            color: Color.fromRGBO(79, 152, 233, 1),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Text(
                "You will need a password",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Make sure it's 8 chars or more",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 40),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextField(
                      obscureText: _obscureText,
                      controller: _passwordController,
                      autocorrect: false,
                      decoration: InputDecoration(
                        suffix: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: _onClearTap,
                              child: FaIcon(
                                FontAwesomeIcons.solidCircleXmark,
                                color: Colors.grey.shade500,
                                size: Sizes.size20,
                              ),
                            ),
                            Gaps.h16,
                            GestureDetector(
                              onTap: _toggleObscureText,
                              child: FaIcon(
                                _obscureText
                                    ? FontAwesomeIcons.eye
                                    : FontAwesomeIcons.eyeSlash,
                                color: Colors.grey.shade500,
                                size: Sizes.size20,
                              ),
                            ),
                            Gaps.h16,
                            if (_password.length >= 8)
                              const FaIcon(
                                FontAwesomeIcons.circleCheck,
                                color: Colors.green,
                                size: 20,
                              ),
                          ],
                        ),
                        hintText: "Make it strong",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                      cursorColor: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              if (_allFieldsFilled)
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 30,
                    ),
                  ],
                ),
              const SizedBox(height: 20),
              Center(
                child: CupertinoButton(
                  color: CupertinoColors.activeBlue,
                  onPressed: _allFieldsFilled ? _onNextButtonPressed : null,
                  child: const Text("Next"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
