import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tictok_clone/screens/features/main_navigation/view_models/config_vm.dart';

bool isDarkMode(BuildContext context) =>
    context.watch<ConfigViewModel>().darked;
