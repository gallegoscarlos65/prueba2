import 'package:flutter/material.dart';

class MiTema with ChangeNotifier {
  static bool _obscuro = false;

  ThemeMode actual() {
    return _obscuro ? ThemeMode.dark : ThemeMode.light;
  }

  void cambiarTema() {
    _obscuro = !_obscuro;
    notifyListeners();
  }
}
