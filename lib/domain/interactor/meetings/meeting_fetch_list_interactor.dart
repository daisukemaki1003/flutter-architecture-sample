import 'package:man_memo_v2/data/repositories/mettings_repository.dart';
import 'package:man_memo_v2/domain/entity/model/meeting.dart';
import 'package:man_memo_v2/domain/i_repositories/meetings_repository.dart';
import 'package:man_memo_v2/domain/usecases/meetings/fetch_list/meeting_fetch_list_output.dart';

import 'package:man_memo_v2/domain/usecases/meetings/fetch_list/meeting_fetch_list_input.dart';

import '../../../data/model/meeting.dart';
import '../../usecases/meetings/fetch_list/meeting_fetch_list_usecase.dart';

class MeetingFetchListInteractor implements MeetingFetchListUseCase {
  MeetingsRepository meetingsRepository = MeetingsRepositoryImpl();

  @override
  MeetingFetchListOutput handle(MeetingFetchListInput input) {
    List<MeetingData> meetingDataList = meetingsRepository.fetchMeetingList();

    List<MeetingEntity> meetingEntityList =
        meetingDataList.map((meetingData) => translate(meetingData)).toList();
    return MeetingFetchListOutput(meetingEntityList);
  }

  /// Transformer
  MeetingEntity translate(MeetingData meetingData) {
    return MeetingEntity(
        eventName: meetingData.eventName,
        from: meetingData.from,
        to: meetingData.to,
        background: meetingData.background,
        isAllDay: meetingData.isAllDay);
  }
}
