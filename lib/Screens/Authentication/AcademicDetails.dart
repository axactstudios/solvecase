import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solvecase/Screens/Authentication/PersonalDetails.dart';

class AcademicDetails extends StatefulWidget {
  @override
  _AcademicDetailsState createState() => _AcademicDetailsState();
}

class _AcademicDetailsState extends State<AcademicDetails> {
  String college = 'JIIT';
  String course = 'CSE';
  String year = 'First Year';

  @override
  Widget build(BuildContext context) {
    final pHeight = MediaQuery.of(context).size.height;
    final pWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: pWidth,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset('assets/images/Shapes.png'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: pHeight * 0.05,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: pHeight * 0.035,
                  ),
                  Text(
                    'Academic\nDetails',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Circular',
                        fontSize: pHeight * 0.035),
                  ),
                  SizedBox(
                    height: pHeight * 0.22,
                  ),
                  Text(
                    'Sign Up',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Circular',
                        fontSize: pHeight * 0.035),
                  ),
                  SizedBox(
                    height: pHeight * 0.05,
                  ),
                  Container(
                    width: pWidth * 0.9,
                    decoration: BoxDecoration(
                      color: Color(0xFFE9E9E9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton<String>(
                        value: college,
                        elevation: 16,
                        isExpanded: true,
                        dropdownColor: Color(0xFFE9E9E9),
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          size: pHeight * 0.035,
                          color: Color(0xFF4E4E4E),
                        ),
                        style: TextStyle(
                          fontFamily: 'Circular',
                          color: Color(0xFF4E4E4E),
                          fontSize: pHeight * 0.022,
                        ),
                        underline: Container(
                          color: Color(0xFFE9E9E9),
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            college = newValue;
                          });
                        },
                        items: <String>['JIIT', 'JIIT-128']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: pHeight * 0.02,
                  ),
                  Container(
                    width: pWidth * 0.9,
                    decoration: BoxDecoration(
                      color: Color(0xFFE9E9E9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton<String>(
                        value: course,
                        elevation: 16,
                        isExpanded: true,
                        dropdownColor: Color(0xFFE9E9E9),
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          size: pHeight * 0.035,
                          color: Color(0xFF4E4E4E),
                        ),
                        style: TextStyle(
                          fontFamily: 'Circular',
                          color: Color(0xFF4E4E4E),
                          fontSize: pHeight * 0.022,
                        ),
                        underline: Container(
                          color: Color(0xFFE9E9E9),
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            course = newValue;
                          });
                        },
                        items: <String>['CSE', 'ECE', 'Biotech']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: pHeight * 0.02,
                  ),
                  Container(
                    width: pWidth * 0.9,
                    decoration: BoxDecoration(
                      color: Color(0xFFE9E9E9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton<String>(
                        value: year,
                        elevation: 16,
                        isExpanded: true,
                        dropdownColor: Color(0xFFE9E9E9),
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          size: pHeight * 0.035,
                          color: Color(0xFF4E4E4E),
                        ),
                        style: TextStyle(
                          fontFamily: 'Circular',
                          color: Color(0xFF4E4E4E),
                          fontSize: pHeight * 0.022,
                        ),
                        underline: Container(
                          color: Color(0xFFE9E9E9),
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            year = newValue;
                          });
                        },
                        items: <String>[
                          'First Year',
                          'Second Year',
                          'Third Year',
                          'Fourth Year'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: pHeight * 0.04,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => PersonalDetails(),
                        ),
                      );
                    },
                    child: Container(
                      width: pWidth * 0.9,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFF04F4E),
                            Color(0xFFFFB199),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Center(
                          child: Text(
                            'Continue to Personal Details',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Circular',
                                fontSize: pHeight * 0.03),
                          ),
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
    );
  }
}
