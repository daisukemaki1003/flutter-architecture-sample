import '../../infrastructure/models/meeting.dart';

abstract class MeetingsRepository {
  List<MeetingData> fetchMeetingList();
}
