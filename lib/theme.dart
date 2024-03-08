import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppColors {
  static const primary = Color(0xFFFA9E31);
  static const secondary = Color(0xFFFFF6DE);
  static const textColor = Color(0xFF343434);
  static const textFaded = Color(0xFF666666);
  static const inputBackground = Color(0xFFEDEDED);
  static const background = Color(0xFFFAFAFA  );
}

abstract class _LightColors {
  static const background = AppColors.background;
  static const card = AppColors.inputBackground;
}

abstract class _DarkColors {
  static const background = AppColors.background;
  static const card = AppColors.inputBackground;
}

/// Reference to the application theme.
class AppTheme {
  static final visualDensity = VisualDensity.adaptivePlatformDensity;

  static final darkBase = ThemeData.dark();
  static final lightBase = ThemeData.light();

  /// Light theme and its settings.
  static ThemeData light() => ThemeData(
        brightness: Brightness.light,
        visualDensity: visualDensity,
        textTheme:
            GoogleFonts.mulishTextTheme().apply(bodyColor: AppColors.textColor),
        appBarTheme: lightBase.appBarTheme.copyWith(
          iconTheme: lightBase.iconTheme,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: AppColors.textColor,
          ),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        scaffoldBackgroundColor: _LightColors.background,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.secondary),
        ),
        cardColor: _LightColors.card,
        primaryTextTheme: const TextTheme(
          titleLarge: TextStyle(color: AppColors.textColor),
        ),
        iconTheme: const IconThemeData(color: AppColors.textColor),
      );

  /// Dark theme and its settings.
  static ThemeData dark() => ThemeData(
        brightness: Brightness.dark,
        visualDensity: visualDensity,
        textTheme:
            GoogleFonts.interTextTheme().apply(bodyColor: AppColors.textColor),
        appBarTheme: darkBase.appBarTheme.copyWith(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        scaffoldBackgroundColor: _DarkColors.background,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.secondary),
        ),
        cardColor: _DarkColors.card,
        primaryTextTheme: const TextTheme(
          titleLarge: TextStyle(color: AppColors.textColor),
        ),
        iconTheme: const IconThemeData(color: AppColors.textColor),
      );
}
