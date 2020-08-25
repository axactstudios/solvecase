import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:solvecase/Classes/VideosDatabaseHelper.dart';

import '../../Classes/Constants.dart';
import '../../Classes/Videos.dart';
import '../../Classes/Videos.dart';

class VideoBookmarks extends StatefulWidget {
  @override
  _VideoBookmarksState createState() => _VideoBookmarksState();
}

class _VideoBookmarksState extends State<VideoBookmarks> {
  final dbHelper = VideosDatabaseHelper.instance;
  List<Videos> bookmarks = [];

  void getAllItems() async {
    final allRows = await dbHelper.queryAllRows();
    bookmarks.clear();
    allRows.forEach((row) => bookmarks.add(Videos.fromMap(row)));
    setState(() {});
  }

  @override
  void initState() {
    getAllItems();
  }

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
                    'Lectures Bookmarks',
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
            child: bookmarks.length != 0
                ? ListView.builder(
                    itemCount: bookmarks.length,
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
                                    playVideo(bookmarks[index].url);
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      'https://img.youtube.com/vi/${bookmarks[index].key}/0.jpg',
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
                                        bookmarks[index].name,
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.75),
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold,
                                            fontSize: pWidth * 0.055),
                                        overflow: TextOverflow.fade,
                                      ),
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

  void playVideo(String url) {
    FlutterYoutube.playYoutubeVideoByUrl(
        apiKey: 'AIzaSyDc1hCen9iG3B95E5EVj_TyBKdEaKQNGxU', //Enter your API key
        videoUrl: url,
        fullScreen: true);
  }
}
