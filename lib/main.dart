import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import 'package:mini_project_app/shared/internal_storage/app_storage.dart';

import 'package:mini_project_app/shared/localisation/cubit/lang_cubit.dart';
import 'package:mini_project_app/shared/theming/cubit/theme_cubit.dart';

import 'modules/login_page/login_page.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await AppStorage.initStorageInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  

  

  
  @override
  Widget build(BuildContext context) {
    return 
                 MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit()..initTheme(),
        ),
        BlocProvider(
          create: (context) => LangCubit()..initLang(),
        )
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(builder: (context, stateTheme) {
        return BlocBuilder<LangCubit, LangState>(
          builder: (context, stateLang) {
            
            return  MaterialApp(
                  themeMode: context.watch<ThemeCubit>().darkMode?ThemeMode.dark:ThemeMode.light,
                  theme: ThemeData.light(),
                  darkTheme: ThemeData.dark(),
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: const [
                    Locale('en'), // English
                    Locale('ar'), // arabic
                  ],
                  locale: Locale(BlocProvider.of<LangCubit>(context).defaultLang),
                  home: LoginPage()
      );});
          },
        ));
      
    

              
              }
  
}
