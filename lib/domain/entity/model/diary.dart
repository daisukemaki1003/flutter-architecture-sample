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
}
