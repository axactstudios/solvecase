import 'package:fancy_drawer/fancy_drawer.dart';
import 'package:flutter/material.dart';

import '../Classes/Constants.dart';
import 'Bookmarks.dart';
import 'History.dart';
import 'Invite.dart';
import 'MainScreen.dart';

// ignore: must_be_immutable
class LectureScreen extends StatefulWidget {
  String enroll;
  int sem;

  LectureScreen({this.enroll, this.sem});
  @override
  _LectureScreenState createState() => _LectureScreenState();
}

class _LectureScreenState extends State<LectureScreen>
    with TickerProviderStateMixin {
  FancyDrawerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = FancyDrawerController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int index = 0;

  List<Widget> myWidgets = [MainScreen(), History(), Bookmarks(), Invite()];
  @override
  Widget build(BuildContext context) {
    final pHeight = MediaQuery.of(context).size.height;
    final pWidth = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      child: Center(
        child: Text('Lectures'),
      ),
    );
  }
}
