import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/app_storage.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/app_storage.dart';

var themeProvider =
    StateNotifierProvider<ThemeProvider, bool>((ref) => ThemeProvider());

class ThemeProvider extends StateNotifier<bool> {
  bool darkMode = false;

  ThemeProvider() : super(false) {
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
