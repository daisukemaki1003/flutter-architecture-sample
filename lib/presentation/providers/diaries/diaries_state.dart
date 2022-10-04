import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/presentation/presenters/diaries_presenter.dart';

import 'diary_model.dart';

/// 作成日
final diaryCreatedAtProvider = StateProvider<DateTime>((ref) => DateTime.now());

/// 一緒に遊んだ友人
final diaryUserIdsProvider = StateProvider<List<int>>((ref) => [1, 2]);

/// タイトル
final diaryTitleProvider = StateProvider<String>((ref) => "");

/// ボディ
final diaryBodyProvider = StateProvider<String>((ref) => "body");

/// 新規日記
final diaryProvider = StateProvider<DiaryModel>((ref) {
  final createdAt = ref.watch(diaryCreatedAtProvider);
  final userIds = ref.watch(diaryUserIdsProvider);
  final title = ref.watch(diaryTitleProvider);
  final body = ref.watch(diaryBodyProvider);

  return DiaryModel(
    createdAt: createdAt,
    userIds: userIds,
    title: title,
    body: body,
  );
});

///
/// Provider
final diariesNotifierProvider =
    StateNotifierProvider<DiariesNotifier, AsyncValue<List<DiaryModel>>>((ref) {
  return DiariesNotifier(ref, ref.watch(diariesPresenterProvider))
    ..initialize();
});

///
/// State
class DiariesNotifier extends StateNotifier<AsyncValue<List<DiaryModel>>> {
  DiariesNotifier(this.ref, this.presenter)
      : super(const AsyncValue<List<DiaryModel>>.loading());

  final Ref ref;
  final DiariesPresenter presenter;

  Future<void> initialize() async {
    await fetchAll();
    // state = AsyncValue.data(UsersViewModel(users));
  }

  create() async {
    final diary = ref.watch(diaryProvider);
    await presenter.create(diary);
  }

  update() async {
    final diary = ref.watch(diaryProvider);
    await presenter.update(diary);
  }

  fetchAll() async {
    state = AsyncValue.data(await presenter.fetchAll());
  }
}
