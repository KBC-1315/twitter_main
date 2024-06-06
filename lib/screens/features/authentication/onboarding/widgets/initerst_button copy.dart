import 'package:flutter/material.dart';
import 'package:tictok_clone/constants/sizes.dart';

class InterestButton extends StatefulWidget {
  const InterestButton({
    super.key,
    required this.interest,
  });

  final String interest;

  @override
  State<InterestButton> createState() => _InterestButtonState();
}

class _InterestButtonState extends State<InterestButton> {
  bool _isSeletcted = false;

  void _onTap() {
    setState(() {
      _isSeletcted = !_isSeletcted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 300,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size24,
          vertical: Sizes.size12,
        ),
        decoration: BoxDecoration(
          color: _isSeletcted ? Colors.blue : Colors.white,
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
        child: Text(
          widget.interest,
          style: TextStyle(
            color: _isSeletcted ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
