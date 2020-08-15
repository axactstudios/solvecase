import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Color darkBackground = Color(0xFF3A3A3A);
List<BoxShadow> shadowList = [
  BoxShadow(color: Colors.grey[300], blurRadius: 30, offset: Offset(0, 10))
];

List<Map> categories = [
  {'name': 'Cats', 'iconPath': 'images/cat.png'},
  {'name': 'Dogs', 'iconPath': 'images/dog.png'},
  {'name': 'Bunnies', 'iconPath': 'images/rabbit.png'},
  {'name': 'Parrots', 'iconPath': 'images/parrot.png'},
  {'name': 'Horses', 'iconPath': 'images/horse.png'}
];

List<Map> drawerItems = [
  {'icon': FontAwesomeIcons.paw, 'title': 'HOME'},
  {'icon': Icons.mail, 'title': 'HISTORY'},
  {'icon': FontAwesomeIcons.plus, 'title': 'BOOKMARKS'},
  {'icon': Icons.favorite, 'title': 'INVITE FRIENDS'},
  {'icon': Icons.mail, 'title': 'RATE ON PLAYSTORE'},
  {'icon': FontAwesomeIcons.userAlt, 'title': 'SETTINGS'},
];
