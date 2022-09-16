import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/presentation/model/diary_model.dart';

import '../../provider/diary_provider.dart';

class DiaryViewModel {
  List<DiaryModel> diaries;
  DiaryViewModel(this.diaries);
}

final diaryViewModelProvider = FutureProvider.autoDispose((ref) async {
  final futureDiaryList = ref.watch(diaryListStreamProvider.future);
  final diaryList = await futureDiaryList;

  List<DiaryModel> diaries;
  diaries = diaryList.diaries
      .map((diary) => DiaryModel(
          createdAt: diary.createdAt, userNames: diary.names, body: diary.body))
      .toList();

  return diaries;
});
