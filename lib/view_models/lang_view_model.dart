import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/app_storage.dart';

var langProvider = StateNotifierProvider<LangViewModel, String>((ref) => LangViewModel());

class LangViewModel extends StateNotifier<String> {
  String defaultLang = 'ar';

  LangViewModel() : super('ar') {
    initLang();
  }

  void initLang() {
    String? checkLang = Prefs.getString(SPKeys.Language);
    if (checkLang != null) {
      defaultLang = checkLang;
    }
    state = defaultLang;
  }

  void changeAppLang(String langCodeUsed) {
    if (defaultLang != langCodeUsed) {
      Prefs.setString('lang', langCodeUsed);
      defaultLang = langCodeUsed;
      state = defaultLang;
    }
  }
}
