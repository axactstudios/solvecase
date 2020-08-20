import 'package:flutter/material.dart';

class Solutions extends StatefulWidget {
  String sub;
  Solutions({this.sub});

  @override
  _SolutionsState createState() => _SolutionsState();
}

class _SolutionsState extends State<Solutions> {
  @override
  Widget build(BuildContext context) {
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
                    child: Text(
                      '${widget.sub} Solutions - Assignment ${index + 1}',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.75),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height * 0.025),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
