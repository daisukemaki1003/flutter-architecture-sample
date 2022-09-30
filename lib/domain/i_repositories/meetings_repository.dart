import '../../infrastructure/model/meeting.dart';

abstract class MeetingsRepository {
  List<MeetingData> fetchMeetingList();
}
