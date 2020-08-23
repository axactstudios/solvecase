import 'package:device_info/device_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:regexed_validator/regexed_validator.dart';
import 'package:solvecase/Screens/Authentication/ForgotPassword.dart';
import 'package:solvecase/Screens/MainScreen.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  FirebaseAuth mAuth = FirebaseAuth.instance;
  TextEditingController emailC = new TextEditingController(text: '');
  TextEditingController pwC = new TextEditingController(text: '');
  String deviceUid, deviceType;

  bool isObscured = true;

  @override
  void initState() {
    isObscured = true;
    deviceUid = '';
    deviceType = '';
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final pHeight = MediaQuery.of(context).size.height;
    final pWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
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
                        'Welcome\nBack!',
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
                        'Sign In',
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
                        height: pHeight * 0.02,
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
                            controller: pwC,
                            obscureText: isObscured,
                            validator: (value) {
                              if (value.length < 6) {
                                return 'Invalid Password';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              suffix: isObscured
                                  ? InkWell(
                                      onTap: () {
                                        setState(() {
                                          isObscured = false;
                                        });
                                      },
                                      child: Icon(
                                        Icons.visibility,
                                        color: Color(0xFF4E4E4E),
                                      ),
                                    )
                                  : InkWell(
                                      onTap: () {
                                        setState(() {
                                          isObscured = true;
                                        });
                                      },
                                      child: Icon(
                                        Icons.visibility_off,
                                        color: Color(0xFF4E4E4E),
                                      ),
                                    ),
                              hintText: 'Password',
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
                        height: pHeight * 0.01,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => ForgotPassword(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 2.0),
                          child: Text(
                            'Forgot Password?',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Circular',
                                fontSize: pHeight * 0.018),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: pHeight * 0.04,
                      ),
                      InkWell(
                        onTap: () {
                          if (_formKey.currentState.validate()) {
                            signIn();
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
                                'Sign In',
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

  Future<String> _getId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      deviceUid = iosDeviceInfo.identifierForVendor; // unique ID on iOS
      deviceType = 'iPhone';
      setState(() {
        print('Device uid found');
      });
    } else {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      deviceUid = androidDeviceInfo.androidId; // unique ID on Android
      deviceType = 'Android';
      setState(() {
        print('Device uid found');
      });
    }
  }

  void signIn() async {
    mAuth
        .signInWithEmailAndPassword(email: emailC.text, password: pwC.text)
        .then((AuthResult) async {
      FirebaseUser user = await FirebaseAuth.instance.currentUser();

      if (!user.isEmailVerified) {
        Fluttertoast.showToast(
            msg: 'Please verify your email to continue',
            toastLength: Toast.LENGTH_LONG);
      } else {
        await _getId();

        var dbRef = FirebaseDatabase.instance
            .reference()
            .child('Users')
            .child(user.uid);
        dbRef.once().then((DataSnapshot snap) async {
          bool signedIn = await snap.value['is${deviceType}SignedIn'];
          String devId = await snap.value['deviceUid'];
          if (signedIn) {
            showCupertinoDialog(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    title: Text('You are already signed in.'),
                    actions: <Widget>[
                      CupertinoDialogAction(
                        child: Text('OK'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  );
                });
          } else {
            if (devId == deviceUid) {
              var dbRef = FirebaseDatabase.instance
                  .reference()
                  .child('Users')
                  .child(user.uid)
                  .update({'is${deviceType}SignedIn': true});
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MainScreen(),
                ),
              );
            } else {
              showCupertinoDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: Text('This is not your registered device'),
                      actions: <Widget>[
                        CupertinoDialogAction(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    );
                  });
            }
          }
        });
      }
    }).catchError((err) {
      if (err.code == "ERROR_USER_NOT_FOUND") {
        showCupertinoDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: Text(
                    'This email is not yet registered. Please sign up first.'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              );
            });
      }
      if (err.code == "ERROR_WRONG_PASSWORD") {
        showCupertinoDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title:
                    Text('Wrong password. Please enter the correct password.'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              );
            });
      }
      if (err.code == "ERROR_NETWORK_REQUEST_FAILED") {
        showCupertinoDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: Text(
                    'Your internet connection is either too slow or not available.'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              );
            });
      }
    });
  }
}
