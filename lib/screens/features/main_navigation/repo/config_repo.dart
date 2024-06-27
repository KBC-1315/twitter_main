import 'package:shared_preferences/shared_preferences.dart';

class ConfigRepository {
  static const String _darkmode = "darkmode";

  final SharedPreferences _preferences;

  ConfigRepository(this._preferences);

  Future<void> setDark(bool value) async {
    _preferences.setBool(_darkmode, value);
  }

  bool isDarked() {
    return _preferences.getBool(_darkmode) ?? false;
  }
}
