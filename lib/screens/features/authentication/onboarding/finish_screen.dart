import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FinishScreen extends StatelessWidget {
  const FinishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
      child: Text("Assignment Finished",
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.w800)),
    ));
  }
}
