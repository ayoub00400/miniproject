import 'dart:ui';

import 'package:get/get.dart';

import '../../utils/app_storage.dart';
import 'resources/ar_ae.dart';
import 'resources/en_us.dart';

class LocalizationService extends Translations {
  // Default locale
  static const locale = Locale('en', 'US');

  // fallbackLocale saves the day when the locale gets in trouble
  static const fallbackLocale = Locale('en', 'US');

  // Supported languages
  // Needs to be same order with locales
  static final langs = ['English', 'Arabic'];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    const Locale('en', 'US'),
    const Locale('ar', 'AE'),
  ];

  // Keys and their translations
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {'en_US': enUs, 'ar_AE': arAe};

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    final locale = getLocaleFromLanguage(lang);
    Prefs.setString(SPKeys.Language, lang).then((value) {
      Get.updateLocale(locale);
    });
  }

  // Finds language in `langs` list and returns it as Locale
  Locale getLocaleFromLanguage(String lang) {
    Locale locale = Locale(lang);

    return locale;
  }

  Locale getCurrentLocale() {
    Locale defaultLocale;
    String? language = Prefs.getString(SPKeys.Language);
    if (language != null) {
      final locale = LocalizationService().getLocaleFromLanguage(language);

      defaultLocale = locale;
    } else {
      defaultLocale = fallbackLocale;
    }
    return defaultLocale;
  }

  String getCurrentLang() {
    String? language = Prefs.getString(SPKeys.Language);
    if (language == null) {
      return 'English';
    } else {
      return language;
    }
  }

  static void saveLanguage(langCode) {
    Prefs.setString(SPKeys.Language, langCode);
  }
}
