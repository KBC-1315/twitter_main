import 'package:flutter/material.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/screens/features/main_navigation/screens/home/report_screen.dart';
import 'package:tictok_clone/utils.dart';

class DetailViewScreen extends StatefulWidget {
  const DetailViewScreen({super.key});

  @override
  State<DetailViewScreen> createState() => _DetailViewScreenState();
}

class _DetailViewScreenState extends State<DetailViewScreen> {
  void _onThreeDotTap(BuildContext context) async {
    Navigator.pop(context);
    await showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => const ReportScreen());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.4, // 모달의 높이를 조정
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: !isDarkMode(context) ? Colors.white : Colors.black,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(Sizes.size14),
          topRight: Radius.circular(Sizes.size14),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Gaps.v12,
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: !isDarkMode(context) ? Colors.grey[300] : Colors.black,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Gaps.v20,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                color: !isDarkMode(context)
                    ? Colors.grey.shade200
                    : Colors.black38,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 20.0),
                    child: Text(
                      'Unfollow',
                      style: TextStyle(
                        fontSize: 18.0,
                        color:
                            !isDarkMode(context) ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Divider(
                      height: 1,
                      color: !isDarkMode(context) ? Colors.grey : Colors.white),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 20.0),
                    child: Text(
                      'Mute',
                      style: TextStyle(
                        fontSize: 18.0,
                        color:
                            !isDarkMode(context) ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Gaps.v20,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                color:
                    !isDarkMode(context) ? Colors.grey.shade200 : Colors.black,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 20.0),
                    child: Text(
                      'Hide',
                      style: TextStyle(
                        fontSize: 18.0,
                        color:
                            !isDarkMode(context) ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Divider(
                      height: 1,
                      color: !isDarkMode(context) ? Colors.grey : Colors.white),
                  GestureDetector(
                    onTap: () => _onThreeDotTap(context),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 20.0),
                      child: Text(
                        'Report',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
