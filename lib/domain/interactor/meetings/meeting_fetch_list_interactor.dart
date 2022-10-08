import 'package:man_memo_v2/infrastructure/repositories/mettings_repository.dart';
import 'package:man_memo_v2/domain/repositories/meetings_repository.dart';
import 'package:man_memo_v2/domain/usecases/meetings/fetch_list/meeting_fetch_list_output.dart';

import 'package:man_memo_v2/domain/usecases/meetings/fetch_list/meeting_fetch_list_input.dart';

import '../../usecases/meetings/fetch_list/meeting_fetch_list_usecase.dart';

class MeetingFetchListInteractor implements MeetingFetchListUseCase {
  MeetingsRepository meetingsRepository = MeetingsRepositoryImpl();

  @override
  handle(MeetingFetchListInput input) async {
    return MeetingFetchListOutput([]);
  }
}
