import "package:flutter/material.dart";
import 'package:solvecase/Classes/Constants.dart';

import 'Classes/Constants.dart';
import 'Screens/SplashScreen.dart';

void main() => runApp(MyApp());

String mode = 'light';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    changeMode2();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(canvasColor: darkColor),
      home: SplashScreen(),
    );
  }
}
