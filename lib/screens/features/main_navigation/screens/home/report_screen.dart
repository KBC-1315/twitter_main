import 'package:flutter/material.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/utils.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final List<String> reportOptions = [
      "I just don't like it",
      "It's unlawful content under NetzDG",
      "It's spam",
      "Hate speech or symbols",
      "Nudity or sexual activity",
      "False information",
      "Harassment or bullying",
      "Scam or fraud"
          "Nudity or sexual activity",
      "False information",
      "Harassment or bullying",
      "Scam or fraud"
    ];

    void onNextTap() {
      Navigator.pop(context);
    }

    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: !isDarkMode(context) ? Colors.white : Colors.black,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(Sizes.size14),
          topRight: Radius.circular(Sizes.size14),
        ),
      ),
      child: Column(
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
          Gaps.v12,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Report",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Gaps.v12,
                Divider(
                  height: 1,
                  color: !isDarkMode(context) ? Colors.grey[300] : Colors.white,
                ),
                Gaps.v12,
                const Text(
                  "Why are you reporting this thread?",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gaps.v8,
                Text(
                  "Your report is anonymous, except if you're reporting an intellectual property infringement. If someone is in immediate danger, call the local emergency services - don't wait.",
                  style: TextStyle(
                    fontSize: 14,
                    color: !isDarkMode(context) ? Colors.grey : Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Gaps.v20,
          Expanded(
            child: Scrollbar(
              controller: _scrollController,
              thumbVisibility: false,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: reportOptions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      reportOptions[index],
                      style: const TextStyle(fontSize: 16),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: onNextTap,
                  );
                },
                separatorBuilder: (context, index) => const Divider(height: 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
