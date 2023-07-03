import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../internal_storage/app_storage.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  bool darkMode = false;
  ThemeCubit() : super(ThemeInitial());
  void initTheme() {
    bool? checkTheme = AppStorage.storageInstance!.getBool('theme');
    if (checkTheme != null) {
      darkMode = checkTheme;
    } else {
      darkMode = false;
    }
  }

  void changeAppTheme(bool isDark) {
    if (isDark) {
      AppStorage.storageInstance!.setBool('theme', true);
      darkMode = true;
    } else {
      AppStorage.storageInstance!.setBool('theme', false);
      darkMode = false;
    }
    emit(ThemeChanged());
  }
}
