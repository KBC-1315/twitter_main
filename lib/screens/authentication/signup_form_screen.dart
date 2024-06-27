import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/screens/authentication/customize_screen.dart';
import 'package:tictok_clone/screens/authentication/onboarding/verification_screen.dart';
import 'package:tictok_clone/screens/authentication/widgets/auth_button.dart';
import 'package:tictok_clone/screens/authentication/widgets/form_button.dart';
import 'package:tictok_clone/screens/authentication/widgets/text_span_with_link.dart';

// ignore: must_be_immutable
class SignupFormScreen extends StatefulWidget {
  bool? isPassed;
  String? name;
  String? contact;
  String? birthday;
  SignupFormScreen(
      {super.key, this.isPassed, this.name, this.contact, this.birthday});

  @override
  State<SignupFormScreen> createState() => _SignupFormScreenState();
}

class _SignupFormScreenState extends State<SignupFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, String> formData = {};

  String _name = "";
  String _contact = "";
  String _birthday = "";

  void _onSubmitTap(BuildContext context) {
    widget.isPassed = true;
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CustomizeScreen(
                name: _name, contact: _contact, birthday: _birthday)));
      }
    }
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  DateTime initialDate = DateTime.now();
  bool _showDatepicker = false;

  void _onCancelTap() {
    Navigator.of(context).pop();
  }

  void _onBirthdayTap() {
    FocusScope.of(context).unfocus();
    _showDatepicker = true;
    setState(() {});
  }

  bool _okSubmit = false;

  @override
  void initState() {
    super.initState();
    _setTextFieldDate(initialDate);
    _nameController.addListener(() {
      setState(() {
        _name = _nameController.text;
        _isOKtoSubmit();
      });
    });
    _contactController.addListener(() {
      setState(() {
        _contact = _contactController.text;
        _isOKtoSubmit();
      });
    });
    _birthdayController.addListener(() {
      setState(() {
        _birthday = _birthdayController.text;
        _isOKtoSubmit();
      });
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _contactController.dispose();
    _birthdayController.dispose();
    super.dispose();
  }

  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(" ").first;
    _birthdayController.value = TextEditingValue(text: textDate);
    _isOKtoSubmit();
  }

  String? _isnameValid() {
    if (_name.isNotEmpty) return null;
    return "Please enter your name";
  }

  void _isOKtoSubmit() {
    _okSubmit = _isName() && _isContact() && _isbirthday();
    setState(() {});
  }

  bool _isName() {
    return _name.isNotEmpty;
  }

  bool _isContact() {
    if (_contact.isEmpty) return false;
    final regExp2 = RegExp(r"^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$");
    final regExp = RegExp(
        r"^([A-Z|a-z|0-9](.|_){0,1})+[A-Z|a-z|0-9]@([A-Z|a-z|0-9])+((.){0,1}[A-Z|a-z|0-9]){2}.[a-z]{2,3}");
    return regExp.hasMatch(_contact) || regExp2.hasMatch(_contact);
  }

  bool _isbirthday() {
    return _birthday.isNotEmpty;
  }

  String? _iscontactValid() {
    if (_contact.isEmpty) return null;
    final regExp2 = RegExp(r"^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$");
    final regExp = RegExp(
        r"^([A-Z|a-z|0-9](.|_){0,1})+[A-Z|a-z|0-9]@([A-Z|a-z|0-9])+((.){0,1}[A-Z|a-z|0-9]){2}.[a-z]{2,3}");
    if (!regExp.hasMatch(_contact) && !regExp2.hasMatch(_contact)) {
      return "Email or Phone number not valid";
    }
    return null;
  }

  String? _isbirthdayValid() {
    if (_birthday.isNotEmpty) return null;
    return "Please enter your birthday";
  }

  void _onScaffoldTap() {
    setState(() {
      _showDatepicker = false;
    });
    FocusScope.of(context).unfocus();
  }

  void _onSignupTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VerificationScreen(
          name: _name,
          birthday: _birthday,
          email: _contact,
          contact: _contact,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(widget.isPassed);
    return GestureDetector(
      onTap: () => _onScaffoldTap(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Create account"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size36,
          ),
          child: Column(
            children: [
              FractionallySizedBox(
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () => _onCancelTap(),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          alignment: Alignment.center,
                          width: 80,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          child: const Text("Cancel",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              )),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: const FaIcon(
                        FontAwesomeIcons.twitter,
                        size: Sizes.size36,
                        color: Color.fromRGBO(79, 152, 233, 1),
                      ),
                    ),
                  ],
                ),
              ),
              Gaps.v40,
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Create your account",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Gaps.v28,
                    TextFormField(
                      enabled: widget.isPassed == false,
                      controller: _nameController,
                      autocorrect: false,
                      decoration: InputDecoration(
                        errorText: _isnameValid(),
                        suffixIcon: FaIcon(
                          _isName()
                              ? FontAwesomeIcons.circleCheck
                              : FontAwesomeIcons.circleStop,
                          size: Sizes.size36,
                          color: _isName() ? Colors.green : Colors.red,
                        ),
                        hintText: "Name",
                      ),
                      validator: (value) {
                        return null;
                      },
                      onSaved: (newValue) {
                        if (newValue != null) {
                          formData["Name"] = newValue;
                        }
                      },
                    ),
                    Gaps.v16,
                    TextFormField(
                      enabled: widget.isPassed == false,
                      onEditingComplete: () => _onSubmitTap(context),
                      keyboardType: TextInputType.emailAddress,
                      controller: _contactController,
                      autocorrect: false,
                      decoration: InputDecoration(
                        hintText: "Phone number or email address",
                        errorText: _iscontactValid(),
                        suffixIcon: FaIcon(
                          _isContact()
                              ? FontAwesomeIcons.circleCheck
                              : FontAwesomeIcons.circleStop,
                          size: Sizes.size36,
                          color: _isContact() ? Colors.green : Colors.red,
                        ),
                      ),
                      validator: (value) {
                        return null;
                      },
                      onSaved: (newValue) {
                        if (newValue != null) {
                          formData["phone_or_email"] = newValue;
                        }
                      },
                    ),
                    Gaps.v16,
                    GestureDetector(
                      onTap: _onBirthdayTap,
                      child: TextFormField(
                        enabled: false,
                        controller: _birthdayController,
                        autocorrect: false,
                        decoration: InputDecoration(
                          hintText: "Date of birth",
                          errorText: _isbirthdayValid(),
                          suffixIcon: FaIcon(
                            _isbirthday()
                                ? FontAwesomeIcons.circleCheck
                                : FontAwesomeIcons.circleStop,
                            size: Sizes.size36,
                            color: _isbirthday() ? Colors.green : Colors.red,
                          ),
                        ),
                        validator: (value) {
                          return null;
                        },
                        onSaved: (newValue) {
                          if (newValue != null) {
                            formData["birthday"] = newValue;
                          }
                        },
                      ),
                    ),
                    Gaps.v28,
                    GestureDetector(
                        onTap: () => _onSubmitTap(context),
                        child: (widget.isPassed != true)
                            ? FormButton(disabled: !_okSubmit)
                            : const Text("")),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: (widget.isPassed != true)
            ? BottomAppBar(
                height: _showDatepicker ? 300 : 0,
                child: SizedBox(
                    child: CupertinoDatePicker(
                  maximumDate: initialDate,
                  initialDateTime: initialDate,
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: (date) {
                    _setTextFieldDate(date);
                  },
                )))
            : Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  height: 250,
                  child: Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black),
                          children: [
                            const TextSpan(
                                text: 'By signing up, you agree to our '),
                            TextSpanWithLink(
                              text: 'Terms of Service',
                              url: Uri.parse('https://twitter.com/tos'),
                            ),
                            const TextSpan(text: 'and '),
                            TextSpanWithLink(
                              text: 'Privacy Policy',
                              url: Uri.parse('https://twitter.com/privacy'),
                            ),
                            const TextSpan(text: ', including '),
                            TextSpanWithLink(
                              text: 'Cookie Use',
                              url: Uri.parse(
                                  'https://help.twitter.com/en/rules-and-policies/twitter-cookies'),
                            ),
                            const TextSpan(
                              text:
                                  '. Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy, like keeping your account secure and personlalizing our services, including ads. ',
                            ),
                            TextSpanWithLink(
                              text: 'Learn more',
                              url: Uri.parse(
                                  'https://help.twitter.com/en/rules-and-policies/twitter-privacy'),
                            ),
                            const TextSpan(
                                text:
                                    ". Others will be able to find you by email or phone number, when provided, unless you choose otherwise "),
                            TextSpanWithLink(
                              text: "here",
                              url: Uri.parse(
                                  'https://help.twitter.com/en/rules-and-policies/twitter-privacy'),
                            ),
                            const TextSpan(text: "."),
                          ],
                        ),
                      ),
                      Gaps.v20,
                      GestureDetector(
                        onTap: _onSignupTap,
                        child: const AuthButton(
                            text: "Sign up",
                            icon: FaIcon(FontAwesomeIcons.a, size: 0),
                            backgroundColor: Colors.blue,
                            textColor: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
