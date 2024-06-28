import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:tictok_clone/screens/features/main_navigation/view_models/config_vm.dart';

bool isDarkMode(BuildContext context, WidgetRef ref) =>
    ref.watch(configProvider).isDark;
