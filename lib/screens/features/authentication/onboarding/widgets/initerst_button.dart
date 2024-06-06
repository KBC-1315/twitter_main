import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/constants/sizes.dart';

class InterestButton extends StatefulWidget {
  const InterestButton({
    super.key,
    required this.interest,
    required this.selectedInterests, // 추가: 선택된 관심사 집합
    required this.onTap, // 추가: 탭 콜백
  });

  final String interest;
  final Set<String> selectedInterests; // 추가
  final VoidCallback onTap; // 추가

  @override
  State<InterestButton> createState() => _InterestButtonState();
}

class _InterestButtonState extends State<InterestButton> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = widget.selectedInterests.contains(widget.interest);

    return GestureDetector(
      onTap: widget.onTap, // onTap 콜백 전달
      child: AnimatedContainer(
        width: 180,
        height: 100,
        duration: const Duration(
          milliseconds: 300,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size24,
          vertical: Sizes.size12,
        ),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          border: Border.all(
            color: Colors.black.withOpacity(0.1),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              spreadRadius: 5,
            ),
          ],
          borderRadius: BorderRadius.circular(Sizes.size32),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  widget.interest,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  (isSelected)
                      ? const FaIcon(
                          FontAwesomeIcons.circleCheck,
                          color: Colors.white,
                          size: Sizes.size24,
                        )
                      : const FaIcon(FontAwesomeIcons.a, size: 0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
