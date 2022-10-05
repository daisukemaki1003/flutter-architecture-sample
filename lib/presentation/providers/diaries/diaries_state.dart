import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/presentation/presenters/diaries_presenter.dart';

import 'diary_model.dart';

/// 作成日
final diaryCreatedAtProvider = StateProvider<DateTime>((_) => DateTime.now());

/// 一緒に遊んだ友人
final diaryUserIdsProvider = StateProvider<List<int>>((_) => []);

/// タイトル
final diaryTitleProvider = StateProvider<String>((_) => "");

/// ボディ
final diaryBodyProvider = StateProvider<String>((_) => "");

/// 新規日記
final diaryProvider = StateProvider<DiaryModel>((ref) {
  final createdAt = ref.watch(diaryCreatedAtProvider.state);
  final userIds = ref.watch(diaryUserIdsProvider.state);
  final title = ref.watch(diaryTitleProvider.state);
  final body = ref.watch(diaryBodyProvider.state);

  return DiaryModel(
    createdAt: createdAt.state,
    userIds: userIds.state,
    title: title.state,
    body: body.state,
  );
});

setrParams(WidgetRef ref, DiaryModel diary) {
  ref.watch(diaryCreatedAtProvider.state).state = diary.createdAt;
  ref.watch(diaryUserIdsProvider.state).state = diary.userIds;
  ref.watch(diaryTitleProvider.state).state = diary.title;
  ref.watch(diaryBodyProvider.state).state = diary.body;
}

clearParams(WidgetRef ref) {
  ref.watch(diaryCreatedAtProvider.state).state = DateTime.now();
  ref.watch(diaryUserIdsProvider.state).state = [];
  ref.watch(diaryTitleProvider.state).state = "";
  ref.watch(diaryBodyProvider.state).state = "";
}

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
  }

  create() async {
    final diary = ref.watch(diaryProvider);
    await presenter.create(diary);
    ref.refresh(diariesNotifierProvider);
  }

  update() async {
    final diary = ref.watch(diaryProvider);
    await presenter.update(diary);
    ref.refresh(diariesNotifierProvider);
  }

  fetchAll() async {
    state = AsyncValue.data(await presenter.fetchAll());
  }
}
