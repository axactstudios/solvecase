import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Lectures extends StatefulWidget {
  String sub;
  Lectures({this.sub});

  @override
  _LecturesState createState() => _LecturesState();
}

class _LecturesState extends State<Lectures> {
  @override
  Widget build(BuildContext context) {
    final pHeight = MediaQuery.of(context).size.height;
    final pWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            'https://i.ytimg.com/vi/XzJ1WnFTVds/maxresdefault.jpg',
                            height: pHeight * 0.15,
                            width: pWidth * 0.5,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: pWidth * 0.05,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Video title ${index + 1}',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.75),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.025),
                            ),
                            Text(
                              '${widget.sub}',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.55),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.018),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
