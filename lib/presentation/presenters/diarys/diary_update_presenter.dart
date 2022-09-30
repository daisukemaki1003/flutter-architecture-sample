import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/domain/entity/model/diary.dart';

import 'diary_get_list_presenter.dart';

///
/// Notifier provider
///
final diaryUpdatePresenterNotifierProvider =
    StateNotifierProvider<DiaryUpdatePresenterNotifier, DiaryEntity?>((ref) {
  return DiaryUpdatePresenterNotifier(ref);
});

///
/// Notifier
///
class DiaryUpdatePresenterNotifier extends StateNotifier<DiaryEntity?> {
  DiaryUpdatePresenterNotifier(this.ref) : super(null);

  final Ref ref;

  open(DiaryEntity diary) => state = diary;

  update() async {
    final content = ref.watch(diaryContentProvider);
    final data = state;
    if (data == null) return;
    data.setContent(content);
    state = data;
    ref.refresh(diaryGetListPresenterNotifierProvider);
  }
}

///
/// 編集した日記
///
final diaryContentProvider = StateProvider<String>(((ref) {
  final diary = ref.watch(diaryUpdatePresenterNotifierProvider);
  if (diary == null) return "";
  return "${diary.title}\n${diary.body}";
}));
