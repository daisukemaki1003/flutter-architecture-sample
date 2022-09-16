import '../../domain/i_repositories/diaries_repository.dart';
import '../datasources/diary_datasource.dart';
import '../model/diary.dart';

class DiariesRepositoryImpl implements DiariesRepository {
  DiaryDataSource diaryDatasource = DiaryDataSource();

  @override
  List<DiaryData> fetchDiaryList() {
    return diaryDatasource.fetchDiaryList();
  }
}
