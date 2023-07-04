import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class ThemeManager {
  static var darkTheme = ThemeData(
    primaryColor: Constants.primaryColor,
    iconTheme: IconThemeData(color: Constants.primaryColor),
    appBarTheme: AppBarTheme(
      backgroundColor: Constants.primaryColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Constants.primaryColor),
      ),
    ),
  );

  static var lightTheme = ThemeData(
    primaryColor: Constants.primaryColor,
    iconTheme: IconThemeData(color: Constants.primaryColor),
  );
}
