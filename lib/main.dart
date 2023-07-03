import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'config/language/cubit/lang_cubit.dart';
import 'config/theme/cubit/theme_cubit.dart';
import 'view/screens/login_page/login_page.dart';
import 'utils/app_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ThemeCubit()..initTheme(),
          ),
          BlocProvider(
            create: (context) => LangCubit()..initLang(),
          )
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, stateTheme) {
            return BlocBuilder<LangCubit, LangState>(
                builder: (context, stateLang) {
              return MaterialApp(
                  themeMode: context.watch<ThemeCubit>().darkMode
                      ? ThemeMode.dark
                      : ThemeMode.light,
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
                  locale:
                      Locale(BlocProvider.of<LangCubit>(context).defaultLang),
                  home: LoginPage());
            });
          },
        ));
  }
}
