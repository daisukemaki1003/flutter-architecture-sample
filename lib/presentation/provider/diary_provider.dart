import 'package:man_memo_v2/presentation/presenter/diary/diary_fetch_list_presenter.dart';

import '../../domain/usecases/diary/diary_fetch_list_output.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final diaryListStreamProvider =
    StreamProvider.autoDispose<DiaryFetchListOutput>((_) {
  return DiaryFetchListPresenter().handle();
});
