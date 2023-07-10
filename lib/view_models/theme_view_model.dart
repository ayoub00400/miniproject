import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/app_storage.dart';

var themeProvider = StateNotifierProvider<ThemeViewModel, bool>((ref) => ThemeViewModel());

class ThemeViewModel extends StateNotifier<bool> {
  bool darkMode = false;

  ThemeViewModel() : super(false) {
    initTheme();
  }

  void initTheme() {
    bool? checkTheme = Prefs.getBool('theme');
    if (checkTheme != null) {
      darkMode = checkTheme;
    }
    state = darkMode;
  }

  void changeAppTheme(bool isDark) {
    if (isDark) {
      Prefs.setBool('theme', true);
      darkMode = true;
      state = darkMode;
    } else {
      Prefs.setBool('theme', false);
      darkMode = false;
      state = darkMode;
    }
  }
}
