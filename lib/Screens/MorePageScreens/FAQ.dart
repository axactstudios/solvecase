import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solvecase/Classes/Constants.dart';

class FAQ extends StatefulWidget {
  @override
  _FAQState createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  TextEditingController search = new TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    final pHeight = MediaQuery.of(context).size.height;
    final pWidth = MediaQuery.of(context).size.width;
    return Scaffold(
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
                    'FAQ',
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
                  itemCount: 15,
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
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'FAQ ${index + 1}',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.75),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.025),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                              )
                            ],
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
}
