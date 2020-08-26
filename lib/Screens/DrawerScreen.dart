import 'package:fancy_drawer/fancy_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:url_launcher/url_launcher.dart';

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
                          FlutterShareMe().shareToWhatsApp(
                              base64Image:
                                  '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',
                              msg:
                                  'Hey! I use this awesome app solve-case, it is the one and only solution for all your assignments and study material with many other features like video lectures, books etc. Download the app now and never be late again in submitting your assignments!!\nhttps://play.google.com/store/apps/details?id=com.axactstudios.solvecase');
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
                    InkWell(
                      onTap: () {
                        _launchURL(
                            'https://play.google.com/store/apps/details?id=com.axactstudios.solvecase');
                      },
                      child: Text(
                        'RATE ON PLAYSTORE',
                        style: TextStyle(
                            fontFamily: 'Circular',
                            color: txtColor,
                            fontSize: pHeight * 0.025,
                            fontWeight: FontWeight.bold),
                      ),
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

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
