import 'package:flutter/material.dart';
import 'package:solvecase/Classes/Constants.dart';
import 'package:url_launcher/url_launcher.dart';

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
      backgroundColor: darkColor,
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
                      'Team Axact Studios',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: pHeight * 0.03,
                          fontWeight: FontWeight.bold,
                          color: txtColor),
                    ),
                    SizedBox(
                      width: pWidth * 0.02,
                    ),
                    SizedBox(
                      width: pWidth * 0.25,
                      child: Divider(
                        thickness: 1.0,
                        color: txtColor.withOpacity(0.4),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Image.asset(
                      'assets/images/Group 1.png',
                      scale: 2.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'We code experiences that make your life easier, make your business grow and satisfies your costumers. ',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: txtColor,
                      fontFamily: 'Circular',
                      fontSize: pHeight * 0.025),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        _launchURL(
                            'https://www.facebook.com/axactstudios-116214423501663');
                      },
                      child: Image.asset(
                        'assets/images/facebook 1.png',
                        scale: 0.8,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _launchURL('https://www.instagram.com/axactstudios/');
                      },
                      child: Image.asset(
                        'assets/images/instagram 1.png',
                        scale: 0.8,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _launchURL(
                            'https://www.linkedin.com/company/axactstudios/');
                      },
                      child: Image.asset(
                        'assets/images/linkedin.png',
                        scale: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
