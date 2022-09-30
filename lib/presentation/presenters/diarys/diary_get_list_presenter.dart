import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/domain/entity/model/diary.dart';

import '../../../domain/interactor/diaries/diary_get_list_interactor.dart';
import '../../../domain/usecases/diaries/diary_get_list/diary_get_list_input.dart';
import '../../../domain/usecases/diaries/diary_get_list/diary_get_list_usecase.dart';

///
/// Notifier provider
///
final diaryGetListPresenterNotifierProvider = StateNotifierProvider<
    DiaryGetListPresenterNotifier, AsyncValue<List<DiaryEntity>>>((ref) {
  return DiaryGetListPresenterNotifier(ref)..initialize();
});

///
/// Notifier
///
class DiaryGetListPresenterNotifier
    extends StateNotifier<AsyncValue<List<DiaryEntity>>> {
  DiaryGetListPresenterNotifier(this.ref)
      : super(const AsyncValue<List<DiaryEntity>>.loading());

  final Ref ref;

  Future<void> initialize() async {
    await handle();
  }

  handle() async {
    final usecase = ref.watch(userGetDetailUseCaseProvider);
    final input = ref.watch(diaryGetListInputProvider.notifier).state;
    state = AsyncValue.data((usecase.handle(input).diaries));
  }
}

///
/// Use case input data
///
final diaryGetListInputProvider = StateProvider<DiaryGetListInput>((ref) {
  return DiaryGetListInput();
});

///
/// Use case
///
final userGetDetailUseCaseProvider = Provider<DiaryGetListUseCase>((ref) {
  return DiaryGetListInteractor();
});
