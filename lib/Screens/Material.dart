import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:solvecase/Classes/Constants.dart';
import 'package:solvecase/Classes/DatabaseHelper.dart';
import 'package:solvecase/Classes/solution.dart';
import 'package:solvecase/Screens/DrawerScreen.dart';
import 'package:url_launcher/url_launcher.dart';

class StudyMaterial extends StatefulWidget {
  String sub, year;
  StudyMaterial({this.sub, this.year});

  @override
  _StudyMaterialState createState() => _StudyMaterialState();
}

class _StudyMaterialState extends State<StudyMaterial> {
  final dbHelper = DatabaseHelper.instance;

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

  List<Solution> solutions = [];

  getDatabaseRef() async {
    DatabaseReference dbref = FirebaseDatabase.instance
        .reference()
        .child(college)
        .child('StudyMaterial')
        .child('Sem${widget.year}')
        .child(course)
        .child(subject);
    await dbref.once().then((DataSnapshot snap) {
      // ignore: non_constant_identifier_names
      var KEYS = snap.value.keys;
      // ignore: non_constant_identifier_names
      var DATA = snap.value;
      solutions.clear();
      for (var key in KEYS) {
        Solution d = Solution(DATA[key]['Name'], DATA[key]['Url']);
        solutions.add(d);
      }
      setState(() {
        print(solutions.length);
      });
    });
  }

  TextEditingController search = new TextEditingController(text: '');
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    getUser();
    getUserData();

    sahikro(widget.sub);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pHeight = MediaQuery.of(context).size.height;
    final pWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: DrawerScreen(),
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            height: pHeight * 0.22,
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
                    'Study Material - ${widget.sub}',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: pHeight * 0.035,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: pHeight * 0.005,
                ),
                Center(
                  child: Container(
                    width: pWidth * 0.92,
                    height: pHeight * 0.05,
                    decoration: BoxDecoration(
                      color: Color(0xFFF7A1A1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: TextFormField(
                        controller: search,
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.search,
                            color: kPrimaryColor,
                          ),
                          hintText: 'Search',
                          hintStyle: TextStyle(
                              color: kPrimaryColor,
                              fontSize: pHeight * 0.02,
                              fontFamily: 'Poppins'),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: pHeight * 0.7,
              child: ListView.builder(
                  itemCount: solutions.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  '${solutions[index].name}',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.75),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.025),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(
                                        Icons.file_download,
                                        color: Colors.black.withOpacity(0.75),
                                      ),
                                      onPressed: () {
                                        _launchURL1(solutions[index].url);
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.bookmark,
                                        color: Colors.black.withOpacity(0.75),
                                      ),
                                      onPressed: () {
                                        print(solutions[index].url);
                                        addToCart(
                                            name:
                                                '${widget.sub} - ${solutions[index].name}',
                                            fileUrl: solutions[index].url);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }

  void addToCart({String name, String fileUrl}) async {
    print(name);
    print(fileUrl);
    Map<String, dynamic> row = {
      DatabaseHelper.columnFileName: name,
      DatabaseHelper.columnFileUrl: fileUrl,
    };

    Solution item = Solution.fromMap(row);
    final id = await dbHelper.insert(item);
    Fluttertoast.showToast(
        msg: 'Bookmark added', toastLength: Toast.LENGTH_SHORT);
  }

  _launchURL1(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
