import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:solvecase/Classes/Constants.dart';
import 'package:solvecase/Classes/Videos.dart';
import 'package:solvecase/Classes/solution.dart';

class Lectures extends StatefulWidget {
  String sub, year;
  Lectures({this.sub, this.year});

  @override
  _LecturesState createState() => _LecturesState();
}

class _LecturesState extends State<Lectures> {
  String subject, uid, college, course;
  void replaceCharAt(String oldString, int index, String newChar) {
    subject = oldString.substring(0, index) +
        newChar +
        oldString.substring(index + 1);
  }

  getUser() async {
    FirebaseAuth mAuth = FirebaseAuth.instance;
    FirebaseUser user = await mAuth.currentUser();
    setState(() {
      uid = user.uid;
      print(uid);
    });
  }

  sahikro(String sub) {
    subject = sub;
    List<String> arr = [' ', '-'];
    for (int i = 0; i < sub.length; i++) {
      if (sub[i] == arr[0] || sub[i] == arr[1]) {
        replaceCharAt(subject, i, 's');
      }
    }
    setState(() {
      print(subject);
    });
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
          college = DATA[key]['college'];
          course = DATA[key]['course'];
        }
      }
      setState(() {
        print(college);
      });
    });
    getDatabaseRef();
  }

  List<Videos> lectures = [];

  getDatabaseRef() async {
    DatabaseReference dbref = FirebaseDatabase.instance
        .reference()
        .child(college)
        .child('Lectures')
        .child('Sem${widget.year}')
        .child(course)
        .child(subject);
    await dbref.once().then((DataSnapshot snap) {
      // ignore: non_constant_identifier_names
      var KEYS = snap.value.keys;
      // ignore: non_constant_identifier_names
      var DATA = snap.value;
      lectures.clear();
      for (var key in KEYS) {
        Videos v = Videos(
            url: DATA[key]['Url'],
            name: DATA[key]['Name'],
            key: DATA[key]['VideoKey']);
        lectures.add(v);
      }
      setState(() {
        print(lectures.length);
      });
    });
  }

  @override
  void initState() {
    getUser();
    getUserData();

    sahikro(widget.sub);

    super.initState();
  }

  TextEditingController search = new TextEditingController(text: '');
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final pHeight = MediaQuery.of(context).size.height;
    final pWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: darkColor,
      body: Column(
        children: <Widget>[
          Container(
            height: pHeight * 0.18,
            width: pWidth,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  kPrimaryColor,
                  Color(0xFFF26969),
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: pHeight * 0.04,
                ),
                IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _scaffoldKey.currentState.openDrawer();
                  },
                ),
                SizedBox(
                  height: pHeight * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Lectures - ${widget.sub}',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: pHeight * 0.035,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
//                Center(
//                  child: Container(
//                    width: pWidth * 0.92,
//                    height: pHeight * 0.05,
//                    decoration: BoxDecoration(
//                      color: Color(0xFFF7A1A1),
//                      borderRadius: BorderRadius.circular(8),
//                    ),
//                    child: Center(
//                      child: TextFormField(
//                        controller: search,
//                        decoration: InputDecoration(
//                          suffixIcon: Icon(
//                            Icons.search,
//                            color: kPrimaryColor,
//                          ),
//                          hintText: 'Search',
//                          hintStyle: TextStyle(
//                              color: kPrimaryColor,
//                              fontSize: pHeight * 0.02,
//                              fontFamily: 'Poppins'),
//                          border:
//                              OutlineInputBorder(borderSide: BorderSide.none),
//                        ),
//                      ),
//                    ),
//                  ),
//                )
              ],
            ),
          ),
          Container(
            height: pHeight * 0.7,
            child: lectures.length != 0
                ? ListView.builder(
                    itemCount: lectures.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          playVideo(lectures[index].url);
                        },
                        child: Card(
                          margin: EdgeInsets.only(bottom: 20),
                          elevation: 1,
                          shadowColor: Colors.black.withOpacity(0.75),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      'https://img.youtube.com/vi/${lectures[index].key}/0.jpg',
                                      height: pHeight * 0.15,
                                      width: pHeight * 0.25,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    width: pWidth * 0.05,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        lectures[index].name,
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.75),
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.025),
                                      ),
                                      Text(
                                        '${widget.sub}',
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.55),
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.018),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : Text(
                    'No videos',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.55),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height * 0.025),
                  ),
          ),
        ],
      ),
    );
  }

  void playVideo(String url) {
    FlutterYoutube.playYoutubeVideoByUrl(
        apiKey: 'AIzaSyDc1hCen9iG3B95E5EVj_TyBKdEaKQNGxU', //Enter your API key
        videoUrl: url,
        fullScreen: true);
  }
}
