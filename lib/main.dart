import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'config/language/localization_service.dart';
import 'config/theme/theme_controller.dart';
import 'utils/app_storage.dart';
import 'view/screens/login_screen/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ThemeController());

    return GetMaterialApp(
      themeMode: Get.find<ThemeController>().darkMode.value
          ? ThemeMode.dark
          : ThemeMode.light,
      theme: ThemeData.light(),
      translations: LocalizationService(),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: LocalizationService().getCurrentLocale(),
      home: LoginPage(),
    );
  }
}
