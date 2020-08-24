import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';
import 'package:solvecase/Classes/Constants.dart';

class ContactSupport extends StatefulWidget {
  @override
  _ContactSupportState createState() => _ContactSupportState();
}

class _ContactSupportState extends State<ContactSupport> {
  final controller = MapController(
    location: LatLng(28.62, 77.37),
  );
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
                  'Contact Support',
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: pHeight * 0.18,
                    width: pWidth,
                  ),
                  Container(
                    height: pHeight * 0.25,
                    width: pWidth * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Map(
                      controller: controller,
                    ),
                  ),
                  SizedBox(
                    height: pHeight * 0.02,
                    width: pWidth,
                  ),
                  Text(
                    'Contact SolveCase Support',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: pHeight * 0.03,
                        fontWeight: FontWeight.bold,
                        color: txtColor),
                  ),
                  SizedBox(
                    height: pHeight * 0.01,
                    width: pWidth,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Card(
                            color: kPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              height: pHeight * 0.14,
                              width: pWidth * 0.45,
                              child: Center(
                                child: Icon(
                                  Icons.phone,
                                  color: Colors.white,
                                  size: pHeight * 0.1,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Call SolveCase Support\nTeam',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: pHeight * 0.018,
                                fontWeight: FontWeight.w400,
                                color: txtColor),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Card(
                            color: kPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              height: pHeight * 0.14,
                              width: pWidth * 0.45,
                              child: Center(
                                child: Icon(
                                  Icons.chat_bubble,
                                  color: Colors.white,
                                  size: pHeight * 0.1,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Chat with SolveCase\nSupport Team',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: pHeight * 0.018,
                                fontWeight: FontWeight.w400,
                                color: txtColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
