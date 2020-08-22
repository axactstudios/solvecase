import 'package:fancy_drawer/fancy_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:solvecase/Screens/DrawerScreen.dart';
import 'package:solvecase/Screens/MorePageScreens/AboutUs.dart';
import 'package:solvecase/Screens/MorePageScreens/ContactSupport.dart';
import 'package:solvecase/Screens/MorePageScreens/FAQ.dart';
import 'package:solvecase/Screens/MorePageScreens/Profile.dart';

import '../Classes/Constants.dart';
import 'Bookmarks.dart';
import 'History.dart';
import 'Invite.dart';
import 'MainScreen.dart';

class More extends StatefulWidget {
  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> with TickerProviderStateMixin {
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

  bool status = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<Widget> myWidgets = [MainScreen(), History(), Bookmarks(), Invite()];
  @override
  Widget build(BuildContext context) {
    final pHeight = MediaQuery.of(context).size.height;
    final pWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: DrawerScreen(),
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset('assets/images/Shapes.png'),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: pHeight * 0.04,
              ),
              IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {
                  _scaffoldKey.currentState.openDrawer();
                },
              ),
              SizedBox(
                height: pHeight * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'Settings',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: pHeight * 0.035,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/Group 13.png',
                        height: pHeight * 0.16,
                        width: pHeight * 0.16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Darrell Steward',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: pHeight * 0.03),
                          ),
                          Text(
                            'IIT Bombay',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: pHeight * 0.025,
                              color: Colors.black.withOpacity(0.75),
                            ),
                          ),
                          Text(
                            'B.Tech',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: pHeight * 0.02,
                              color: Colors.black.withOpacity(0.55),
                            ),
                          ),
                          Text(
                            'CSE',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: pHeight * 0.02,
                              color: Colors.black.withOpacity(0.55),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: pHeight * 0.035,
              ),
              InkWell(
                onTap: () {
                  pushNewScreen(context, screen: ProfileSettings());
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'PROFILE SETTINGS',
                          style: TextStyle(
                              fontFamily: 'Circular',
                              fontSize: pHeight * 0.025),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  pushNewScreen(context, screen: FAQ());
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'FAQ',
                          style: TextStyle(
                              fontFamily: 'Circular',
                              fontSize: pHeight * 0.025),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  pushNewScreen(context, screen: ContactSupport());
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'CONTACT SUPPORT',
                          style: TextStyle(
                              fontFamily: 'Circular',
                              fontSize: pHeight * 0.025),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  pushNewScreen(context, screen: AboutUs());
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'ABOUT',
                          style: TextStyle(
                              fontFamily: 'Circular',
                              fontSize: pHeight * 0.025),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'DARK MODE',
                        style: TextStyle(
                            fontFamily: 'Circular', fontSize: pHeight * 0.025),
                      ),
                      FlutterSwitch(
                        width: pWidth * 0.15,
                        height: pHeight * 0.03,
                        toggleSize: pHeight * 0.02,
                        value: status,
                        borderRadius: 30.0,
                        padding: 4.0,
                        showOnOff: false,
                        onToggle: (val) {
                          setState(() {
                            status = val;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  margin: EdgeInsets.only(top: 25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: kPrimaryColor, width: 2.5),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Sign Out',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: pHeight * 0.03,
                            fontFamily: 'Circular',
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
