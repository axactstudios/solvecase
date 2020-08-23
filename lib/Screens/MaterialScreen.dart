import 'package:fancy_drawer/fancy_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solvecase/Screens/DrawerScreen.dart';
import 'package:solvecase/Screens/Solutions.dart';

import '../Classes/Constants.dart';
import '../Material.dart';

// ignore: must_be_immutable
class MaterialScreen extends StatefulWidget {
  String enroll;
  int sem;

  MaterialScreen({this.enroll, this.sem});
  @override
  _MaterialScreenState createState() => _MaterialScreenState();
}

class _MaterialScreenState extends State<MaterialScreen> {
  String selected;
  int year = 0;

  TextEditingController search = new TextEditingController(text: '');
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int index = 0;

  @override
  void initState() {
    selected = 'First Year';
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
                    'Study material',
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
                          selected = 'First Year';
                          year = 0;
                          setState(() {
                            print('First Year');
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: selected == 'First Year'
                                ? kPrimaryColor
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: selected != 'First Year'
                                ? Border.all(color: kPrimaryColor, width: 1.0)
                                : Border.all(color: Colors.white, width: 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'First Year',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: selected == 'First Year'
                                      ? Colors.white
                                      : kPrimaryColor,
                                  fontSize: pHeight * 0.02),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          selected = 'Second Year';
                          year = 1;
                          setState(() {
                            print('Second Year');
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: selected == 'Second Year'
                                ? kPrimaryColor
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: selected != 'Second Year'
                                ? Border.all(color: kPrimaryColor, width: 1.0)
                                : Border.all(color: Colors.white),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Second Year',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: selected == 'Second Year'
                                      ? Colors.white
                                      : kPrimaryColor,
                                  fontSize: pHeight * 0.02),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          selected = 'Third Year';
                          year = 2;
                          setState(() {
                            print('Third Year');
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: selected == 'Third Year'
                                ? kPrimaryColor
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: selected != 'Third Year'
                                ? Border.all(color: kPrimaryColor, width: 1.0)
                                : Border.all(color: Colors.white),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Third Year',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: selected == 'Third Year'
                                      ? Colors.white
                                      : kPrimaryColor,
                                  fontSize: pHeight * 0.02),
                            ),
                          ),
                        ),
                      ),
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
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StudyMaterial(
                          sub: 'SDF', year: '1',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: pHeight * 0.12,
                    width: double.infinity,
                    child: FittedBox(
                      child: Image.asset('assets/images/SDFButton.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Solutions(
                          sub: 'Maths',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: pHeight * 0.12,
                    width: double.infinity,
                    child: FittedBox(
                      child: Image.asset('assets/images/MathsButton.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Solutions(
                          sub: 'Physics',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: pHeight * 0.12,
                    width: double.infinity,
                    child: FittedBox(
                      child: Image.asset('assets/images/PhysicsButton.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Solutions(
                          sub: 'ES',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: pHeight * 0.12,
                    width: double.infinity,
                    child: FittedBox(
                      child: Image.asset('assets/images/ESButton.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Solutions(
                          sub: 'EDD',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: pHeight * 0.12,
                    width: double.infinity,
                    child: FittedBox(
                      child: Image.asset('assets/images/EDDButton.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Solutions(
                          sub: 'Workshop',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: pHeight * 0.12,
                    width: double.infinity,
                    child: FittedBox(
                      child: Image.asset('assets/images/WorkshopButton.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Solutions(
                          sub: 'Physics Lab - 1',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: pHeight * 0.12,
                    width: double.infinity,
                    child: FittedBox(
                      child: Image.asset('assets/images/PhysicsLabButton.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Solutions(
                          sub: 'SDF Lab - 1',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: pHeight * 0.12,
                    width: double.infinity,
                    child: FittedBox(
                      child: Image.asset('assets/images/SDFLabButton.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Solutions(
                          sub: 'Physics Lab - 2',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: pHeight * 0.12,
                    width: double.infinity,
                    child: FittedBox(
                      child: Image.asset('assets/images/PhysicsLab2Button.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Solutions(
                          sub: 'SDF Lab - 2',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: pHeight * 0.12,
                    width: double.infinity,
                    child: FittedBox(
                      child: Image.asset('assets/images/SDFLab2Button.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Solutions(
                          sub: 'ES Lab - 1',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: pHeight * 0.12,
                    width: double.infinity,
                    child: FittedBox(
                      child: Image.asset('assets/images/ESLabButton.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          )
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
      child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Solutions(
                          sub: 'Data Structures',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: pHeight * 0.12,
                    width: double.infinity,
                    child: FittedBox(
                      child: Image.asset('assets/images/DSButton.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Solutions(
                          sub: 'Economics',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: pHeight * 0.12,
                    width: double.infinity,
                    child: FittedBox(
                      child: Image.asset('assets/images/EcoButton.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Solutions(
                          sub: 'ES 2',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: pHeight * 0.12,
                    width: double.infinity,
                    child: FittedBox(
                      child: Image.asset('assets/images/ES2Button.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Solutions(
                          sub: 'Database',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: pHeight * 0.12,
                    width: double.infinity,
                    child: FittedBox(
                      child: Image.asset('assets/images/DSWButton.png'),
                      fit: BoxFit.fill,
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
//                      builder: (context) => Solutions(
//                        sub: 'Algorithms',
//                      ),
//                    ),
//                  );
//                },
//                child: Container(
//                  margin: EdgeInsets.only(top: 15),
//                  height: pHeight * 0.12,
//                  width: double.infinity,
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
//                      builder: (context) => Solutions(
//                        sub: 'OS',
//                      ),
//                    ),
//                  );
//                },
//                child: Container(
//                  margin: EdgeInsets.only(top: 15),
//                  height: pHeight * 0.12,
//                  width: double.infinity,
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
//                      builder: (context) => Solutions(
//                        sub: 'Open Source',
//                      ),
//                    ),
//                  );
//                },
//                child: Container(
//                  margin: EdgeInsets.only(top: 15),
//                  height: pHeight * 0.12,
//                  width: double.infinity,
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
//                      builder: (context) => Solutions(
//                        sub: 'Information Security',
//                      ),
//                    ),
//                  );
//                },
//                child: Container(
//                  margin: EdgeInsets.only(top: 15),
//                  height: pHeight * 0.12,
//                  width: double.infinity,
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
