import 'package:solvecase/Classes/VideosDatabaseHelper.dart';

class Videos {
  int id;
  String url, name, key;

  Videos({this.url, this.name, this.key});

  Videos.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['fileName'];
    url = map['fileUrl'];
    key = map['videoKey'];
  }

  Map<String, dynamic> toMap() {
    return {
      VideosDatabaseHelper.columnId: id,
      VideosDatabaseHelper.columnFileName: name,
      VideosDatabaseHelper.columnFileUrl: url,
      VideosDatabaseHelper.columnVideoKey: key,
    };
  }
}
