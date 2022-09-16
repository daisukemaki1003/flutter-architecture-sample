import '../model/diary.dart';

class DiaryDatasource {
  List<DiaryData> fetchDiaryList() {
    List<DiaryData> data = [];
    data.add(DiaryData(DateTime.now(), ["name"],
        """data.add(DiaryData(DateTime.now(), ["name"], ""));"""));
    data.add(DiaryData(DateTime.now(), ["name", "name1"], """
data.add(DiaryData(DateTime.now(), ["name"], data.add(DiaryData(DateTime.now(), ["name"], ""));));
    """));
    data.add(DiaryData(DateTime.now(), ["name", "name1", "name2"], ""));
    data.add(
        DiaryData(DateTime.now(), ["name", "name1", "name2", "name3"], ""));
    return data;
  }
}
