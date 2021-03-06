import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:solvecase/Screens/DrawerScreen.dart';
import '../Classes/Constants.dart';

import 'Solutions.dart';

State main2;
BuildContext cont;

// ignore: must_be_immutable
class SolutionScreen extends StatefulWidget {
  String enroll;
  int sem;

  SolutionScreen({this.enroll, this.sem});
  @override
  _SolutionScreenState createState() => _SolutionScreenState();
}

class _SolutionScreenState extends State<SolutionScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String selected;

  @override
  void initState() {
    selected = 'Sem 1';
  }

  TextEditingController search = new TextEditingController(text: '');

  List<Widget> years = [FirstYear(), SecondYear()];

  int year = 0;

  @override
  Widget build(BuildContext context) {
    main2 = this;
    cont = context;
    print(23);
    final pHeight = MediaQuery.of(context).size.height;
    final pWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: darkColor,
      drawer: DrawerScreen(),
      body: Column(
        children: <Widget>[
          Container(
            height: pHeight * 0.26,
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
                    'Solutions',
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
                            padding: EdgeInsets.all(pHeight * 0.01),
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
                            padding: EdgeInsets.all(pHeight * 0.01),
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

                    ],
                  ),
                ),

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
                    builder: (context) => Solutions(sub: 'SDF', year: '1'),
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
                    builder: (context) => Solutions(sub: 'Maths', year: '1'),
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
                    builder: (context) => Solutions(sub: 'Physics', year: '1'),
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
                        Solutions(sub: 'Physics Lab - 1', year: '1'),
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
                    builder: (context) => Solutions(sub: 'EDD', year: '1'),
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
                    builder: (context) => Solutions(sub: 'Workshop', year: '1'),
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

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Solutions(sub: 'SDF Lab - 1', year: '1'),
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
                        Solutions(sub: 'Data Structures', year: '2'),
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
                    builder: (context) =>
                        Solutions(sub: 'Economics', year: '2'),
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
                    builder: (context) => Solutions(sub: 'ES 2', year: '2'),
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
                    builder: (context) => Solutions(sub: 'Database', year: '2'),
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
