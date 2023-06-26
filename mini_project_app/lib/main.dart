import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mini_project_app/shared/theming/theming.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:mini_project_app/modules/login/loginpage.dart';
import 'package:mini_project_app/shared/internationalisme/cubit/lang_cubit.dart';
import 'package:mini_project_app/shared/theming/cubit/theme_cubit.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  ThemeMode appThemeMode = ThemeMode.light;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => LangCubit(),
        )
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(builder: (context, stateTheme) {
        return BlocBuilder<LangCubit, LangState>(
          builder: (context, stateLang) {
            print(stateTheme.toString());
            return MaterialApp(
                themeMode: context.watch<ThemeCubit>().themeMode,
                theme: ThemeData.light(),
                darkTheme: ThemeData.dark(),
                debugShowCheckedModeBanner: false,
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: [
                  Locale('en'), // English
                  Locale('ar'), // arabic
                ],
                locale: Locale(BlocProvider.of<LangCubit>(context).defaultLang),
                home: LoginPage());
          },
        );
      }),
    );
  }
}
