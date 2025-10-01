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
      scaffoldBackgroundColor: kPortfolioDarkBg,
      colorScheme: base.colorScheme.copyWith(
        brightness: Brightness.dark,
        background: kPortfolioDarkBg,
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
      appBarTheme: AppBarTheme(
        backgroundColor: kPortfolioDarkBg2,
        foregroundColor: kPortfolioDarkTextPrimary,
        titleTextStyle: TextStyle(
          color: kPortfolioBlue,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        toolbarTextStyle: TextStyle(
          color: kPortfolioDarkTextSecondary,
          fontSize: 14,
        ),
        iconTheme: IconThemeData(color: kPortfolioBlue),
        actionsIconTheme: IconThemeData(color: kPortfolioPink),
      ),
      listTileTheme: ListTileThemeData(
        selectedTileColor: Colors.red, // Background when   selected
        selectedColor: kPortfolioBlue, // Text and icon color whenselected
        textColor: kPortfolioDarkTextSecondary, // Unselected textcolor
        iconColor: kPortfolioDarkTextSecondary, // Unselected icon color
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        dense: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        style: ListTileStyle.drawer,
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
      scaffoldBackgroundColor: kPortfolioLightBg,
      colorScheme: base.colorScheme.copyWith(
        brightness: Brightness.light,
        background: kPortfolioLightBg,
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
      appBarTheme: AppBarTheme(
        backgroundColor: kPortfolioLightBg2,
        foregroundColor: kPortfolioLightTextPrimary,
        titleTextStyle: TextStyle(
          color: kPortfolioBlueLM,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        toolbarTextStyle: TextStyle(
          color: kPortfolioLightTextSecondary,
          fontSize: 14,
        ),
        iconTheme: IconThemeData(color: kPortfolioBlueLM),
        actionsIconTheme: IconThemeData(color: kPortfolioPinkLM),
      ),
      listTileTheme: ListTileThemeData(
        selectedTileColor: kPortfolioLightHover, // Background when   selected
        selectedColor: kPortfolioBlueLM, // Text and icon color whenselected
        textColor: kPortfolioLightTextSecondary, // Unselected textcolor
        iconColor: kPortfolioLightTextSecondary, // Unselected icon color
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        dense: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        style: ListTileStyle.drawer,
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
