import 'package:flutter/material.dart';
import 'package:solvecase/Classes/Constants.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
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
                  'About Us',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: pHeight * 0.035,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                height: pHeight * 0.23,
                width: pWidth,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Team',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: pHeight * 0.03,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      width: pWidth * 0.02,
                    ),
                    SizedBox(
                      width: pWidth * 0.75,
                      child: Divider(
                        thickness: 1.0,
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/sc logo.png',
                    height: pHeight * 0.45,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
