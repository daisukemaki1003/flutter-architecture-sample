import 'package:flutter/material.dart';
import 'package:man_memo_v2/infrastructure/models/meeting.dart';

class MeetingsDataSource {
  List<MeetingData> fetchMeetingList() {
    final DateTime today = DateTime.now();

    List<MeetingData> data = [
      MeetingData(
        eventName: "event1",
        from: DateTime(today.year, today.month, today.day, 9),
        to: DateTime(today.year, today.month, today.day, 9)
            .add(const Duration(hours: 2)),
        background: Colors.green.value,
        isAllDay: false,
      ),
      MeetingData(
        eventName: "event2",
        from: DateTime(today.year, today.month, today.day + 2, 9),
        to: DateTime(today.year, today.month, today.day + 2, 9)
            .add(const Duration(hours: 2)),
        background: Colors.blue.value,
        isAllDay: false,
      ),
      MeetingData(
        eventName: "event3",
        from: DateTime(today.year, today.month, today.day - 2, 9),
        to: DateTime(today.year, today.month, today.day - 2, 9)
            .add(const Duration(hours: 2)),
        background: Colors.red.value,
        isAllDay: false,
      )
    ];
    return data;
  }
}
