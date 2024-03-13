import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_screens/app/shared/constants/dimens.dart';
import 'package:youtube_screens/app/shared/extensions/num_extension.dart';
import '../../../gen/colors.gen.dart';

final robotoRegular = GoogleFonts.robotoSerif().fontFamily;

class AppTheme {
  static final TextTheme whiteTextTheme = Typography.material2021().white;

  static ThemeData dark = ThemeData.dark(useMaterial3: true).copyWith(
    primaryColor: ColorName.darkPrimary,
    disabledColor: ColorName.darkDisable,
    brightness: Brightness.dark,
    textTheme: whiteTextTheme.copyWith(
      bodyLarge: whiteTextTheme.bodyLarge!.copyWith(
        fontFamily: GoogleFonts.roboto().fontFamily,
        fontWeight: FontWeight.w600,
      ),
      bodySmall: whiteTextTheme.bodySmall!.copyWith(
        color: ColorName.darkDisable,
        fontSize: 14,
        fontFamily: GoogleFonts.roboto().fontFamily,
        fontWeight: FontWeight.w400,
      ),
    ),
    appBarTheme: AppBarTheme().copyWith(backgroundColor: ColorName.black),
    scaffoldBackgroundColor: ColorName.black,
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
    switchTheme: SwitchThemeData().copyWith(
      thumbColor: MaterialStatePropertyAll<Color>(ColorName.darkPrimary),
      trackColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.selected)) {
          return ColorName.darkPrimary.withAlpha(
            0.5.opacityToAlpha(),
          ); // Track color when the switch is in the true state
        }
        return Colors.grey[700]!; // Track color when the switch is in the false state
      }),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: ColorName.darkPrimary,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme().copyWith(
      filled: true,
      fillColor: ColorName.darkInputBg,
    ),
    chipTheme: ChipThemeData().copyWith(
      backgroundColor: Colors.grey.shade600.withOpacity(0.25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(RadiusBorder.chip),
      ),
    ),
  );
}
