// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gastos/config.dart';
import 'package:gastos/widgets/barritas.dart';
import 'package:gastos/widgets/formadatos.dart';
import 'package:intl/intl.dart';

import 'database/gastos.dart';
import 'database/semana.dart';
import 'widgets/bitacora.dart';

class Run extends StatefulWidget {
  const Run({Key? key}) : super(key: key);

  @override
  State<Run> createState() => _RunState();
}

class _RunState extends State<Run> {
  @override
  void initState() {
    super.initState();

    reg.addListener(() {
      setState(() {
        losgastos.add(reg.gasto);
        _rellenar();
        semana = _sumaGastosSemana();
      });
    });

    cambio.addListener(() {
      setState(() {
        losgastos[cambio.identificador] = cambio.gasto;
        _rellenar();
        semana = _sumaGastosSemana();
      });
    });

    borrar.addListener(() {
      setState(() {
        losgastos.removeAt(borrar.identificador);
        _rellenar();
        semana = _sumaGastosSemana();
      });
    });
  }

  /*  void agregarGasto() {
    Gastos gasto = Gastos(
        concepto: concepController.text,
        cantidad: double.parse(cantidadController.text),
        fecha: DateTime.now());

    setState(() {
      losgastos.add(gasto);
      _rellenar();
      semana = _sumaGastosSemana();
    });

    debugPrint(losgastos.toString());
    Navigator.pop(context);
    cantidadController.clear();
    concepController.clear();
  } */

  void _rellenar() {
    losgastos = gastosSemana;
    debugPrint(losgastos.toString());
  }

  List<Gastos> get gastosSemana {
    return losgastos
        .where((gasto) =>
            gasto.fecha!.isAfter(DateTime.now().subtract(Duration(days: 5))))
        .toList();
  }

  List<Semana> _sumaGastosSemana() {
    return List.generate(5, (index) {
      DateTime hoy = DateTime.now().subtract(Duration(days: index));
      double suma = 0;
      List<Gastos> gasto = gastosSemana;

      for (int i = 0; i < gasto.length; i++) {
        if (gasto[i].fecha!.day == hoy.day) {
          suma += gasto[i].cantidad!;
        }
      }
      return Semana(
          dia: DateFormat('EEE').format(hoy).substring(0, 1), monto: suma);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              onPressed: () => reg.formaDatos(context), icon: Icon(Icons.add)),
          IconButton(
              onPressed: () => themach.cambiarTema(),
              icon: Icon(Icons.dark_mode))
        ],
        title: const Text("Gastos", style: TextStyle(fontFamily: 'QuickSand')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Barritas(),
            ),
            SizedBox(height: 500, width: double.infinity, child: Bitacora()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => reg.formaDatos(context), child: Icon(Icons.add)),
    );
  }
}//end class
