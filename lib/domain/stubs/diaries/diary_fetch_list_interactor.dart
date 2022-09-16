import 'package:man_memo_v2/data/repositories/diaries_repository.dart';
import 'package:man_memo_v2/domain/entity/model/diary.dart';
import 'package:man_memo_v2/domain/i_repositories/diaries_repository.dart';

import 'package:man_memo_v2/domain/usecases/diaries/diary_fetch_list/diary_fetch_list_usecase.dart';

import '../../../data/model/diary.dart';
import '../../usecases/diaries/diary_fetch_list/diary_fetch_list_input.dart';
import '../../usecases/diaries/diary_fetch_list/diary_fetch_list_output.dart';

class DiaryFetchListInteractor implements DiaryFetchListUseCase {
  DiariesRepository diaryRepository = DiariesRepositoryImpl();

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
