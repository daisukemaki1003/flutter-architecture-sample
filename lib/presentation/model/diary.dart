class DiaryModel {
  DateTime createdAt;
  List<String> userNames;
  String body;
  DiaryModel({
    required this.userNames,
    required this.createdAt,
    required this.body,
  });
}
