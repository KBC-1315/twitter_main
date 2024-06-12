import 'package:flutter/material.dart';

Widget buildMenuItem(BuildContext context, String text, {bool isRed = false}) {
  return Container(
    alignment: Alignment.center,
    width: 400,
    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
    decoration: BoxDecoration(
      color: Colors.grey.shade300,
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 18.0,
        color: isRed ? Colors.red : Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
