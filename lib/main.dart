import "package:flutter/material.dart";
import 'package:solvecase/Screens/DrawerScreen.dart';
import 'package:solvecase/Screens/Home.dart';
import 'package:solvecase/Screens/SplashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DrawerScreen(),
    );
  }
}
