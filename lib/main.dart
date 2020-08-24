import "package:flutter/material.dart";
import 'package:solvecase/Classes/Constants.dart';

import 'Screens/SplashScreen.dart';

void main() => runApp(MyApp());

String mode = 'light';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(canvasColor: darkColor),
      home: SplashScreen(),
    );
  }
}
