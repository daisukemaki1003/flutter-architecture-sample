import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/domain/entity/model/diary.dart';

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

  handle() async {
    final content = ref.watch(diaryContentProvider.notifier).state;
    final data = state;
    if (data == null) return;
    data.setContent(content);
    state = data;
  }
}

///
/// 編集した日記
///
final diaryContentProvider = StateProvider<String>(((ref) {
  final diary = ref.watch(selectedDiaryProvider);
  if (diary == null) return "";
  return "${diary.title}\n${diary.body}";
}));

///
/// 選択された日記
///
final selectedDiaryProvider = StateProvider<DiaryEntity?>(((_) {
  return null;
}));
