import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:solvecase/Classes/Constants.dart';
import 'package:solvecase/Classes/solution.dart';
import 'package:solvecase/Screens/DrawerScreen.dart';
import 'package:url_launcher/url_launcher.dart';

class Solutions extends StatefulWidget {
  String sub, year;
  Solutions({this.sub, this.year});

  @override
  _SolutionsState createState() => _SolutionsState();
}

class _SolutionsState extends State<Solutions> {
  String subject;
  sahikro(String sub) {
    List<String> arr = [' ', '-'];
    for (int i = 0; i < sub.length; i++) {
      if (sub[i] == arr[0] || sub[i] == arr[1]) {
        sub[i];
        i = i - 1;
      }
    }
    setState(() {
      print(sub);
      subject = sub;
    });
  }

  List<Solution> solutions = [];

  getDatabaseRef() async {
    DatabaseReference dbref = FirebaseDatabase.instance
        .reference()
        .child("JIIT")
        .child('Sem${widget.year}')
        .child('CSE')
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
    sahikro(widget.sub);
    getDatabaseRef();

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
                    'Solutions - ${widget.sub}',
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
                    return InkWell(
                      onTap: () {
                        _launchURL1(solutions[index].url);
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
                            child: Text(
                              '${solutions[index].name}',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.75),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.025),
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

  _launchURL1(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
