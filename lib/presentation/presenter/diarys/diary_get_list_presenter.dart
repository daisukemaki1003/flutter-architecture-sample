import 'package:man_memo_v2/views/models/diary.dart';

import '../../../domain/stubs/diaries/diary_fetch_list_interactor.dart';
import '../../../domain/usecases/diaries/diary_fetch_list/diary_fetch_list_input.dart';
import '../../../domain/usecases/diaries/diary_fetch_list/diary_fetch_list_output.dart';
import '../../../domain/usecases/diaries/diary_fetch_list/diary_fetch_list_usecase.dart';
import '../transformer.dart';

class DiaryGetListPresenter {
  Transformer transformer = Transformer();
  final DiaryFetchListUseCase _usecase = DiaryFetchListInteractor();

  Future<List<Diary>> handle() async {
    DiaryFetchListInput input = DiaryFetchListInput();
    DiaryFetchListOutput output = _usecase.handle(input);

    return output.diaries
        .map((e) => transformer.diaryEntityToDiaryModel(e))
        .toList();
  }
}
