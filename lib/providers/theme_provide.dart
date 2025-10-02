import 'package:flutter/material.dart';
import 'package:bmogul/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isLight = false;
  bool get isLight => _isLight;

  ThemeData get currentTheme =>
      isLight ? _buildLightTheme() : _buildDarkTheme();

  ThemeData _buildDarkTheme() {
    final ThemeData base = ThemeData.dark();
    final textTheme = GoogleFonts.ubuntuMonoTextTheme(base.textTheme);

    return base.copyWith(
      scaffoldBackgroundColor: kPortfolioDarkBg,
      colorScheme: base.colorScheme.copyWith(
        brightness: Brightness.dark,
        background: kPortfolioDarkBg,
        primary: kPortfolioBlue,
        onPrimary: kPortfolioDarkBg,
        secondary: kPortfolioGreen,
        onSecondary: kPortfolioDarkBg,
        tertiary: kPortfolioPurple,
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
        titleTextStyle: GoogleFonts.ubuntuMono(
          color: kPortfolioBlue,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        toolbarTextStyle: GoogleFonts.ubuntuMono(
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
      textTheme: textTheme.copyWith(
        // Display text (largest)
        displayLarge: textTheme.displayLarge?.copyWith(
          color: kPortfolioDarkTextPrimary,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: textTheme.displayMedium?.copyWith(
          color: kPortfolioDarkTextPrimary,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: textTheme.displaySmall?.copyWith(
          color: kPortfolioDarkTextPrimary,
          fontWeight: FontWeight.w600,
        ),

        // Headlines
        headlineLarge: textTheme.headlineLarge?.copyWith(
          color: kPortfolioDarkTextPrimary,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: textTheme.headlineMedium?.copyWith(
          color: kPortfolioDarkTextPrimary,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: textTheme.headlineSmall?.copyWith(
          color: kPortfolioDarkTextPrimary,
          fontWeight: FontWeight.w600,
        ),

        // Titles
        titleLarge: textTheme.titleLarge?.copyWith(
          color: kPortfolioDarkTextPrimary,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: textTheme.titleMedium?.copyWith(
          color: kPortfolioDarkTextPrimary,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: textTheme.titleSmall?.copyWith(
          color: kPortfolioDarkTextSecondary,
          fontWeight: FontWeight.w500,
        ),

        // Body text
        bodyLarge: textTheme.bodyLarge?.copyWith(
          color: kPortfolioDarkTextPrimary,
        ),
        bodyMedium: textTheme.bodyMedium?.copyWith(
          color: kPortfolioDarkTextPrimary,
        ),
        bodySmall: textTheme.bodySmall?.copyWith(
          color: kPortfolioDarkTextSecondary,
        ),

        // Labels
        labelLarge: textTheme.labelLarge?.copyWith(
          color: kPortfolioDarkTextPrimary,
          fontWeight: FontWeight.w500,
        ),
        labelMedium: textTheme.labelMedium?.copyWith(
          color: kPortfolioDarkTextSecondary,
        ),
        labelSmall: textTheme.labelSmall?.copyWith(
          color: kPortfolioDarkTextSecondary,
        ),
      ),
    );
  }

  ThemeData _buildLightTheme() {
    final ThemeData base = ThemeData.light();
    final textTheme = GoogleFonts.ubuntuMonoTextTheme(base.textTheme);

    return base.copyWith(
      scaffoldBackgroundColor: kPortfolioLightBg,
      colorScheme: base.colorScheme.copyWith(
        brightness: Brightness.light,
        background: kPortfolioLightBg,
        primary: kPortfolioBlueLM,
        onPrimary: Colors.white,
        secondary: kPortfolioGreen,
        onSecondary: Colors.white,
        tertiary: kPortfolioPurpleLM,
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
        titleTextStyle: GoogleFonts.ubuntuMono(
          color: kPortfolioBlueLM,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        toolbarTextStyle: GoogleFonts.ubuntuMono(
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
      textTheme: textTheme.copyWith(
        // Display text (largest)
        displayLarge: textTheme.displayLarge?.copyWith(
          color: kPortfolioLightTextPrimary,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: textTheme.displayMedium?.copyWith(
          color: kPortfolioLightTextPrimary,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: textTheme.displaySmall?.copyWith(
          color: kPortfolioLightTextPrimary,
          fontWeight: FontWeight.w600,
        ),

        // Headlines
        headlineLarge: textTheme.headlineLarge?.copyWith(
          color: kPortfolioLightTextPrimary,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: textTheme.headlineMedium?.copyWith(
          color: kPortfolioLightTextPrimary,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: textTheme.headlineSmall?.copyWith(
          color: kPortfolioLightTextPrimary,
          fontWeight: FontWeight.w600,
        ),

        // Titles
        titleLarge: textTheme.titleLarge?.copyWith(
          color: kPortfolioLightTextPrimary,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: textTheme.titleMedium?.copyWith(
          color: kPortfolioLightTextPrimary,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: textTheme.titleSmall?.copyWith(
          color: kPortfolioLightTextSecondary,
          fontWeight: FontWeight.w500,
        ),

        // Body text
        bodyLarge: textTheme.bodyLarge?.copyWith(
          color: kPortfolioLightTextPrimary,
        ),
        bodyMedium: textTheme.bodyMedium?.copyWith(
          color: kPortfolioLightTextPrimary,
        ),
        bodySmall: textTheme.bodySmall?.copyWith(
          color: kPortfolioLightTextSecondary,
        ),

        // Labels
        labelLarge: textTheme.labelLarge?.copyWith(
          color: kPortfolioLightTextPrimary,
          fontWeight: FontWeight.w500,
        ),
        labelMedium: textTheme.labelMedium?.copyWith(
          color: kPortfolioLightTextSecondary,
        ),
        labelSmall: textTheme.labelSmall?.copyWith(
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
