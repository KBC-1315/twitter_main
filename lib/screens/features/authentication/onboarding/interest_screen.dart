import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/screens/features/authentication/onboarding/finish_screen.dart';
import 'package:tictok_clone/screens/features/authentication/onboarding/interest_screen.dart';
import 'package:tictok_clone/screens/features/authentication/onboarding/widgets/initerst_button.dart';
import 'package:tictok_clone/screens/features/main_navigation/main_navigation_screen.dart';

enum Direction { right, left }

enum Page { first, second }

const musicList = [
  "Rap",
  "R&B & soul",
  "Grammy Awards",
  "Pop",
  "K-pop",
  "Hip hop",
];

const entertainList = [
  "Anime",
  "Movies & TV",
  "Harry Potter",
  "Marvel Universe",
  "Movie news",
  "Movies",
  "Grammy Awards",
];

const interests = [
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
];

class InterestScreen extends StatefulWidget {
  const InterestScreen({
    super.key,
  });

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  Set<String> _selectedInterests = {};
  final Set<String> _selectedMusics = {};
  final Set<String> _selectedEntertain = {};
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Page _showingPage = Page.first;

  void _onInterestTap(String interest) {
    setState(() {
      if (_selectedInterests.contains(interest)) {
        _selectedInterests.remove(interest);
      } else {
        _selectedInterests.add(interest);
      }
      print(_selectedInterests);
      print("Current length : {$_selectedInterests.length}");
    });
  }

  void _onMusicTap(String interest) {
    setState(() {
      if (_selectedMusics.contains(interest)) {
        _selectedMusics.remove(interest);
      } else {
        _selectedMusics.add(interest);
      }
      print(_selectedMusics);
    });
  }

  void _onEntertainTap(String interest) {
    setState(() {
      if (_selectedEntertain.contains(interest)) {
        _selectedEntertain.remove(interest);
      } else {
        _selectedEntertain.add(interest);
      }
      print(_selectedEntertain);
    });
  }

  void _onNextButtonPressed() {
    if (_selectedInterests.length >= 3) {
      print("3보다 많아요");
      setState(() {
        _showingPage = Page.second;
        _selectedInterests = {};
      });
    }
  }

  void _onfinalNextButtonPressed() {
    if ((_selectedEntertain.length + _selectedMusics.length) >= 3) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const MainNavigationScreen()),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size24,
          ),
          child: SafeArea(
            child: AnimatedCrossFade(
              firstChild: Scrollbar(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: Sizes.size24,
                      right: Sizes.size24,
                      bottom: Sizes.size16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 40),
                        const Text(
                          "What do you want to see on Twitter?",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Select at leat 3 interests to personalize your \n Twitter experience. They will be visible on \n your profile.",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[700],
                          ),
                        ),
                        const SizedBox(height: 40),
                        Wrap(
                          runSpacing: 15,
                          spacing: 15,
                          children: [
                            for (var interest in interests)
                              InterestButton(
                                interest: interest,
                                selectedInterests:
                                    _selectedInterests, // _selectedInterests 전달
                                onTap: () => _onInterestTap(
                                    interest), // onTap 콜백 정의 및 전달
                              ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              secondChild: Scrollbar(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: Sizes.size24,
                      right: Sizes.size24,
                      bottom: Sizes.size16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 40),
                        const Text(
                          "What do you want to see on Twitter?",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Interests are used to personalize your experience and will be visible on your profile.",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[700],
                          ),
                        ),
                        const SizedBox(height: 40),
                        const Text(
                          "Music",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        Gaps.v20,
                        Wrap(
                          runSpacing: 15,
                          spacing: 15,
                          children: [
                            for (var interest in musicList)
                              InterestButton(
                                interest: interest,
                                selectedInterests:
                                    _selectedMusics, // _selectedInterests 전달
                                onTap: () =>
                                    _onMusicTap(interest), // onTap 콜백 정의 및 전달
                              ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        const Text(
                          "Entertainment",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        Gaps.v20,
                        Wrap(
                          runSpacing: 15,
                          spacing: 15,
                          children: [
                            for (var interest in entertainList)
                              InterestButton(
                                interest: interest,
                                selectedInterests:
                                    _selectedEntertain, // _selectedInterests 전달
                                onTap: () => _onEntertainTap(
                                    interest), // onTap 콜백 정의 및 전달
                              ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              crossFadeState: _showingPage == Page.first
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(
                milliseconds: 300,
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size4,
              horizontal: Sizes.size4,
            ),
            child: AnimatedOpacity(
              duration: const Duration(
                milliseconds: 100,
              ),
              opacity: 1,
              child: CupertinoButton(
                  color: (_selectedInterests.length >= 3) ||
                          ((_selectedEntertain.length +
                                  _selectedMusics.length) >=
                              3)
                      ? Colors.blue
                      : Colors.grey,
                  onPressed:
                      ((_selectedEntertain.length + _selectedMusics.length) >=
                              3)
                          ? _onfinalNextButtonPressed
                          : _onNextButtonPressed,
                  child: const Text(
                    "Next",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
