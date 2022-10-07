import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entity/enum/holiday.dart';
import '../../../domain/entity/model/holiday.dart';

/// 休日
final userHolidayProvider =
    StateNotifierProvider<HolidayNotifier, Holiday>((ref) {
  return HolidayNotifier();
});

class HolidayNotifier extends StateNotifier<Holiday> {
  HolidayNotifier() : super(Holiday());

  // setHoliday(Holiday holiday) => state = holiday;

  void changeValue(HolidayEnum holiday, bool value) {
    switch (holiday) {
      case HolidayEnum.mon:
        state.mon = value;
        break;
      case HolidayEnum.tue:
        state.tue = value;
        break;
      case HolidayEnum.wed:
        state.wed = value;
        break;
      case HolidayEnum.thu:
        state.thu = value;
        break;
      case HolidayEnum.fri:
        state.fri = value;
        break;
      case HolidayEnum.sat:
        state.sat = value;
        break;
      case HolidayEnum.sun:
        state.sun = value;
        break;
      default:
    }
  }
}
