import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../gen/colors.gen.dart';

final robotoRegular = GoogleFonts.robotoSerif().fontFamily;

class AppTheme {
  static final TextTheme whiteTextTheme = Typography.material2021().white;

  static ThemeData dark = ThemeData.dark(useMaterial3: true).copyWith(
    primaryColor: ColorName.darkPrimary,
    brightness: Brightness.dark,
    textTheme: whiteTextTheme.copyWith(
      bodyLarge: whiteTextTheme.bodyLarge!.copyWith(
        fontFamily: GoogleFonts.roboto().fontFamily,
        fontWeight: FontWeight.w600,
      ),
      bodySmall: whiteTextTheme.bodySmall!.copyWith(
        color: ColorName.darkSubtext,
        fontSize: 14,
        fontFamily: GoogleFonts.roboto().fontFamily,
        fontWeight: FontWeight.w400,
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
