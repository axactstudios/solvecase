import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:solvecase/Classes/Constants.dart';
import 'package:solvecase/Classes/Videos.dart';
import 'package:solvecase/Classes/VideosDatabaseHelper.dart';

import '../Classes/Videos.dart';

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

  final dbHelper = VideosDatabaseHelper.instance;

  getUser() async {
    FirebaseAuth mAuth = FirebaseAuth.instance;
    FirebaseUser user = await mAuth.currentUser();
    setState(() {
      uid = user.uid;
      print(uid);
    });
  }

  int count;
  increase() async {
    DatabaseReference dbref1 = FirebaseDatabase.instance
        .reference()
        .child('JIIT')
        .child("Analysis")
        .child('Study Material');
    await dbref1.once().then((DataSnapshot snap) {
      // ignore: non_constant_identifier_names
      var KEYS = snap.value.keys;
      // ignore: non_constant_identifier_names
      var DATA = snap.value;

      for (var key in KEYS) {
        count = DATA[key]['Count'];
      }
      setState(() {
        print(count);
      });
    });
    DatabaseReference dbref = FirebaseDatabase.instance.reference();
    await dbref
        .child('JIIT')
        .child("Analysis")
        .child('Lecture Plays')
        .child('Count')
        .set({
      "Count": count + 1,
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
            height: pHeight * 0.19,
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
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
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
              ],
            ),
          ),
          Container(
            height: pHeight * 0.7,
            child: lectures.length != 0
                ? ListView.builder(
                    itemCount: lectures.length,
                    itemBuilder: (context, index) {
                      return Card(
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
                            padding: EdgeInsets.all(pWidth * 0.01),
                            child: Row(
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    increase();
                                    playVideo(lectures[index].url);
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      'https://img.youtube.com/vi/${lectures[index].key}/0.jpg',
                                      height: pHeight * 0.15,
                                      width: pWidth * 0.5,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: pWidth * 0.05,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: pWidth * 0.4,
                                      child: Text(
                                        lectures[index].name,
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.75),
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold,
                                            fontSize: pWidth * 0.055),
                                        overflow: TextOverflow.fade,
                                      ),
                                    ),
                                    Text(
                                      '${widget.sub}',
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.55),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                          fontSize: pWidth * 0.05),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        SizedBox(
                                          width: pWidth * 0.4,
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            Icons.bookmark,
                                            color:
                                                Colors.black.withOpacity(0.55),
                                          ),
                                          onPressed: () async {
                                            bool status = await _query(
                                                lectures[index].name);
                                            if (!status) {
                                              addToCart(
                                                  name: lectures[index].name,
                                                  key: lectures[index].key,
                                                  fileUrl: lectures[index].url);
                                            } else {
                                              Fluttertoast.showToast(
                                                  msg: 'Already bookmarked',
                                                  textColor: Colors.black,
                                                  backgroundColor:
                                                      Colors.white);
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
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

  Future<bool> _query(String name) async {
    Videos item;
    final allRows = await dbHelper.queryRows(name);
    allRows.forEach((row) => item = Videos.fromMap(row));
    if (item == null) {
      return false;
    } else {
      return true;
    }
  }

  void addToCart({String name, String fileUrl, String key}) async {
    print(name);
    print(fileUrl);
    Map<String, dynamic> row = {
      VideosDatabaseHelper.columnFileName: name,
      VideosDatabaseHelper.columnFileUrl: fileUrl,
      VideosDatabaseHelper.columnVideoKey: key
    };

    Videos item = Videos.fromMap(row);
    final id = await dbHelper.insert(item);
    Fluttertoast.showToast(
        msg: 'Bookmark added', toastLength: Toast.LENGTH_SHORT);
  }

  void playVideo(String url) {
    FlutterYoutube.playYoutubeVideoByUrl(
        apiKey: 'AIzaSyDc1hCen9iG3B95E5EVj_TyBKdEaKQNGxU', //Enter your API key
        videoUrl: url,
        fullScreen: true);
  }
}
