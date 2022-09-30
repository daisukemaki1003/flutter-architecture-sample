import '../model/diary.dart';

class DiaryDataSource {
  static final DiaryDataSource _instance = DiaryDataSource._internal();
  DiaryDataSource._internal();

  factory DiaryDataSource() {
    return _instance;
  }

  List<DiaryData> getDiaryList() {
    return [];
  }
}
