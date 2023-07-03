import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/app_storage.dart';

part 'lang_state.dart';

class LangCubit extends Cubit<LangState> {
  String defaultLang = 'ar';
  LangCubit() : super(LangInitial());

  void initLang() {
    String? checkLang = Prefs.getString(SPKeys.Language);
    if (checkLang != null) {
      defaultLang = checkLang;
    } else {
      defaultLang = 'ar';
    }
  }

  void changeAppLang(String langCodeUsed) {
    if (defaultLang != langCodeUsed) {
      Prefs.setString('lang', langCodeUsed);
      defaultLang = langCodeUsed;
      emit(LangChanged());
    }
  }
}
