import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../views/models/diary.dart';
import '../../presenter/diarys/diary_get_list_presenter.dart';

final diaryStateProvider = StateProvider.autoDispose<Diary?>((ref) {
  return ref.watch(diariesNotifierProvider).value?.diary;
});

/// プロバイダー
final diariesNotifierProvider =
    StateNotifierProvider<DiariesNotifier, AsyncValue<DiaryViewModel>>(
  (ref) => DiariesNotifier(ref)..initialize(),
);

/// State 管理
class DiariesNotifier extends StateNotifier<AsyncValue<DiaryViewModel>> {
  DiariesNotifier(this.ref) : super(const AsyncValue<DiaryViewModel>.loading());

  final Ref ref;
  final diaryGetListPresenter = DiaryGetListPresenter();

  /// 初期化
  Future<void> initialize() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    final userList = await diaryGetListPresenter.handle();
    state = AsyncValue.data(DiaryViewModel(userList));
  }

  open(Diary diary) {
    state.value?.diary = diary;
  }

  Future<void> save(Diary diary) async {
    final data = state.value;
    if (data == null) return;
    data.diary = diary;
    state = AsyncValue.data(data);
  }
}
