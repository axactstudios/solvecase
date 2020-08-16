import 'package:flutter/material.dart';

class Invite extends StatefulWidget {
  @override
  _InviteState createState() => _InviteState();
}

class _InviteState extends State<Invite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Invite',
          style: TextStyle(
              fontFamily: 'Circular',
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
