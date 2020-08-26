import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:solvecase/Classes/Constants.dart';
import 'package:solvecase/Screens/MorePageScreens/ChatScreen.dart';
import 'package:url_launcher/url_launcher.dart';

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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          _launchURL('tel:+919027553376');
                        },
                        child: Column(
                          children: <Widget>[
                            Card(
                              color: kPrimaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                height: pHeight * 0.10,
                                width: pWidth * 0.40,
                                child: Center(
                                  child: Icon(
                                    Icons.phone,
                                    color: Colors.white,
                                    size: pHeight * 0.08,
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
                      ),
                      Column(
                        children: <Widget>[
                          InkWell(
                            onTap: () async {
                              await getUser();
                              await pushNewScreen(context,
                                  screen: ChatScreen(name, college, uid));
                            },
                            child: Card(
                              color: kPrimaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                height: pHeight * 0.10,
                                width: pWidth * 0.40,
                                child: Center(
                                  child: Icon(
                                    Icons.chat_bubble,
                                    color: Colors.white,
                                    size: pHeight * 0.08,
                                  ),
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

  String uid, name, college;
  getUser() async {
    FirebaseAuth mAuth = FirebaseAuth.instance;
    FirebaseUser user = await mAuth.currentUser();
    uid = await user.uid;

    await getUserData();
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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
            name = '${DATA[key]['fName']} ${DATA[key]['lName']}';

            college = DATA[key]['college'];
          });
        }
      }

    });
  }
}
