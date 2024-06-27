import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tictok_clone/screens/features/main_navigation/screens/activity/activity_screen.dart';
import 'package:tictok_clone/screens/features/main_navigation/screens/home/home_screen.dart';
import 'package:tictok_clone/screens/features/main_navigation/main_navigation_screen.dart';
import 'package:tictok_clone/screens/features/main_navigation/screens/profile/settings/privacy_screen.dart';
import 'package:tictok_clone/screens/features/main_navigation/screens/profile/profile_screen.dart';
import 'package:tictok_clone/screens/features/main_navigation/screens/profile/settings/setting_screen.dart';
import 'package:tictok_clone/screens/features/main_navigation/screens/search/search_screen.dart';

final router = GoRouter(
  initialLocation: "/",
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return const MainNavigationScreen();
      },
      routes: [
        GoRoute(
          path: "/",
          pageBuilder: (context, state) {
            return const NoTransitionPage(child: HomeScreen());
          },
        ),
        GoRoute(
          path: "/search",
          pageBuilder: (context, state) {
            return const NoTransitionPage(child: SearchScreen());
          },
        ),
        GoRoute(
          path: "/activity",
          pageBuilder: (context, state) {
            return const NoTransitionPage(child: ActivityScreen());
          },
        ),
        GoRoute(
          path: "/profile",
          pageBuilder: (context, state) {
            return const NoTransitionPage(child: UserProfileScreen());
          },
        ),
      ],
    ),
    GoRoute(
        path: "/setting",
        pageBuilder: (context, state) {
          return const NoTransitionPage(child: SettingScreen());
        },
        routes: [
          GoRoute(
            path: "privacy",
            pageBuilder: (context, state) {
              return const NoTransitionPage(child: PrivacyScreen());
            },
          ),
        ]),
  ],
);
