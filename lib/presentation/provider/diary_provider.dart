import 'package:man_memo_v2/presentation/presenter/diarys/diary_fetch_list_presenter.dart';

import '../../domain/usecases/diaries/diary_fetch_list/diary_fetch_list_output.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final diaryListStreamProvider =
    StreamProvider.autoDispose<DiaryFetchListOutput>((_) {
  return DiaryFetchListPresenter().handle();
});
