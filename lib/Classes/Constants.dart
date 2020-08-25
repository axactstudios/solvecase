import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solvecase/Screens/SolutionScreen.dart';
import '../main.dart';

Color darkColor = Color(0xFFFFFFFF);
Color txtColor = Colors.black;
const kPrimaryColor = Color(0xFFF04F4E);
const kSecondaryColor = Color.fromRGBO(137, 137, 137, 1);
changeMode(State state) {
  darkColor = mode == 'dark' ? Color(0xFF3A3A3A) : Color(0xFFFFFFFF);
  txtColor = mode == 'dark' ? Color(0xFFFFFFFF) : Colors.black;
  state.setState(() {
    print('1');
  });
  print(main2);
  main2.setState(() {
    print('$mode 1');
  });

  return darkColor;
}

changeMode2() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String colorMode = prefs.getString('mode');
  print(colorMode);
  colorMode == 'light'
      ? darkColor = Color(0xFFFFFFFF)
      : darkColor = Color(0xFF3A3A3A);
  colorMode == 'dark' ? txtColor = Color(0xFFFFFFFF) : txtColor = Colors.black;
}
