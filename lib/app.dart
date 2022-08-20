import 'package:flutter/material.dart';
import 'package:gastos/config.dart';

import 'run.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    themach.addListener(() {
      debugPrint("Llegue al listener");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: ThemeData.light(),
      themeMode: themach.actual(),
      theme: ThemeData.light(),

      darkTheme: ThemeData.dark(),
      home: Run(),
    );
  }
}
