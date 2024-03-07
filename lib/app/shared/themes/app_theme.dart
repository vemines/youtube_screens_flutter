import 'package:flutter/material.dart';
import 'package:youtube_screens/gen/colors.gen.dart';

class AppTheme {
  static final TextTheme whiteTextTheme = Typography.material2021().white;

  static ThemeData dark = ThemeData.dark(useMaterial3: true).copyWith(
    primaryColor: ColorName.darkPrimary,
    brightness: Brightness.dark,
    textTheme: whiteTextTheme.copyWith(
      bodyMedium: whiteTextTheme.bodyMedium!.copyWith(
        color: ColorName.darkSubtext,
      ),
    ),
    colorScheme: ColorScheme.dark().copyWith(
      onPrimary: ColorName.white,
      background: ColorName.black,
      primaryContainer: ColorName.darkPrimaryContainer,
      error: ColorName.darkError,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorName.black,
      selectedItemColor: ColorName.white,
      unselectedItemColor: ColorName.white,
      showUnselectedLabels: true,
    ),
  );
}
