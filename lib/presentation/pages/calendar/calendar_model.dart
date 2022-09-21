import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/presentation/model/meeting.dart';
import 'package:man_memo_v2/presentation/provider/meetings.provider.dart';

class CalendarViewModel {
  List<MeetingModel> meetings;
  CalendarViewModel(this.meetings);
}

final calendarViewModelProvider =
    FutureProvider.autoDispose<CalendarViewModel>((ref) async {
  final futureMeetingList = ref.watch(meetingListStreamProvider.future);
  final meetingList = await futureMeetingList;

  List<MeetingModel> meetings;
  meetings = meetingList.meetings
      .map(
        (meeting) => MeetingModel(
          eventName: meeting.eventName,
          from: meeting.from,
          to: meeting.to,
          background: Color(meeting.background),
          isAllDay: meeting.isAllDay,
        ),
      )
      .toList();

  return CalendarViewModel(meetings);
});
