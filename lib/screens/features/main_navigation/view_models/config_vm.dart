import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictok_clone/screens/features/main_navigation/models/config_model.dart';
import 'package:tictok_clone/screens/features/main_navigation/repo/config_repo.dart';

class ConfigViewModel extends Notifier<ConfigModel> {
  final ConfigRepository configRepository;

  ConfigViewModel(this.configRepository);

  void setDarked(bool value) {
    configRepository.setDark(value);
    state = ConfigModel(isDark: value);
  }

  @override
  build() {
    return ConfigModel(isDark: configRepository.isDarked());
  }
}

final configProvider = NotifierProvider<ConfigViewModel, ConfigModel>(
    () => throw UnimplementedError());
