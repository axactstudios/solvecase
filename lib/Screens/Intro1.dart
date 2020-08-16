import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solvecase/Classes/Constants.dart';

class Intro1 extends StatefulWidget {
  @override
  _Intro1State createState() => _Intro1State();
}

class _Intro1State extends State<Intro1> {
  @override
  Widget build(BuildContext context) {
    final pHeight = MediaQuery.of(context).size.height;
    final pWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'assets/images/Ellipse 10.png',
              height: pHeight * 0.45,
            ),
          ),
          Positioned(
            bottom: pHeight * 0.36,
            left: pWidth * 0.06,
            child: Text(
              'Study Material',
              style: TextStyle(
                  fontFamily: 'Circular',
                  color: kPrimaryColor,
                  fontSize: pHeight * 0.035),
            ),
          ),
          Positioned(
            bottom: pHeight * 0.26,
            left: pWidth * 0.06,
            child: Text(
              'Gain access to a pool of study\nmaterial for your course',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontFamily: 'Circular',
                  color: kPrimaryColor,
                  fontSize: pHeight * 0.025),
            ),
          ),
          Positioned(
            bottom: pHeight * 0.1,
            left: pWidth * 0.06,
            child: Row(
              children: <Widget>[
                Container(
                  width: pWidth * 0.08,
                  height: pHeight * 0.005,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: pHeight * 0.1,
            left: pWidth * 0.15,
            child: Row(
              children: <Widget>[
                Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Color(0xFFFF6A8E),
                    borderRadius: BorderRadius.circular(pHeight * 0.5),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: pHeight * 0.1,
            left: pWidth * 0.17,
            child: Row(
              children: <Widget>[
                Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Color(0xFFFF6A8E),
                    borderRadius: BorderRadius.circular(pHeight * 0.5),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: pHeight * 0.07,
            left: pWidth * 0.6,
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => Intro2(),
                  ),
                );
              },
              child: Row(
                children: <Widget>[
                  Container(
                    width: pWidth * 0.35,
                    height: pHeight * 0.06,
                    decoration: BoxDecoration(
                      gradient: new LinearGradient(
                        colors: [
                          kPrimaryColor,
                          Color(0xFFFFb199),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(pHeight * 0.01),
                    ),
                    child: Center(
                      child: Text(
                        'Next',
                        style: TextStyle(
                            fontFamily: 'Circular',
                            color: Colors.white,
                            fontSize: pHeight * 0.035),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
              width: pWidth,
              height: pHeight,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: pHeight * 0.15,
                  ),
                  Image.asset(
                    'assets/images/undraw_book_lover_mkck 1.png',
                    height: pHeight * 0.3,
                  )
                ],
              )),
        ],
      ),
    );
  }
}

class Intro2 extends StatefulWidget {
  @override
  _Intro2State createState() => _Intro2State();
}

class _Intro2State extends State<Intro2> {
  @override
  Widget build(BuildContext context) {
    final pHeight = MediaQuery.of(context).size.height;
    final pWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'assets/images/Ellipse 10.png',
              height: pHeight * 0.45,
            ),
          ),
          Positioned(
            bottom: pHeight * 0.36,
            left: pWidth * 0.06,
            child: Text(
              'Video Lectures',
              style: TextStyle(
                  fontFamily: 'Circular',
                  color: kPrimaryColor,
                  fontSize: pHeight * 0.035),
            ),
          ),
          Positioned(
            bottom: pHeight * 0.26,
            left: pWidth * 0.06,
            child: Text(
              'Curated collection of the best\nvideo lectures for your course.',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontFamily: 'Circular',
                  color: kPrimaryColor,
                  fontSize: pHeight * 0.025),
            ),
          ),
          Positioned(
            bottom: pHeight * 0.1,
            left: pWidth * 0.06,
            child: Row(
              children: <Widget>[
                Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Color(0xFFFF6A8E),
                    borderRadius: BorderRadius.circular(pHeight * 0.5),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: pHeight * 0.1,
            left: pWidth * 0.08,
            child: Row(
              children: <Widget>[
                Container(
                  width: pWidth * 0.08,
                  height: pHeight * 0.005,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: pHeight * 0.1,
            left: pWidth * 0.17,
            child: Row(
              children: <Widget>[
                Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Color(0xFFFF6A8E),
                    borderRadius: BorderRadius.circular(pHeight * 0.5),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: pHeight * 0.07,
            left: pWidth * 0.6,
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => Intro3(),
                  ),
                );
              },
              child: Row(
                children: <Widget>[
                  Container(
                    width: pWidth * 0.35,
                    height: pHeight * 0.06,
                    decoration: BoxDecoration(
                      gradient: new LinearGradient(
                        colors: [
                          kPrimaryColor,
                          Color(0xFFFFb199),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(pHeight * 0.01),
                    ),
                    child: Center(
                      child: Text(
                        'Next',
                        style: TextStyle(
                            fontFamily: 'Circular',
                            color: Colors.white,
                            fontSize: pHeight * 0.035),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
              width: pWidth,
              height: pHeight,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: pHeight * 0.15,
                  ),
                  Image.asset(
                    'assets/images/youtube.png',
                    height: pHeight * 0.3,
                  )
                ],
              )),
        ],
      ),
    );
  }
}

class Intro3 extends StatefulWidget {
  @override
  _Intro3State createState() => _Intro3State();
}

class _Intro3State extends State<Intro3> {
  @override
  Widget build(BuildContext context) {
    final pHeight = MediaQuery.of(context).size.height;
    final pWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'assets/images/Ellipse 10.png',
              height: pHeight * 0.45,
            ),
          ),
          Positioned(
            bottom: pHeight * 0.36,
            left: pWidth * 0.06,
            child: Text(
              'Downloadable Solutions',
              style: TextStyle(
                  fontFamily: 'Circular',
                  color: kPrimaryColor,
                  fontSize: pHeight * 0.035),
            ),
          ),
          Positioned(
            bottom: pHeight * 0.22,
            left: pWidth * 0.06,
            child: Text(
              'Practice from an ever-growing\ncollection of downloadable\nassignments and projects with\nsolutions',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontFamily: 'Circular',
                  color: kPrimaryColor,
                  fontSize: pHeight * 0.025),
            ),
          ),
          Positioned(
            bottom: pHeight * 0.07,
            left: pWidth * 0.06,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: pWidth * 0.35,
                  height: pHeight * 0.06,
                  decoration: BoxDecoration(
                    gradient: new LinearGradient(
                      colors: [
                        kPrimaryColor,
                        Color(0xFFFFb199),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(pHeight * 0.01),
                  ),
                  child: Center(
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                          fontFamily: 'Circular',
                          color: Colors.white,
                          fontSize: pHeight * 0.03),
                    ),
                  ),
                ),
                SizedBox(
                  width: pWidth * 0.14,
                ),
                Container(
                  width: pWidth * 0.35,
                  height: pHeight * 0.06,
                  decoration: BoxDecoration(
                    border: Border.all(color: kPrimaryColor, width: 2.0),
                    borderRadius: BorderRadius.circular(pHeight * 0.01),
                  ),
                  child: Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontFamily: 'Circular',
                          color: kPrimaryColor,
                          fontSize: pHeight * 0.03),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
              width: pWidth,
              height: pHeight,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: pHeight * 0.15,
                  ),
                  Image.asset(
                    'assets/images/download.png',
                    height: pHeight * 0.3,
                  )
                ],
              )),
        ],
      ),
    );
  }
}
