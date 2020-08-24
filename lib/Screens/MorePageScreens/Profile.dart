import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileSettings extends StatefulWidget {
  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  TextEditingController fName = new TextEditingController(text: '');
  TextEditingController lName = new TextEditingController(text: '');
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
            fName = TextEditingController(text: DATA[key]['fName']);
            lName = TextEditingController(text: DATA[key]['lName']);
            college = DATA[key]['college'];
            course = DATA[key]['course'];
            year = DATA[key]['year'];
          });
        }
      }
      setState(() {
        print(college);
      });
    });
  }

  @override
  void initState() {
    super.initState();

    getUser();
  }

  @override
  Widget build(BuildContext context) {
    final pHeight = MediaQuery.of(context).size.height;
    final pWidth = MediaQuery.of(context).size.width;
    return Scaffold(
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
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: pHeight * 0.01,
                width: pWidth,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'Profile Settings',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: pHeight * 0.035,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                height: pHeight * 0.04,
                width: pWidth,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/Group 13.png',
                    height: pHeight * 0.25,
                  ),
                ],
              ),
              SizedBox(
                height: pHeight * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: pWidth * 0.4,
                    decoration: BoxDecoration(
                      color: Color(0xFFE9E9E9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: TextFormField(
                        controller: fName,
                        validator: (value) {
                          if (value.length == 0) {
                            return 'Invalid Name';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'First Name',
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          hintStyle: TextStyle(
                              fontFamily: 'Circular', fontSize: pHeight * 0.02),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: pWidth * 0.1,
                  ),
                  Container(
                    width: pWidth * 0.4,
                    decoration: BoxDecoration(
                      color: Color(0xFFE9E9E9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: TextFormField(
                        controller: lName,
                        validator: (value) {
                          if (value.length == 0) {
                            return 'Invalid Name';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Last Name',
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          hintStyle: TextStyle(
                              fontFamily: 'Circular', fontSize: pHeight * 0.02),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: pWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
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
                  ],
                ),
              ),
              SizedBox(
                height: pHeight * 0.04,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
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
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Text(
                          'Save',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Circular',
                              fontSize: pHeight * 0.03),
                        ),
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
