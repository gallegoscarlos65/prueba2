import 'package:flutter/material.dart';
import 'package:gastos/config.dart';
import 'package:intl/intl.dart';
import '../database/gastos.dart';

class Eliminar with ChangeNotifier {
  int identificador = 0;

  void eliminar(int indice) {
    identificador = indice;
    notifyListeners();
  }
}
