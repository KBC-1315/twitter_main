import 'package:flutter/material.dart';
import 'package:tictok_clone/screens/features/main_navigation/models/config_model.dart';
import 'package:tictok_clone/screens/features/main_navigation/repo/config_repo.dart';

class ConfigViewModel extends ChangeNotifier {
  final ConfigRepository _configRepository;

  late final ConfigModel _configModel = ConfigModel(
    isDark: _configRepository.isDarked(),
  );

  ConfigViewModel(this._configRepository);

  bool get darked => _configModel.isDark;

  void setDarked(bool value) {
    _configRepository.setDark(value);
    _configModel.isDark = value;
    notifyListeners();
  }
}
