import 'package:bubble/bubble.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ntp/ntp.dart';
import 'package:solvecase/Classes/Constants.dart';

class ChatScreen extends StatefulWidget {
  String name, uid, college;
  ChatScreen(this.name, this.college, this.uid);
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

DatabaseReference ref = FirebaseDatabase.instance.reference().child('Messages');
FirebaseAuth mAuth = FirebaseAuth.instance;

class _ChatScreenState extends State<ChatScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: _scaffoldkey,
        backgroundColor: darkColor,
        appBar: new AppBar(
          leading: InkWell(
            child: Icon(Icons.arrow_back),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: kPrimaryColor,
          title: new Text("SolveCase Support"),
        ),
        body: new Column(children: <Widget>[
          new Flexible(
              child: StreamBuilder<Event>(
            stream: ref.onValue,
            builder: (context, snap) {
              if (snap.hasData &&
                  !snap.hasError &&
                  snap.data.snapshot.value != null) {
                Map data = snap.data.snapshot.value;
                List item = [];

                data.forEach(
                    (index, data) => item.add({"key": index, ...data}));
                List messages = [];
                for (var msg in item) {
                  if ((msg['Sender'] == widget.name &&
                          msg['Receiver'] == 'BOSS') ||
                      (msg['Receiver'] == widget.name &&
                          msg['Sender'] == 'BOSS')) {
                    messages.add(msg);
                  }
                }
                Comparator timeComparator =
                    (a, b) => b['Time Stamp'].compareTo(a['Time Stamp']);
                messages.sort(timeComparator);
                return ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    return messages[index]['Sender'] == widget.name
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Bubble(
                              alignment: Alignment.centerRight,
                              nip: BubbleNip.rightTop,
                              child: Text(messages[index]['Text']),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Bubble(
                              alignment: Alignment.centerLeft,
                              nip: BubbleNip.leftTop,
                              child: Text(messages[index]['Text']),
                            ),
                          );
                  },
                );
              } else
                return Expanded(
                    child: Container(
                        child: Center(
                            child: Text(
                  "No Messages",
                  style: TextStyle(color: txtColor),
                ))));
            },
          )),
          new Divider(height: 1.0),
          new Container(
            decoration: new BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          ),
          Container(
            height: 20,
          )
        ]));
  }

  TextEditingController _textController = new TextEditingController();
  bool _isComposing = false;

  Widget _buildTextComposer() {
    return new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(children: <Widget>[
          new Flexible(
            child: new TextField(
              controller: _textController,
              onChanged: (String text) {
                setState(() {
                  _isComposing = text.length > 0;
                });
              },
              onSubmitted: _isComposing ? _handleSubmitted : null,
              decoration:
                  new InputDecoration.collapsed(hintText: "Send a message"),
            ),
          ),
          new Container(
              margin: new EdgeInsets.symmetric(horizontal: 4.0),
              child: new CupertinoButton(
                child: new Text("Send"),
                onPressed: () => _handleSubmitted(_textController.text),
              )),
        ]),
        decoration: Theme.of(context).platform == TargetPlatform.iOS
            ? new BoxDecoration(
                border:
                    new Border(top: new BorderSide(color: Colors.grey[200])))
            : null);
  }

  void _handleSubmitted(String text) async {
    setState(() {
      _isComposing = false;
    });
    var now = await NTP.now();
    print('============================$widget.name');
    if (_textController.text != null) {
      ref.push().set({
        'Text': _textController.text,
        'Sender': widget.name,
        'Time Stamp': now.toString(),
        'Receiver': 'BOSS',
        'College': widget.college
      }).then((value) => _textController.clear());
    } else {
      print('No Message');
    }
    print(now.toString());
    setState(() {});
    await _textController.clear();
  }
}
