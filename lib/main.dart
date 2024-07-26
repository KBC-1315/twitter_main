import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tictok_clone/amplifyconfiguration.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/firebase_options.dart';
import 'package:tictok_clone/router.dart';
import 'package:tictok_clone/screens/features/main_navigation/repo/config_repo.dart';
import 'package:tictok_clone/screens/features/main_navigation/view_models/config_vm.dart';
import 'package:tictok_clone/utils.dart';

Future<void> _configureAmplify() async {
  // Add any Amplify plugins you want to use
  final authPlugin = AmplifyAuthCognito();
  final storage = AmplifyStorageS3();
  await Amplify.addPlugins([authPlugin, storage]);

  // You can use addPlugins if you are going to be adding multiple plugins
  // await Amplify.addPlugins([authPlugin, analyticsPlugin]);

  // Once Plugins are added, configure Amplify
  // Note: Amplify can only be configured once.
  try {
    await Amplify.configure(amplifyconfig);
  } on AmplifyAlreadyConfiguredException {
    safePrint(
        "Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _configureAmplify();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final preferences = await SharedPreferences.getInstance();
  final repository = ConfigRepository(preferences);
  FirebaseAuth.instance.setLanguageCode('en');
  runApp(
    ProviderScope(
      overrides: [
        configProvider.overrideWith(() => ConfigViewModel(repository))
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(configProvider).isDark;

    return MaterialApp.router(
      routerConfig: ref.watch(routerProvider),
      title: 'Flutter Demo',
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor:
            !isDarkMode(context, ref) ? Colors.white : Colors.black,
        primaryColor: const Color(0xffe9435A),
        appBarTheme: AppBarTheme(
          foregroundColor:
              !isDarkMode(context, ref) ? Colors.black : Colors.white,
          backgroundColor:
              !isDarkMode(context, ref) ? Colors.white : Colors.black,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: !isDarkMode(context, ref) ? Colors.black : Colors.white,
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor:
            isDarkMode(context, ref) ? Colors.black : Colors.white,
        primaryColor: const Color(0xffe9435A),
        appBarTheme: AppBarTheme(
          foregroundColor:
              isDarkMode(context, ref) ? Colors.white : Colors.black,
          backgroundColor:
              isDarkMode(context, ref) ? Colors.black : Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: isDarkMode(context, ref) ? Colors.white : Colors.black,
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
