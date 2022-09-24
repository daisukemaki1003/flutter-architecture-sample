import 'user.dart';

class Diary {
  DateTime createdAt;
  List<UserModel> users;
  String title;
  String body;
  Diary({
    required this.createdAt,
    required this.users,
    required this.title,
    required this.body,
  });
}

class DiaryViewModel {
  Diary? diary;
  final List<Diary> diaries;
  DiaryViewModel(this.diaries);
}
