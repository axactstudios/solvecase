import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:solvecase/Screens/DrawerScreen.dart';
import '../Classes/Constants.dart';
import 'Solutions.dart';

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
    selected = 'First Year';
  }

  TextEditingController search = new TextEditingController(text: '');

  List<Widget> years = [FirstYear(), SecondYear(), ThirdYear()];

  int year = 0;

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
            height: pHeight * 0.22,
            width: pWidth,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  kPrimaryColor,
                  Color(0xFFF26969),
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
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
                        fontSize: pHeight * 0.035,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: pHeight * 0.005,
                ),
                Center(
                  child: Container(
                    width: pWidth * 0.92,
                    height: pHeight * 0.05,
                    decoration: BoxDecoration(
                      color: Color(0xFFF7A1A1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: TextFormField(
                        controller: search,
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.search,
                            color: kPrimaryColor,
                          ),
                          hintText: 'Search',
                          hintStyle: TextStyle(
                              color: kPrimaryColor,
                              fontSize: pHeight * 0.02,
                              fontFamily: 'Poppins'),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: pHeight * 0.01,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
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
                                  : Border.all(color: kPrimaryColor),
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
                                  : Border.all(color: kPrimaryColor),
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
                                  : Border.all(color: kPrimaryColor),
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
                  SizedBox(
                    height: pHeight * 0.01,
                  ),
                  years[year],
                ],
              ),
            ),
          ),
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
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Solutions(sub: 'SDF', year: '1'),
                    ),
                  );
                },
                child: Container(
                  height: pHeight * 0.12,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFFF8787),
                        Color(0xFFC16A6A),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Image.asset('assets/images/Ellipse 9.png'),
                      ),
                      Positioned(
                        top: pHeight * 0.035,
                        left: pWidth * 0.08,
                        child: Text(
                          'SDF',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: pHeight * 0.035),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Solutions(
                        sub: 'Maths',
                        year: '1',
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 15),
                  height: pHeight * 0.12,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF87F0FF),
                        Color(0xFF3AA2B1),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Image.asset('assets/images/Ellipse 1.png'),
                      ),
                      Positioned(
                        top: pHeight * 0.035,
                        left: pWidth * 0.08,
                        child: Text(
                          'Mathematics',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: pHeight * 0.035),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Solutions(sub: 'Physics', year: '1'),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 15),
                  height: pHeight * 0.12,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFFFCF87),
                        Color(0xFFCA9547),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Image.asset('assets/images/Ellipse 2.png'),
                      ),
                      Positioned(
                        top: pHeight * 0.035,
                        left: pWidth * 0.08,
                        child: Text(
                          'Physics',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: pHeight * 0.035),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Solutions(sub: 'EDD', year: '1'),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 15),
                  height: pHeight * 0.12,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFE09FFF),
                        Color(0xFF8A46AB),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Image.asset('assets/images/Ellipse 3.png'),
                      ),
                      Positioned(
                        top: pHeight * 0.035,
                        left: pWidth * 0.08,
                        child: Text(
                          'EDD',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: pHeight * 0.035),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Solutions(sub: 'ES', year: '1'),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 15),
                  height: pHeight * 0.12,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFFF8787),
                        Color(0xFFC16A6A),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Image.asset('assets/images/Ellipse 9.png'),
//                    Container(
//                      height: pHeight * 0.1,
//                      width: pWidth * 0.6,
//                      decoration: BoxDecoration(
//                        color: Color(0xFFF78C8C),
//                      ),
//                    ),
                      ),
                      Positioned(
                        top: pHeight * 0.035,
                        left: pWidth * 0.08,
                        child: Text(
                          'Electrical Science',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: pHeight * 0.035),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Solutions(sub: 'Workshop', year: '1'),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 15),
                  height: pHeight * 0.12,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF87F0FF),
                        Color(0xFF3AA2B1),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Image.asset('assets/images/Ellipse 1.png'),
                      ),
                      Positioned(
                        top: pHeight * 0.035,
                        left: pWidth * 0.08,
                        child: Text(
                          'Workshop',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: pHeight * 0.035),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
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
                  margin: EdgeInsets.only(top: 15),
                  height: pHeight * 0.12,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFFFCF87),
                        Color(0xFFCA9547),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Image.asset('assets/images/Ellipse 2.png'),
                      ),
                      Positioned(
                        top: pHeight * 0.035,
                        left: pWidth * 0.08,
                        child: Text(
                          'Physics Lab - 1',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: pHeight * 0.035),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
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
                  margin: EdgeInsets.only(top: 15),
                  height: pHeight * 0.12,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFE09FFF),
                        Color(0xFF8A46AB),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Image.asset('assets/images/Ellipse 3.png'),
                      ),
                      Positioned(
                        top: pHeight * 0.035,
                        left: pWidth * 0.08,
                        child: Text(
                          'SDF Lab - 1',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: pHeight * 0.035),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Solutions(sub: 'ES Lab - 1', year: '1'),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 15),
                  height: pHeight * 0.12,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFFF8787),
                        Color(0xFFC16A6A),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Image.asset('assets/images/Ellipse 9.png'),
//                    Container(
//                      height: pHeight * 0.1,
//                      width: pWidth * 0.6,
//                      decoration: BoxDecoration(
//                        color: Color(0xFFF78C8C),
//                      ),
//                    ),
                      ),
                      Positioned(
                        top: pHeight * 0.035,
                        left: pWidth * 0.08,
                        child: Text(
                          'ES Lab - 1',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: pHeight * 0.035),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Solutions(sub: 'Physics Lab - 2', year: '1'),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 15),
                  height: pHeight * 0.12,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF87F0FF),
                        Color(0xFF3AA2B1),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Image.asset('assets/images/Ellipse 1.png'),
                      ),
                      Positioned(
                        top: pHeight * 0.035,
                        left: pWidth * 0.08,
                        child: Text(
                          'Physics Lab - 2',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: pHeight * 0.035),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Solutions(sub: 'SDF Lab - 2', year: '1'),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 15, bottom: 15),
                  height: pHeight * 0.12,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFFFCF87),
                        Color(0xFFCA9547),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Image.asset('assets/images/Ellipse 2.png'),
                      ),
                      Positioned(
                        top: pHeight * 0.035,
                        left: pWidth * 0.08,
                        child: Text(
                          'SDF Lab - 2',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: pHeight * 0.035),
                        ),
                      ),
                    ],
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
              InkWell(
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
                  margin: EdgeInsets.only(top: 15),
                  height: pHeight * 0.12,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFFF8787),
                        Color(0xFFC16A6A),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Image.asset('assets/images/Ellipse 9.png'),
                      ),
                      Positioned(
                        top: pHeight * 0.035,
                        left: pWidth * 0.08,
                        child: Text(
                          'Data Structures',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: pHeight * 0.035),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
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
                  margin: EdgeInsets.only(top: 15),
                  height: pHeight * 0.12,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF87F0FF),
                        Color(0xFF3AA2B1),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Image.asset('assets/images/Ellipse 1.png'),
                      ),
                      Positioned(
                        top: pHeight * 0.035,
                        left: pWidth * 0.08,
                        child: Text(
                          'Economics',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: pHeight * 0.035),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Solutions(sub: 'ES 2', year: '2'),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 15),
                  height: pHeight * 0.12,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFFFCF87),
                        Color(0xFFCA9547),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Image.asset('assets/images/Ellipse 2.png'),
                      ),
                      Positioned(
                        top: pHeight * 0.035,
                        left: pWidth * 0.08,
                        child: Text(
                          'Electrical Science - 2',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: pHeight * 0.035),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Solutions(sub: 'Database', year: '2'),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 15),
                  height: pHeight * 0.12,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFE09FFF),
                        Color(0xFF8A46AB),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Image.asset('assets/images/Ellipse 3.png'),
                      ),
                      Positioned(
                        top: pHeight * 0.035,
                        left: pWidth * 0.08,
                        child: Text(
                          'DB & Web Structures',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: pHeight * 0.035),
                        ),
                      ),
                    ],
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
      child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Solutions(
                        sub: 'Algorithms',
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 15),
                  height: pHeight * 0.12,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFFF8787),
                        Color(0xFFC16A6A),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Image.asset('assets/images/Ellipse 9.png'),
                      ),
                      Positioned(
                        top: pHeight * 0.035,
                        left: pWidth * 0.08,
                        child: Text(
                          'Algorithms',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: pHeight * 0.035),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Solutions(
                        sub: 'OS',
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 15),
                  height: pHeight * 0.12,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF87F0FF),
                        Color(0xFF3AA2B1),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Image.asset('assets/images/Ellipse 1.png'),
                      ),
                      Positioned(
                        top: pHeight * 0.035,
                        left: pWidth * 0.08,
                        child: Text(
                          'Operating Systems',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: pHeight * 0.035),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Solutions(
                        sub: 'Open Source',
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 15),
                  height: pHeight * 0.12,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFFFCF87),
                        Color(0xFFCA9547),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Image.asset('assets/images/Ellipse 2.png'),
                      ),
                      Positioned(
                        top: pHeight * 0.035,
                        left: pWidth * 0.08,
                        child: Text(
                          'Open Source Softwares',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: pHeight * 0.035),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Solutions(
                        sub: 'Information Security',
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 15),
                  height: pHeight * 0.12,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFE09FFF),
                        Color(0xFF8A46AB),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Image.asset('assets/images/Ellipse 3.png'),
                      ),
                      Positioned(
                        top: pHeight * 0.035,
                        left: pWidth * 0.08,
                        child: Text(
                          'Information Security',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: pHeight * 0.035),
                        ),
                      ),
                    ],
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
