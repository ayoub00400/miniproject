import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:mini_project_app/shared/internal_storage/app_storage.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
   bool darkMode=false;
  ThemeCubit() : super(ThemeInitial());
  initTheme(){
    bool? checkTheme= AppStorage.storageInstance!.getBool('theme');
    if(checkTheme != null){
      darkMode=checkTheme;
      
    }else{
      darkMode=false;
    }
  }
  changeAppTheme(bool isDark){
    if(isDark){

      AppStorage.storageInstance!.setBool("theme",true );
      darkMode=true;
    }else{
      AppStorage.storageInstance!.setBool("theme",false );
      darkMode=false;
    }
    emit(ThemeChanged());
  }
}
