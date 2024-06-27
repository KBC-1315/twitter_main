import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tictok_clone/utils.dart';

class CategoryButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryButton({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 130,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: !isDarkMode(context)
              ? isSelected
                  ? Colors.black
                  : Colors.white
              : isSelected
                  ? Colors.white
                  : Colors.black,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: isSelected ? Colors.black : Colors.grey,
            width: 1.0,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 15,
            color: !isDarkMode(context)
                ? isSelected
                    ? Colors.white
                    : Colors.black
                : isSelected
                    ? Colors.black
                    : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
