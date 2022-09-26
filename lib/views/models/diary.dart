import 'user.dart';

class Diary {
  final DateTime createdAt;
  List<UserModel> users;
  String content = "";
  Diary({
    required this.createdAt,
    required this.users,
    required this.content,
  });

  // setDiary(String text) {
  //   int index = text.indexOf("\n");
  //   if (index < 0) {
  //     title = text;
  //   } else {
  //     title = text.substring(0, index);
  //     body = text.substring(index, text.length);
  //   }
  // }
}

class DiaryViewModel {
  Diary? diary;
  final List<Diary> diaries;
  DiaryViewModel(this.diaries);
}
