import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LectureScreen extends StatefulWidget {
  String enroll;
  int sem;

  LectureScreen({this.enroll, this.sem});
  @override
  _LectureScreenState createState() => _LectureScreenState();
}

class _LectureScreenState extends State<LectureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'Lectures',
          style: TextStyle(
              fontFamily: 'Baskervville',
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
