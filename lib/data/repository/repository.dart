import 'package:rick_and_morty/data/helpers/theme_types.dart';
import 'package:rick_and_morty/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class Repository {
  Repository() {
    init();
  }

  Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  SharedPreferences _prefs;

  ThemeType getThemeType() {
    final type = _prefs.getString(Constants.ThemeType);
    return type as ThemeType;
  }
}
