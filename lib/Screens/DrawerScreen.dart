import 'package:fancy_drawer/fancy_drawer.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../Classes/Constants.dart';
import '../Classes/Constants.dart';
import 'Bookmarks.dart';
import 'Invite.dart';

import 'History.dart';
import 'MainScreen.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen>
    with SingleTickerProviderStateMixin {
  FancyDrawerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = FancyDrawerController(
        vsync: this, duration: Duration(milliseconds: 250))
      ..addListener(() {
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
    return Drawer(
      child: Container(
        width: pWidth * 0.8,
        color: Colors.white,
        child: Container(
          width: pWidth,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                child: Image.asset('assets/images/Shapes.png'),
              ),
              Positioned(
                top: pHeight * 0.08,
                left: pWidth * 0.05,
                child: Image.asset(
                  'assets/images/Group 13.png',
                  height: pHeight * 0.11,
                ),
              ),
              Positioned(
                top: pHeight * 0.185,
                left: pWidth * 0.05,
                child: Text(
                  'Darrell Steward',
                  style: TextStyle(
                      fontFamily: 'Circular',
                      color: Color(0xFFE9E9E9),
                      fontSize: pHeight * 0.03,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                top: pHeight * 0.22,
                left: pWidth * 0.05,
                child: Text(
                  'JIIT Noida',
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
                  'B. Tech',
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
                            color: Colors.black,
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
                            screen: History(), withNavBar: false);
                      },
                      child: Text(
                        'HISTORY',
                        style: TextStyle(
                            fontFamily: 'Circular',
                            color: Colors.black,
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
                          index = 2;
                        });
                      },
                      child: Text(
                        'BOOKMARKS',
                        style: TextStyle(
                            fontFamily: 'Circular',
                            color: Colors.black,
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
                            color: Colors.black,
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
                          color: Colors.black,
                          fontSize: pHeight * 0.025,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: pHeight * 0.04,
                    ),
                    Text(
                      'SETTINGS',
                      style: TextStyle(
                          fontFamily: 'Circular',
                          color: Colors.black,
                          fontSize: pHeight * 0.025,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
//        child: Scaffold(
//          backgroundColor: Colors.white,
//          body: Column(
//            mainAxisSize: MainAxisSize.max,
//            children: <Widget>[
//              Container(
//                height: pHeight * 0.22,
//                width: pWidth,
//                decoration: BoxDecoration(
//                  gradient: LinearGradient(
//                    colors: [
//                      kPrimaryColor,
//                      Color(0xFFF26969),
//                    ],
//                  ),
//                  borderRadius: BorderRadius.only(
//                    bottomRight: Radius.circular(30),
//                    bottomLeft: Radius.circular(30),
//                  ),
//                ),
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    SizedBox(
//                      height: pHeight * 0.04,
//                    ),
//                    IconButton(
//                      icon: Icon(
//                        Icons.menu,
//                        color: Colors.white,
//                      ),
//                      onPressed: () {
//                        _controller.toggle();
//                      },
//                    ),
//                    SizedBox(
//                      height: pHeight * 0.01,
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.only(left: 16.0),
//                      child: Text(
//                        'Solve case',
//                        style: TextStyle(
//                            fontFamily: 'Poppins',
//                            fontSize: pHeight * 0.035,
//                            fontWeight: FontWeight.bold,
//                            color: Colors.white),
//                      ),
//                    ),
//                    SizedBox(
//                      height: pHeight * 0.01,
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.only(left: 16.0),
//                      child: Text(
//                        'Here to help you with all your problems',
//                        style: TextStyle(
//                          fontFamily: 'Poppins',
//                          fontSize: pHeight * 0.025,
//                          fontWeight: FontWeight.bold,
//                          color: Colors.white.withOpacity(0.85),
//                        ),
//                      ),
//                    )
//                  ],
//                ),
//              ),
//              Container(
//                width: pWidth,
//                color: Colors.white,
//                height: pHeight * 0.78,
//                child: myWidgets[index],
//              ),
//            ],
//          ),
//        ),
      ),
    );
  }
}
