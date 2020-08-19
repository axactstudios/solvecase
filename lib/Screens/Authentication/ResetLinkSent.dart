import 'package:flutter/material.dart';

class ResetLinkSent extends StatefulWidget {
  @override
  _ResetLinkSentState createState() => _ResetLinkSentState();
}

class _ResetLinkSentState extends State<ResetLinkSent> {
  @override
  Widget build(BuildContext context) {
    final pHeight = MediaQuery.of(context).size.height;
    final pWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
                      'Recovery Email\nsent',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Circular',
                          fontSize: pHeight * 0.035),
                    ),
                    SizedBox(
                      height: pHeight * 0.3,
                    ),
                    Text(
                      'A password recovery link has been sent to your email. Click the link and set a new password.',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Circular',
                          fontSize: pHeight * 0.025),
                    ),
                    SizedBox(
                      height: pHeight * 0.04,
                    ),
                    InkWell(
                      onTap: () {
//                      Navigator.push(
//                        context,
//                        CupertinoPageRoute(
//                          builder: (context) => PersonalDetails(),
//                        ),
//                      );
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
                              'Continue to Sign In',
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
    );
  }
}
