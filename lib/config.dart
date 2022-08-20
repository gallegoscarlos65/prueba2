library config.globals;

import 'package:flutter/material.dart';
import 'package:gastos/database/gastos.dart';
import 'package:gastos/widgets/bitacora.dart';
import 'package:gastos/widgets/edit.dart';
import 'package:gastos/widgets/eliminar.dart';
import 'package:gastos/widgets/formadatos.dart';
import 'package:gastos/widgets/mitema.dart';

import 'database/semana.dart';

ThemeData temaPersonal = ThemeData(
  fontFamily: 'OpenSans',
  primarySwatch: Colors.purple,
  textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 11),
      bodyText1: TextStyle(fontStyle: FontStyle.italic)),
);
/*
List<Gastos> losgastos = [
  Gastos(concepto: "Papos kuchao", cantidad: 1000, fecha: DateTime.now()),
  Gastos(concepto: "Pañales 12 pz", cantidad: 65, fecha: DateTime.now()),
  Gastos(concepto: "Formula Nan", cantidad: 590, fecha: DateTime.now()),
];
*/
List<Gastos> losgastos = [];
//
List<Semana> semana = [
  Semana(dia: "L", monto: 50),
  Semana(dia: "M", monto: 60),
  Semana(dia: "Mi", monto: 80),
  Semana(dia: "J", monto: 120),
  Semana(dia: "V", monto: 90),
];

MiTema themach = MiTema();
Registro reg = Registro();
Edicion cambio = Edicion();
Eliminar borrar = Eliminar();
