// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gastos/config.dart';
import 'package:intl/intl.dart';

class Bitacora extends StatefulWidget {
  Bitacora({Key? key}) : super(key: key);

  @override
  State<Bitacora> createState() => _BitacoraState();
}

class _BitacoraState extends State<Bitacora> with ChangeNotifier {
  Widget cargarImagen() => Card(
        elevation: 5,
        child: Image.asset("assets/images/waiting.png"),
      );

  void menuDesplegable(indice) async {
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
                  ElevatedButton(
                    onPressed: () => {cambio.formaDatos(context, indice)},
                    child: Text("Editar"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        borrar.eliminar(indice);
                        Navigator.pop(context);
                      },
                      child: Text("Eliminar"))
                ],
              ),
            ));
  }

  /* void eliminar(indice) {
    setState(() {
      losgastos.removeAt(indice);
    });
  } */

  @override
  Widget build(BuildContext context) {
    return losgastos.isEmpty
        ? cargarImagen()
        : ListView.builder(
            itemCount: losgastos.length,
            itemBuilder: (context, indice) => Card(
                    child: Column(
                  children: <Widget>[
                    ListTile(
                        onLongPress: () => menuDesplegable(indice),
                        trailing: Wrap(
                          spacing: 12,
                          children: <Widget>[
                            IconButton(
                                onPressed: () => borrar.eliminar(indice),
                                icon: const Icon(Icons.delete)),
                            IconButton(
                                onPressed: () =>
                                    cambio.formaDatos(context, indice),
                                icon: const Icon(Icons.edit))
                          ],
                        ),
                        title: Text(
                          losgastos[indice].concepto!,
                          style: TextStyle(fontFamily: 'OpenSans'),
                        ),
                        subtitle: Text(DateFormat('dd-MM-yy')
                            .format(losgastos[indice].fecha!)),
                        leading:
                            Text("\$ ${losgastos[indice].cantidad.toString()}"))
                  ],
                )));
  } //end build
}
