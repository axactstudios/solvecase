import 'package:fancy_drawer/fancy_drawer.dart';
import 'package:flutter/material.dart';
import 'package:solvecase/Screens/Material.dart';
import 'package:solvecase/Screens/DrawerScreen.dart';

import '../Classes/Constants.dart';
import 'Bookmarks.dart';
import 'History.dart';
import 'Invite.dart';
import 'Lectures.dart';
import 'MainScreen.dart';

// ignore: must_be_immutable
class LectureScreen extends StatefulWidget {
  String enroll;
  int sem;

  LectureScreen({this.enroll, this.sem});
  @override
  _LectureScreenState createState() => _LectureScreenState();
}

class _LectureScreenState extends State<LectureScreen> {
  String selected;
  int year = 0;

  int index = 0;
  TextEditingController search = new TextEditingController(text: '');
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    selected = 'Sem 1';
  }

  List<Widget> years = [FirstYear(), SecondYear(), ThirdYear()];
  @override
  Widget build(BuildContext context) {
    final pHeight = MediaQuery.of(context).size.height;
    final pWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: DrawerScreen(),
      body: Column(
        children: <Widget>[
          Container(
            height: pHeight * 0.25,
            width: pWidth,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  kPrimaryColor,
                  Color(0xFFF26969),
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: Column(
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
                    'Video Lectures',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: pHeight * 0.04,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: pHeight * 0.005,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () {
                          selected = 'Sem 1';
                          year = 0;
                          setState(() {
                            print('Sem 1');
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: selected != 'Sem 1'
                                ? kPrimaryColor
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: selected == 'Sem 1'
                                ? Border.all(color: kPrimaryColor, width: 1.0)
                                : Border.all(color: Colors.white, width: 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Sem 1',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: selected != 'Sem 1'
                                      ? Colors.white
                                      : kPrimaryColor,
                                  fontSize: pHeight * 0.02),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          selected = 'Sem 3';
                          year = 1;
                          setState(() {
                            print('Sem 3');
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: selected != 'Sem 3'
                                ? kPrimaryColor
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: selected == 'Sem 3'
                                ? Border.all(color: kPrimaryColor, width: 1.0)
                                : Border.all(color: Colors.white),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Sem 3',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: selected != 'Sem 3'
                                      ? Colors.white
                                      : kPrimaryColor,
                                  fontSize: pHeight * 0.02),
                            ),
                          ),
                        ),
                      ),
//                      InkWell(
//                        onTap: () {
//                          selected = 'Third Year';
//                          year = 2;
//                          setState(() {
//                            print('Third Year');
//                          });
//                        },
//                        child: Container(
//                          margin: EdgeInsets.only(left: 10),
//                          decoration: BoxDecoration(
//                            color: selected == 'Third Year'
//                                ? kPrimaryColor
//                                : Colors.white,
//                            borderRadius: BorderRadius.circular(10),
//                            border: selected != 'Third Year'
//                                ? Border.all(color: kPrimaryColor, width: 1.0)
//                                : Border.all(color: Colors.white),
//                          ),
//                          child: Padding(
//                            padding: const EdgeInsets.all(8.0),
//                            child: Text(
//                              'Third Year',
//                              style: TextStyle(
//                                  fontFamily: 'Poppins',
//                                  color: selected == 'Third Year'
//                                      ? Colors.white
//                                      : kPrimaryColor,
//                                  fontSize: pHeight * 0.02),
//                            ),
//                          ),
//                        ),
//                      ),
                    ],
                  ),
                ),
//                Center(
//                  child: Container(
//                    width: pWidth * 0.92,
//                    height: pHeight * 0.05,
//                    decoration: BoxDecoration(
//                      color: Color(0xFFF7A1A1),
//                      borderRadius: BorderRadius.circular(10),
//                    ),
//                    child: Center(
//                      child: TextFormField(
//                        controller: search,
//                        textAlignVertical: TextAlignVertical.center,
//                        decoration: InputDecoration(
//                          suffixIcon: Icon(
//                            Icons.search,
//                            color: kPrimaryColor,
//                          ),
//                          hintText: 'Search',
//                          hintStyle: TextStyle(
//                              color: kPrimaryColor,
//                              fontSize: pHeight * 0.02,
//                              fontFamily: 'Poppins'),
//                          border:
//                              OutlineInputBorder(borderSide: BorderSide.none),
//                        ),
//                      ),
//                    ),
//                  ),
//                )
              ],
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: years[year],
          )),
        ],
      ),
    );
  }
}

class FirstYear extends StatefulWidget {
  const FirstYear({
    Key key,
  }) : super(key: key);

  @override
  _FirstYearState createState() => _FirstYearState();
}

class _FirstYearState extends State<FirstYear> {
  @override
  Widget build(BuildContext context) {
    final pHeight = MediaQuery.of(context).size.height;
    final pWidth = MediaQuery.of(context).size.width;
    return Container(
      height: pHeight * 0.6,
      child: GridView.count(
        childAspectRatio: 1.6,
        crossAxisCount: 2,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Lectures(sub: 'SDF', year: '1'),
                  ),
                );
              },
              child: Container(
                height: pHeight * 0.10,
                child: FittedBox(
                  child: Image.asset('assets/images/SDFButtonV2.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Lectures(sub: 'Maths', year: '1'),
                  ),
                );
              },
              child: Container(
                height: pHeight * 0.10,
                child: FittedBox(
                  child: Image.asset('assets/images/MathsButtonV2.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Lectures(sub: 'Physics', year: '1'),
                  ),
                );
              },
              child: Container(
                height: pHeight * 0.10,
                child: FittedBox(
                  child: Image.asset('assets/images/PhyButtonV2.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Lectures(sub: 'Physics Lab - 1', year: '1'),
                  ),
                );
              },
              child: Container(
                height: pHeight * 0.10,
                child: FittedBox(
                  child: Image.asset('assets/images/PhysicsLabButtonV2.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Lectures(sub: 'EDD', year: '1'),
                  ),
                );
              },
              child: Container(
                height: pHeight * 0.10,
                child: FittedBox(
                  child: Image.asset('assets/images/EDDButtonV2.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Lectures(sub: 'Workshop', year: '1'),
                  ),
                );
              },
              child: Container(
                height: pHeight * 0.10,
                child: FittedBox(
                  child: Image.asset('assets/images/WorkshopButtonV2.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
//          Padding(
//            padding: const EdgeInsets.all(8.0),
//            child: InkWell(
//              onTap: () {
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                    builder: (context) =>
//                        Lectures(sub: 'Physics Lab - 1', year: '1'),
//                  ),
//                );
//              },
//              child: Container(
//                height: pHeight * 0.10,
//                child: FittedBox(
//                  child: Image.asset('assets/images/PhysicsLabButtonV2.png'),
//                  fit: BoxFit.fill,
//                ),
//              ),
//            ),
//          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Lectures(sub: 'SDF Lab - 1', year: '1'),
                  ),
                );
              },
              child: Container(
                height: pHeight * 0.10,
                child: FittedBox(
                  child: Image.asset('assets/images/SDFLabButtonV2.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
//          Padding(
//            padding: const EdgeInsets.all(8.0),
//            child: InkWell(
//              onTap: () {
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                    builder: (context) =>
//                        Lectures(sub: 'Physics Lab - 2', year: '1'),
//                  ),
//                );
//              },
//              child: Container(
//                height: pHeight * 0.10,
//                child: FittedBox(
//                  child: Image.asset('assets/images/PhysicsLab2ButtonV2.png'),
//                  fit: BoxFit.fill,
//                ),
//              ),
//            ),
//          ),
//          Padding(
//            padding: const EdgeInsets.all(8.0),
//            child: InkWell(
//              onTap: () {
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                    builder: (context) =>
//                        Lectures(sub: 'SDF Lab - 2', year: '1'),
//                  ),
//                );
//              },
//              child: Container(
//                height: pHeight * 0.10,
//                child: FittedBox(
//                  child: Image.asset('assets/images/SDFLab2ButtonV2.png'),
//                  fit: BoxFit.fill,
//                ),
//              ),
//            ),
//          ),
//          Padding(
//            padding: const EdgeInsets.all(8.0),
//            child: InkWell(
//              onTap: () {
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                    builder: (context) =>
//                        Lectures(sub: 'ES Lab - 1', year: '1'),
//                  ),
//                );
//              },
//              child: Container(
//                height: pHeight * 0.10,
//                child: FittedBox(
//                  child: Image.asset('assets/images/ESLabButtonV2.png'),
//                  fit: BoxFit.fill,
//                ),
//              ),
//            ),
//          )
        ],
      ),
    );
  }
}

class SecondYear extends StatefulWidget {
  const SecondYear({
    Key key,
  }) : super(key: key);

  @override
  _SecondYearState createState() => _SecondYearState();
}

class _SecondYearState extends State<SecondYear> {
  @override
  Widget build(BuildContext context) {
    final pHeight = MediaQuery.of(context).size.height;
    final pWidth = MediaQuery.of(context).size.width;
    return Container(
      height: pHeight * 0.6,
      child: GridView.count(
        childAspectRatio: 1.6,
        crossAxisCount: 2,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Lectures(sub: 'Data Structures', year: '2'),
                  ),
                );
              },
              child: Container(
                height: pHeight * 0.10,
                child: FittedBox(
                  child: Image.asset('assets/images/DSAlgoV2.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Lectures(sub: 'Economics', year: '2'),
                  ),
                );
              },
              child: Container(
                height: pHeight * 0.10,
                child: FittedBox(
                  child: Image.asset('assets/images/EcoV2.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Lectures(sub: 'ES 2', year: '2'),
                  ),
                );
              },
              child: Container(
                height: pHeight * 0.10,
                child: FittedBox(
                  child: Image.asset('assets/images/ESV2.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Lectures(sub: 'Database', year: '2'),
                  ),
                );
              },
              child: Container(
                height: pHeight * 0.10,
                child: FittedBox(
                  child: Image.asset('assets/images/DSWV2.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ThirdYear extends StatefulWidget {
  @override
  _ThirdYearState createState() => _ThirdYearState();
}

class _ThirdYearState extends State<ThirdYear> {
  @override
  Widget build(BuildContext context) {
    final pHeight = MediaQuery.of(context).size.height;
    final pWidth = MediaQuery.of(context).size.width;
    return Container(
      height: pHeight * 0.6,
      child: Center(
        child: Text('Coming Soon...'),
      ),
//      child: ListView(
//        children: <Widget>[
//          Column(
//            children: <Widget>[
//              InkWell(
//                onTap: () {
//                  Navigator.push(
//                    context,
//                    MaterialPageRoute(
//                      builder: (context) => StudyMaterial
//                      (
//                        sub: 'Algorithms',
//                      ),
//                    ),
//                  );
//                },
//                child: Container(
//                  margin: EdgeInsets.only(top: 15),
//                  height: pHeight * 0.10
//                  ,
//
//                  decoration: BoxDecoration(
//                    gradient: LinearGradient(
//                      colors: [
//                        Color(0xFFFF8787),
//                        Color(0xFFC16A6A),
//                      ],
//                    ),
//                    borderRadius: BorderRadius.circular(15),
//                  ),
//                  child: Stack(
//                    children: <Widget>[
//                      Positioned(
//                        top: 0,
//                        left: 0,
//                        child: Image.asset('assets/images/Ellipse 9.png'),
//                      ),
//                      Positioned(
//                        top: pHeight * 0.035,
//                        left: pWidth * 0.08,
//                        child: Text(
//                          'Algorithms',
//                          style: TextStyle(
//                              fontFamily: 'Montserrat',
//                              color: Colors.white,
//                              fontSize: pHeight * 0.035),
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//              InkWell(
//                onTap: () {
//                  Navigator.push(
//                    context,
//                    MaterialPageRoute(
//                      builder: (context) => StudyMaterial
//                      (
//                        sub: 'OS',
//                      ),
//                    ),
//                  );
//                },
//                child: Container(
//                  margin: EdgeInsets.only(top: 15),
//                  height: pHeight * 0.10
//                  ,
//
//                  decoration: BoxDecoration(
//                    gradient: LinearGradient(
//                      colors: [
//                        Color(0xFF87F0FF),
//                        Color(0xFF3AA2B1),
//                      ],
//                    ),
//                    borderRadius: BorderRadius.circular(15),
//                  ),
//                  child: Stack(
//                    children: <Widget>[
//                      Positioned(
//                        top: 0,
//                        left: 0,
//                        child: Image.asset('assets/images/Ellipse 1.png'),
//                      ),
//                      Positioned(
//                        top: pHeight * 0.035,
//                        left: pWidth * 0.08,
//                        child: Text(
//                          'Operating Systems',
//                          style: TextStyle(
//                              fontFamily: 'Montserrat',
//                              color: Colors.white,
//                              fontSize: pHeight * 0.035),
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//              InkWell(
//                onTap: () {
//                  Navigator.push(
//                    context,
//                    MaterialPageRoute(
//                      builder: (context) => StudyMaterial
//                      (
//                        sub: 'Open Source',
//                      ),
//                    ),
//                  );
//                },
//                child: Container(
//                  margin: EdgeInsets.only(top: 15),
//                  height: pHeight * 0.10
//                  ,
//
//                  decoration: BoxDecoration(
//                    gradient: LinearGradient(
//                      colors: [
//                        Color(0xFFFFCF87),
//                        Color(0xFFCA9547),
//                      ],
//                    ),
//                    borderRadius: BorderRadius.circular(15),
//                  ),
//                  child: Stack(
//                    children: <Widget>[
//                      Positioned(
//                        top: 0,
//                        left: 0,
//                        child: Image.asset('assets/images/Ellipse 2.png'),
//                      ),
//                      Positioned(
//                        top: pHeight * 0.035,
//                        left: pWidth * 0.08,
//                        child: Text(
//                          'Open Source Softwares',
//                          style: TextStyle(
//                              fontFamily: 'Montserrat',
//                              color: Colors.white,
//                              fontSize: pHeight * 0.035),
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//              InkWell(
//                onTap: () {
//                  Navigator.push(
//                    context,
//                    MaterialPageRoute(
//                      builder: (context) => StudyMaterial
//                      (
//                        sub: 'Information Security',
//                      ),
//                    ),
//                  );
//                },
//                child: Container(
//                  margin: EdgeInsets.only(top: 15),
//                  height: pHeight * 0.10
//                  ,
//
//                  decoration: BoxDecoration(
//                    gradient: LinearGradient(
//                      colors: [
//                        Color(0xFFE09FFF),
//                        Color(0xFF8A46AB),
//                      ],
//                    ),
//                    borderRadius: BorderRadius.circular(15),
//                  ),
//                  child: Stack(
//                    children: <Widget>[
//                      Positioned(
//                        top: 0,
//                        left: 0,
//                        child: Image.asset('assets/images/Ellipse 3.png'),
//                      ),
//                      Positioned(
//                        top: pHeight * 0.035,
//                        left: pWidth * 0.08,
//                        child: Text(
//                          'Information Security',
//                          style: TextStyle(
//                              fontFamily: 'Montserrat',
//                              color: Colors.white,
//                              fontSize: pHeight * 0.035),
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//            ],
//          ),
//        ],
//      ),
    );
  }
}
