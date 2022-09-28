import 'package:man_memo_v2/domain/entity/model/user.dart';

class DiaryEntity {
  DateTime createdAt;
  List<UserEntity> users;
  String title;
  String body;
  DiaryEntity(
    this.createdAt,
    this.users,
    this.title,
    this.body,
  );

  setContent(String text) {
    int index = text.indexOf("\n");
    if (index < 0) {
      title = text;
    } else {
      title = text.substring(0, index);
      body = text.substring(index, text.length);
    }
  }
}
