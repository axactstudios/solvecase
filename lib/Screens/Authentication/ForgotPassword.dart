import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:regexed_validator/regexed_validator.dart';
import 'package:solvecase/Screens/Authentication/ResetLinkSent.dart';
import 'package:solvecase/Classes/Constants.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailC = new TextEditingController(text: '');
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final pHeight = MediaQuery.of(context).size.height;
    final pWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: darkColor,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
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
                        'Recover your\npassword',
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
                        'A password recovery link will be sent to your email. Click the link and set a new password.',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: txtColor,
                            fontFamily: 'Circular',
                            fontSize: pHeight * 0.025),
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
                          padding: const EdgeInsets.all(2.0),
                          child: TextFormField(
                            controller: emailC,
                            validator: (value) {
                              if (!validator.email(value)) {
                                return 'Invalid Email';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'Email',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintStyle: TextStyle(
                                  fontFamily: 'Circular',
                                  fontSize: pHeight * 0.02),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: pHeight * 0.04,
                      ),
                      InkWell(
                        onTap: () async {
                          if (_formKey.currentState.validate()) {
                            await FirebaseAuth.instance
                                .sendPasswordResetEmail(email: emailC.text)
                                .then((value) {
                              Navigator.pushReplacement(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => ResetLinkSent(),
                                ),
                              );
                            });
                          }
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
                                'Continue',
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
        ),
      ),
    );
  }
}
