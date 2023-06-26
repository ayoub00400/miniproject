import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeMode themeMode=ThemeMode.dark;
  ThemeCubit() : super(ThemeInitial());
  changeAppTheme(bool isDark){
    if(isDark){
themeMode=ThemeMode.dark;
    }else{
themeMode=ThemeMode.light;
    }
    emit(ThemeChanged());
  }
}
