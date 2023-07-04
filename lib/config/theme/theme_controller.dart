import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_storage.dart';

class ThemeController extends GetxController {
  Rx<bool> darkMode = false.obs;

  void initTheme() {
    bool? checkTheme = Prefs.getBool('theme');
    if (checkTheme != null) {
      darkMode.value = checkTheme;
    } else {
      darkMode.value = false;
    }
  }

  void changeAppTheme(bool isDark) {
    if (isDark) {
      Prefs.setBool('theme', true);
      darkMode.value = true;
      Get.changeThemeMode(ThemeMode.dark);
    } else {
      Prefs.setBool('theme', false);
      darkMode.value = false;
      Get.changeThemeMode(ThemeMode.light);
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    initTheme();
  }
}
