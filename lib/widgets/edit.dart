// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gastos/config.dart';
import 'package:intl/intl.dart';
import '../database/gastos.dart';

class Edicion with ChangeNotifier {
  final TextEditingController cantidadController = TextEditingController();
  final TextEditingController concepController = TextEditingController();
  TextEditingController dateInput = TextEditingController();
  int identificador = 0;

  var firstDayOfWeek =
      DateTime.now().subtract(Duration(days: DateTime.now().weekday));

  Gastos gasto = Gastos(concepto: "", cantidad: 0, fecha: DateTime.now());

  void formaDatos(BuildContext context, int indice) async {
    identificador = indice;
    return await showModalBottomSheet(
        elevation: 5,
        isScrollControlled: true,
        context: context,
        builder: (_) => Container(
              padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 10,
                  bottom: 50 + MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: concepController,
                    decoration:
                        InputDecoration(hintText: losgastos[indice].concepto),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: cantidadController,
                    decoration: InputDecoration(
                        hintText: losgastos[indice].cantidad.toString()),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: dateInput,
                    decoration: InputDecoration(
                        icon: Icon(Icons.calendar_today),
                        labelText: DateFormat('dd-MM-yy')
                            .format(losgastos[indice].fecha!)),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: firstDayOfWeek,
                          lastDate: firstDayOfWeek.add(Duration(days: 6)));
                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        dateInput.text = formattedDate;
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("¡Alerta!"),
                              content: Text("No selecciono la fecha"),
                              actions: <Widget>[
                                TextButton(
                                  child: Text("OK"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () => editarGasto(context),
                      child: const Text("Guardar"))
                ],
              ),
            ));
  }

  void editarGasto(context) {
    gasto = Gastos(
      concepto: concepController.text,
      cantidad: double.parse(cantidadController.text),
      fecha: DateTime.parse(dateInput.text),
    );

    cantidadController.clear();
    concepController.clear();
    notifyListeners();
  }
}
