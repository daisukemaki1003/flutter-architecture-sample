import '../model/diary.dart';
import '../model/user.dart';

class DiaryDataSource {
  static final DiaryDataSource _instance = DiaryDataSource._internal();
  DiaryDataSource._internal();

  factory DiaryDataSource() {
    return _instance;
  }

  String body = "# title";
  static final _user =
      UserData(name: "test1", userId: "0", createdAt: DateTime.now());

  static final _user1 =
      UserData(name: "test2", userId: "0", createdAt: DateTime.now());

  static final _user2 =
      UserData(name: "test3", userId: "0", createdAt: DateTime.now());
  final diaties = [
    DiaryData(DateTime.now(), [_user], "title", "body"),
    DiaryData(DateTime.now(), [_user, _user1], "title", "body"),
    DiaryData(DateTime.now(), [_user, _user1, _user2], "title", "body"),
    DiaryData(
        DateTime.now(), [_user, _user, _user1, _user, _user], "title", "body"),
    DiaryData(
        DateTime.now(),
        [_user, _user, _user, _user, _user, _user, _user1, _user],
        "title",
        "body"),
  ];

  List<DiaryData> getDiaryList() {
    return diaties;
  }
}
