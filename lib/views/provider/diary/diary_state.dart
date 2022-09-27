import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/diary.dart';
import '../../../presenter/diarys/diary_get_list_presenter.dart';

final diaryStateProvider = StateProvider.autoDispose<String>((ref) {
  // return ref.watch(diariesNotifierProvider).value?.diary;
  final diary = ref.watch(diariesNotifierProvider).value?.diary;
  return diary!.title + diary.body;
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

  // save(Diary diary) async {
  //   final data = state.value;
  //   if (data == null) return;
  //   data.diary = diary;
  //   state = AsyncValue.data(data);
  // }
  save(String content) async {
    final data = state.value;
    if (data == null) return;
    data.diary!.setContent(content);
    state = AsyncValue.data(data);
  }
}
