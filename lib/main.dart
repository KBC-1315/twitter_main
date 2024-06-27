import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/router.dart';
import 'package:tictok_clone/screens/features/main_navigation/repo/config_repo.dart';
import 'package:tictok_clone/screens/features/main_navigation/view_models/config_vm.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final preferences = await SharedPreferences.getInstance();
  final repository = ConfigRepository(preferences);

  GoRouter.optionURLReflectsImperativeAPIs = true;
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => ConfigViewModel(repository),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ConfigViewModel>(
      builder: (context, config, _) {
        return MaterialApp.router(
          routerConfig: router,
          title: 'Flutter Demo',
          themeMode: config.darked ? ThemeMode.dark : ThemeMode.light,
          theme: ThemeData(
            brightness: Brightness.light,
            scaffoldBackgroundColor: Colors.white,
            primaryColor: const Color(0xffe9435A),
            appBarTheme: const AppBarTheme(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              elevation: 0,
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: Sizes.size16 + Sizes.size2,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: Colors.black,
            primaryColor: const Color(0xffe9435A),
            appBarTheme: const AppBarTheme(
              foregroundColor: Colors.white,
              backgroundColor: Colors.black,
              elevation: 0,
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: Sizes.size16 + Sizes.size2,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      },
    );
  }
}
