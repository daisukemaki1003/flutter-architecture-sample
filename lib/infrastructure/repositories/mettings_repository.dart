import '../../domain/repositories/meetings_repository.dart';
import '../datasources/meeting_datasource.dart';
import '../models/meeting.dart';

class MeetingsRepositoryImpl implements MeetingsRepository {
  MeetingsDataSource meetingDataSource = MeetingsDataSource();

  @override
  List<MeetingData> fetchMeetingList() {
    return meetingDataSource.fetchMeetingList();
  }
}
