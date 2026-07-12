import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_spacing.dart';

class AppTheme {
  const AppTheme._();

  static const Color _lightPrimary = Color(0xFF315C57);
  static const Color _lightSecondary = Color(0xFFB85C38);
  static const Color _lightTertiary = Color(0xFF6D5BD0);
  static const Color _darkPrimary = Color(0xFF9AD7CE);
  static const Color _darkSecondary = Color(0xFFFFB390);
  static const Color _darkTertiary = Color(0xFFC7BEFF);

  static ThemeData get lightTheme {
    final scheme = ColorScheme.fromSeed(
      seedColor: _lightPrimary,
      brightness: Brightness.light,
      primary: _lightPrimary,
      secondary: _lightSecondary,
      tertiary: _lightTertiary,
      surface: const Color(0xFFFCF8F2),
    );

    return _buildTheme(scheme);
  }

  static ThemeData get darkTheme {
    final scheme = ColorScheme.fromSeed(
      seedColor: _darkPrimary,
      brightness: Brightness.dark,
      primary: _darkPrimary,
      secondary: _darkSecondary,
      tertiary: _darkTertiary,
      surface: const Color(0xFF0D1117),
    );

    return _buildTheme(scheme);
  }

  static ThemeData _buildTheme(ColorScheme colorScheme) {
    final baseTheme = ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      brightness: colorScheme.brightness,
    );

    final textTheme = GoogleFonts.loraTextTheme(baseTheme.textTheme).copyWith(
      headlineLarge: GoogleFonts.lora(
        fontSize: 38,
        fontWeight: FontWeight.w700,
        height: 1.08,
        color: colorScheme.onSurface,
      ),
      headlineMedium: GoogleFonts.lora(
        fontSize: 30,
        fontWeight: FontWeight.w700,
        height: 1.12,
        color: colorScheme.onSurface,
      ),
      titleLarge: GoogleFonts.inter(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: colorScheme.onSurface,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: colorScheme.onSurface,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 1.62,
        color: colorScheme.onSurface,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14,
        height: 1.5,
        color: colorScheme.onSurfaceVariant,
      ),
      labelLarge: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w700),
    );

    return baseTheme.copyWith(
      scaffoldBackgroundColor: colorScheme.surface,
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: colorScheme.onSurface,
        titleTextStyle: textTheme.titleLarge,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        margin: EdgeInsets.zero,
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.68),
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
          side: BorderSide(
            color: colorScheme.outlineVariant.withValues(alpha: 0.58),
          ),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size(176, 58),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(999),
          ),
          textStyle: textTheme.labelLarge,
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}
