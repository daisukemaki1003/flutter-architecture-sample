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
      UserData(name: "test0", userId: "0", createdAt: DateTime.now());
  final diaties = [
    DiaryData(DateTime.now(), [_user], "title", "body"),
    DiaryData(DateTime.now(), [_user, _user], "title", "body"),
    DiaryData(DateTime.now(), [_user, _user, _user], "title", "body"),
    DiaryData(
        DateTime.now(), [_user, _user, _user, _user, _user], "title", "body"),
    DiaryData(
        DateTime.now(),
        [_user, _user, _user, _user, _user, _user, _user, _user],
        "title",
        "body"),
  ];

  List<DiaryData> getDiaryList() {
    return diaties;
  }
}
