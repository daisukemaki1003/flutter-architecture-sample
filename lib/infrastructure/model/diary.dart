import 'package:man_memo_v2/infrastructure/model/user.dart';

class DiaryData {
  DateTime createdAt;
  List<UserData> users;
  String title;
  String body;
  DiaryData(
    this.createdAt,
    this.users,
    this.title,
    this.body,
  );
}
