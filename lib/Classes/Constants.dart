import 'package:flutter/material.dart';

import '../main.dart';

Color darkColor = Color(0xFFFFFFFF);
Color txtColor = Colors.black;
const kPrimaryColor = Color(0xFFF04F4E);
const kSecondaryColor = Color.fromRGBO(137, 137, 137, 1);
changeMode() {
  darkColor = mode == 'dark' ? Color(0xFF3A3A3A) : Color(0xFFFFFFFF);
  txtColor = mode == 'dark' ? Color(0xFFFFFFFF) : Colors.black;
  return darkColor;
}
