import 'DatabaseHelper.dart';

class Solution {
  int id;
  String name, url;
  Solution(this.name, this.url);

  Solution.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['fileName'];
    url = map['fileUrl'];
  }

  Map<String, dynamic> toMap() {
    return {
      DatabaseHelper.columnId: id,
      DatabaseHelper.columnFileName: name,
      DatabaseHelper.columnFileUrl: url,
    };
  }
}
