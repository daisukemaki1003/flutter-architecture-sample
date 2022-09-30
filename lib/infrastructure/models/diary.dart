import 'package:man_memo_v2/infrastructure/models/user.dart';

class DiaryData {
  DateTime createdAt;
  List<int> usersId;
  String title;
  String body;
  DiaryData(
    this.createdAt,
    this.usersId,
    this.title,
    this.body,
  );
}
