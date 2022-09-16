import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/presentation/presenter/meetings/meeting_fetch_list_presenter.dart';

import '../../domain/usecases/meetings/fetch_list/meeting_fetch_list_output.dart';

final meetingListStreamProvider =
    StreamProvider.autoDispose<MeetingFetchListOutput>((_) {
  return MeetingFetchListPresenter().handle();
});
