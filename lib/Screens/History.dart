import 'package:flutter/material.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'History',
          style: TextStyle(
              fontFamily: 'Circular',
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
