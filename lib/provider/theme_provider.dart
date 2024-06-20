import 'package:flutter/material.dart';
import 'package:onlineshopping/utils/theme2.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;


  //  ThemeData get lightTheme => MaterialTheme.light();

  // ThemeData get darkTheme => MaterialTheme.dark();

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
