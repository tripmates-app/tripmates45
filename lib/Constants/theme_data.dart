import 'package:flutter/material.dart';

class ThemeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;
  // Light Theme

  ThemeData get lightTheme => ThemeData(
      hintColor: Color(0xff65667D),
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      cardColor: Colors.white,
      primaryColor: Colors.black,
      hoverColor: Color(0xffF1F1F1),
      indicatorColor: Color(0xff4D4D4D));

  // Dark Theme
  ThemeData get darkTheme => ThemeData(
        hintColor: Colors.white54,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black, // Black background
        cardColor: Colors.black,
        primaryColor: Colors.white,
        hoverColor: Colors.white,
        indicatorColor: Colors.white,

        // iconTheme: IconThemeData(color: Colors.white),
      );

  // Toggle Theme
  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    // notifyListeners(); // Notify all listeners to rebuild with the new theme
  }
}
