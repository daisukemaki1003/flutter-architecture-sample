import '../../domain/i_repositories/meetings_repository.dart';
import '../datasources/meeting_datasource.dart';
import '../model/meeting.dart';

class MeetingsRepositoryImpl implements MeetingsRepository {
  MeetingsDataSource meetingDataSource = MeetingsDataSource();

  @override
  List<MeetingData> fetchMeetingList() {
    return meetingDataSource.fetchMeetingList();
  }
}
