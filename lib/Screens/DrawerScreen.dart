import 'package:fancy_drawer/fancy_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../Classes/Constants.dart';
import 'Bookmarks.dart';

import 'MainScreen.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen>
    with SingleTickerProviderStateMixin {
  FancyDrawerController _controller;
  String fName = 'Darrell';
  String lName = 'Steward';
  String college = 'JIIT';
  String course = 'CSE';
  String year = 'First Year';
  String subject, uid;
  getUser() async {
    FirebaseAuth mAuth = FirebaseAuth.instance;
    FirebaseUser user = await mAuth.currentUser();
    setState(() {
      uid = user.uid;
      print(uid);
    });
    getUserData();
  }

  getUserData() async {
    DatabaseReference dbref =
        FirebaseDatabase.instance.reference().child("Users");
    await dbref.once().then((DataSnapshot snap) {
      // ignore: non_constant_identifier_names
      var KEYS = snap.value.keys;
      // ignore: non_constant_identifier_names
      var DATA = snap.value;

      for (var key in KEYS) {
        if (key == uid) {
          setState(() {
            fName = DATA[key]['fName'];
            lName = DATA[key]['lName'];
            college = DATA[key]['college'];
            course = DATA[key]['course'];
            year = DATA[key]['year'];
          });
        }
      }
      setState(() {
        print(college);
        print(fName);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = FancyDrawerController(
        vsync: this, duration: Duration(milliseconds: 250))
      ..addListener(() {
        setState(() {});
      });
    getUser();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int index = 0;

  List<Widget> myWidgets = [MainScreen(), Bookmarks()];

  @override
  Widget build(BuildContext context) {
    final pHeight = MediaQuery.of(context).size.height;
    final pWidth = MediaQuery.of(context).size.width;
    return Drawer(
      child: Container(
        width: pWidth * 0.8,
        color: darkColor,
        child: Container(
          width: pWidth,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                child: Image.asset(
                  'assets/images/Shapes.png',
                  width: pWidth * 0.8,
                ),
              ),
              Positioned(
                top: pHeight * 0.05,
                left: pWidth * 0.05,
                child: Image.asset(
                  'assets/images/Group 13.png',
                  height: pHeight * 0.11,
                ),
              ),
              Positioned(
                top: pHeight * 0.16,
                left: pWidth * 0.05,
                child: Text(
                  '$fName $lName',
                  style: TextStyle(
                      fontFamily: 'Circular',
                      color: Color(0xFFE9E9E9),
                      fontSize: pHeight * 0.03,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                top: pHeight * 0.20,
                left: pWidth * 0.05,
                child: Text(
                  '$college',
                  style: TextStyle(
                      fontFamily: 'Circular',
                      color: Color(0xFFE9E9E9),
                      fontSize: pHeight * 0.025,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                top: pHeight * 0.24,
                left: pWidth * 0.05,
                child: Text(
                  '$course',
                  style: TextStyle(
                      fontFamily: 'Circular',
                      color: Color(0xFFE9E9E9),
                      fontSize: pHeight * 0.025,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: pHeight * 0.4,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          index = 0;
                        });
                      },
                      child: Text(
                        'HOME',
                        style: TextStyle(
                            fontFamily: 'Circular',
                            color: txtColor,
                            fontSize: pHeight * 0.025,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: pHeight * 0.04,
                    ),
                    InkWell(
                      onTap: () {
                        pushNewScreen(context,
                            screen: Bookmarks(), withNavBar: false);
                      },
                      child: Text(
                        'BOOKMARKS',
                        style: TextStyle(
                            fontFamily: 'Circular',
                            color: txtColor,
                            fontSize: pHeight * 0.025,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: pHeight * 0.04,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          index = 3;
                        });
                      },
                      child: Text(
                        'INVITE FRIENDS',
                        style: TextStyle(
                            fontFamily: 'Circular',
                            color: txtColor,
                            fontSize: pHeight * 0.025,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: pHeight * 0.04,
                    ),
                    Text(
                      'RATE ON PLAYSTORE',
                      style: TextStyle(
                          fontFamily: 'Circular',
                          color: txtColor,
                          fontSize: pHeight * 0.025,
                          fontWeight: FontWeight.bold),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}
