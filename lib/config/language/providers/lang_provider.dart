import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/app_storage.dart';

var langProvider = StateNotifierProvider<LangProvider, String>((ref) => LangProvider());

class LangProvider extends StateNotifier<String> {
  String defaultLang = 'ar';

  LangProvider() : super('ar') {
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
