import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tictok_clone/screens/authentication/repos/authentication_repository.dart';
import 'package:tictok_clone/screens/authentication/sign_up_screen.dart';
import 'package:tictok_clone/screens/features/main_navigation/screens/activity/activity_screen.dart';
import 'package:tictok_clone/screens/features/main_navigation/screens/home/home_screen.dart';
import 'package:tictok_clone/screens/features/main_navigation/main_navigation_screen.dart';
import 'package:tictok_clone/screens/features/main_navigation/screens/profile/settings/privacy_screen.dart';
import 'package:tictok_clone/screens/features/main_navigation/screens/profile/profile_screen.dart';
import 'package:tictok_clone/screens/features/main_navigation/screens/profile/settings/setting_screen.dart';
import 'package:tictok_clone/screens/features/main_navigation/screens/search/search_screen.dart';

final routerProvider = Provider((ref) {
  // ref.watch(authStateStream);
  ref.read(authRepo);
  return GoRouter(
    initialLocation: "/home",
    redirect: (context, state) {
      final isLoggedIn = ref.read(authRepo).isLoggedIn;

      if (!isLoggedIn) {
        if (state.matchedLocation != "/SignUp" &&
            state.matchedLocation != "LogIn") {
          return "/";
        }
      }
      return "/home";
    },
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const SignUpScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) {
          return const MainNavigationScreen();
        },
        routes: [
          GoRoute(
            path: "/home",
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
          builder: (context, state) {
            return const SettingScreen();
          },
          routes: [
            GoRoute(
              path: "privacy",
              builder: (context, state) {
                return const PrivacyScreen();
              },
            ),
          ]),
    ],
  );
});
