import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:solvecase/Classes/Constants.dart';
import 'package:solvecase/Screens/MainScreen.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  String uid;
  LoginPage({this.uid});

  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<LoginPage> {
  TextEditingController enrollController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  DatabaseReference dbRef = FirebaseDatabase.instance.reference();

  void writeData() {
    dbRef
        .child('Users')
        .child('u${widget.uid}')
        .set({'enroll': enrollController.text, "sem": _value});

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MainScreen(),
      ),
    );
  }

  int _value = 1;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  validator: (value) {
                    if (value.length < 8) {
                      return 'Invalid enrollment number';
                    } else {
                      return null;
                    }
                  },
                  controller: enrollController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enrollment Number',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Select your semester',
                      style: TextStyle(fontSize: height * 0.02),
                    ),
                    SizedBox(
                      width: width * 0.1,
                    ),
                    DropdownButton(
                        value: _value,
                        items: [
                          DropdownMenuItem(
                            child: Text("First Semester"),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text("Second Semester"),
                            value: 2,
                          ),
                          DropdownMenuItem(
                            child: Text("Third Semester"),
                            value: 3,
                          ),
                          DropdownMenuItem(
                            child: Text("Fourth Semester"),
                            value: 4,
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _value = value;
                          });
                        }),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: kPrimaryColor,
                  child: Text('Save'),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      writeData();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
