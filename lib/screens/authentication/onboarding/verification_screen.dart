import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/screens/authentication/onboarding/password_screen.dart';

class VerificationScreen extends StatefulWidget {
  final String email;
  final String name;
  final String contact;
  final String birthday;

  const VerificationScreen({
    super.key,
    required this.email,
    required this.name,
    required this.contact,
    required this.birthday,
  });

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final List<TextEditingController> _codeControllers = List.generate(
    6,
    (index) => TextEditingController(),
  );

  bool _allFieldsFilled = false;

  @override
  void initState() {
    super.initState();
    for (var controller in _codeControllers) {
      controller.addListener(_checkFields);
    }
  }

  @override
  void dispose() {
    for (var controller in _codeControllers) {
      controller.removeListener(_checkFields);
      controller.dispose();
    }
    super.dispose();
  }

  void _checkFields() {
    setState(() {
      _allFieldsFilled =
          _codeControllers.every((controller) => controller.text.isNotEmpty);
    });
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onNextButtonPressed() {
    if (_allFieldsFilled) {
      Navigator.of(context).push(
        CupertinoPageRoute(
          builder: (context) => const PasswordScreen(),
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
                "We sent you a code",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Enter it below to verify\n${widget.email}",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 40),
              Form(
                key: _formKey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(6, (index) {
                    return SizedBox(
                      width: 40,
                      child: TextFormField(
                        controller: _codeControllers[index],
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 2),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 2),
                          ),
                        ),
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        obscureText: true,
                        onChanged: (value) {
                          if (value.length == 1 && index < 5) {
                            FocusScope.of(context).nextFocus();
                          } else if (value.isEmpty && index > 0) {
                            FocusScope.of(context).previousFocus();
                          }
                        },
                      ),
                    );
                  }),
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
