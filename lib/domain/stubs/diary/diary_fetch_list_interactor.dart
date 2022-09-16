import 'package:man_memo_v2/data/repositories/diary_repository.dart';
import 'package:man_memo_v2/domain/entity/model/diary.dart';
import 'package:man_memo_v2/domain/i_repositories/diary_repository.dart';

import 'package:man_memo_v2/domain/usecases/diary/diary_fetch_list_usecase.dart';

import '../../../data/model/diary.dart';
import '../../usecases/diary/diary_fetch_list_input.dart';
import '../../usecases/diary/diary_fetch_list_output.dart';

class DiaryFetchListInteractor implements DiaryFetchListUseCase {
  DiaryRepository diaryRepository = DiaryRepositoryImpl();

  @override
  DiaryFetchListOutput handle(DiaryFetchListInput input) {
    List<DiaryData> diaryDataList = diaryRepository.fetchDiaryList();
    List<DiaryEntity> diaryEntityList =
        diaryDataList.map((diary) => translate(diary)).toList();
    return DiaryFetchListOutput(diaryEntityList);
  }

  /// Transformer
  DiaryEntity translate(DiaryData diary) {
    return DiaryEntity(diary.createdAt, diary.names, diary.body);
  }
}
