import '../../../domain/stubs/diary/diary_fetch_list_interactor.dart';
import '../../../domain/usecases/diary/diary_fetch_list_input.dart';
import '../../../domain/usecases/diary/diary_fetch_list_output.dart';
import '../../../domain/usecases/diary/diary_fetch_list_usecase.dart';

class DiaryFetchListPresenter {
  final DiaryFetchListUseCase _usecase = DiaryFetchListInteractor();

  Stream<DiaryFetchListOutput> handle() async* {
    DiaryFetchListInput input = DiaryFetchListInput();
    DiaryFetchListOutput output = _usecase.handle(input);
    yield output;
  }
}
