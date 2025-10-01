import 'package:flutter/material.dart';
import 'package:bmogul/colors.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isLight = false;
  bool get isLight => _isLight;

  ThemeData get currentTheme =>
      isLight ? _buildLightTheme() : _buildDarkTheme();

  ThemeData _buildDarkTheme() {
    final ThemeData base = ThemeData.dark();

    return base.copyWith(
      colorScheme: base.colorScheme.copyWith(
        brightness: Brightness.dark,
        primary: kPortfolioBlue,
        onPrimary: kPortfolioDarkBg,
        secondary: kPortfolioPurple,
        onSecondary: kPortfolioDarkBg,
        tertiary: kPortfolioPink,
        onTertiary: kPortfolioDarkBg,
        error: kPortfolioError,
        onError: Colors.white,
        surface: kPortfolioDarkBg2,
        onSurface: kPortfolioDarkTextPrimary,
        surfaceContainerHighest: kPortfolioDarkBg3,
        outline: kPortfolioDarkBorder,
      ),
      textTheme: base.textTheme.copyWith(
        // Display text (largest)
        displayLarge: base.textTheme.displayLarge?.copyWith(
          color: kPortfolioDarkTextPrimary,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: base.textTheme.displayMedium?.copyWith(
          color: kPortfolioDarkTextPrimary,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: base.textTheme.displaySmall?.copyWith(
          color: kPortfolioDarkTextPrimary,
          fontWeight: FontWeight.w600,
        ),

        // Headlines
        headlineLarge: base.textTheme.headlineLarge?.copyWith(
          color: kPortfolioDarkTextPrimary,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: base.textTheme.headlineMedium?.copyWith(
          color: kPortfolioDarkTextPrimary,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: base.textTheme.headlineSmall?.copyWith(
          color: kPortfolioDarkTextPrimary,
          fontWeight: FontWeight.w600,
        ),

        // Titles
        titleLarge: base.textTheme.titleLarge?.copyWith(
          color: kPortfolioDarkTextPrimary,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: base.textTheme.titleMedium?.copyWith(
          color: kPortfolioDarkTextPrimary,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: base.textTheme.titleSmall?.copyWith(
          color: kPortfolioDarkTextSecondary,
          fontWeight: FontWeight.w500,
        ),

        // Body text
        bodyLarge: base.textTheme.bodyLarge?.copyWith(
          color: kPortfolioDarkTextPrimary,
        ),
        bodyMedium: base.textTheme.bodyMedium?.copyWith(
          color: kPortfolioDarkTextPrimary,
        ),
        bodySmall: base.textTheme.bodySmall?.copyWith(
          color: kPortfolioDarkTextSecondary,
        ),

        // Labels
        labelLarge: base.textTheme.labelLarge?.copyWith(
          color: kPortfolioDarkTextPrimary,
          fontWeight: FontWeight.w500,
        ),
        labelMedium: base.textTheme.labelMedium?.copyWith(
          color: kPortfolioDarkTextSecondary,
        ),
        labelSmall: base.textTheme.labelSmall?.copyWith(
          color: kPortfolioDarkTextSecondary,
        ),
      ),
    );
  }

  ThemeData _buildLightTheme() {
    final ThemeData base = ThemeData.light();

    return base.copyWith(
      colorScheme: base.colorScheme.copyWith(
        brightness: Brightness.light,
        primary: kPortfolioBlueLM,
        onPrimary: Colors.white,
        secondary: kPortfolioPurpleLM,
        onSecondary: Colors.white,
        tertiary: kPortfolioPinkLM,
        onTertiary: Colors.white,
        error: kPortfolioError,
        onError: Colors.white,
        surface: kPortfolioLightBg2,
        onSurface: kPortfolioLightTextPrimary,
        surfaceContainerHighest: kPortfolioLightBg3,
        outline: kPortfolioLightBorder,
      ),
      textTheme: base.textTheme.copyWith(
        // Display text (largest)
        displayLarge: base.textTheme.displayLarge?.copyWith(
          color: kPortfolioLightTextPrimary,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: base.textTheme.displayMedium?.copyWith(
          color: kPortfolioLightTextPrimary,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: base.textTheme.displaySmall?.copyWith(
          color: kPortfolioLightTextPrimary,
          fontWeight: FontWeight.w600,
        ),

        // Headlines
        headlineLarge: base.textTheme.headlineLarge?.copyWith(
          color: kPortfolioLightTextPrimary,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: base.textTheme.headlineMedium?.copyWith(
          color: kPortfolioLightTextPrimary,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: base.textTheme.headlineSmall?.copyWith(
          color: kPortfolioLightTextPrimary,
          fontWeight: FontWeight.w600,
        ),

        // Titles
        titleLarge: base.textTheme.titleLarge?.copyWith(
          color: kPortfolioLightTextPrimary,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: base.textTheme.titleMedium?.copyWith(
          color: kPortfolioLightTextPrimary,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: base.textTheme.titleSmall?.copyWith(
          color: kPortfolioLightTextSecondary,
          fontWeight: FontWeight.w500,
        ),

        // Body text
        bodyLarge: base.textTheme.bodyLarge?.copyWith(
          color: kPortfolioLightTextPrimary,
        ),
        bodyMedium: base.textTheme.bodyMedium?.copyWith(
          color: kPortfolioLightTextPrimary,
        ),
        bodySmall: base.textTheme.bodySmall?.copyWith(
          color: kPortfolioLightTextSecondary,
        ),

        // Labels
        labelLarge: base.textTheme.labelLarge?.copyWith(
          color: kPortfolioLightTextPrimary,
          fontWeight: FontWeight.w500,
        ),
        labelMedium: base.textTheme.labelMedium?.copyWith(
          color: kPortfolioLightTextSecondary,
        ),
        labelSmall: base.textTheme.labelSmall?.copyWith(
          color: kPortfolioLightTextSecondary,
        ),
      ),
    );
  }

  void toggleTheme() {
    _isLight = !_isLight;
    notifyListeners();
  }
}
