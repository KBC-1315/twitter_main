import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictok_clone/screens/features/main_navigation/view_models/config_vm.dart';

bool isDarkMode(BuildContext context, WidgetRef ref) =>
    ref.watch(configProvider).isDark;

void showFirebaseErrorSnack(
  BuildContext context,
  Object? error,
) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        (error as FirebaseException).message ?? "Something went wrong",
      ),
    ),
  );
}
