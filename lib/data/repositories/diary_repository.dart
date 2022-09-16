import '../../domain/i_repositories/diary_repository.dart';
import '../datasources/diary_datasource.dart';
import '../model/diary.dart';

class DiaryRepositoryImpl implements DiaryRepository {
  DiaryDatasource diaryDatasource = DiaryDatasource();
  @override
  List<DiaryData> fetchDiaryList() {
    return diaryDatasource.fetchDiaryList();
  }
}
