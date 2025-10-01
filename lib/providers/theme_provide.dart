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
    );
  }

  void toggleTheme() {
    _isLight = !_isLight;
    notifyListeners();
  }
}
