import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../domain/entity/enum/holiday.dart';
import '../../../../providers/users/holiday_model.dart';
import '../../../components/user_editor/parts/holiday_picker.dart';

class HolidayPickerContainer extends ConsumerWidget {
  const HolidayPickerContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, ref, _) {
        final holiday = ref.watch(userHolidayProvider);
        final holidayNotifier = ref.watch(userHolidayProvider.notifier);

        onChange(HolidayEnum holiday, bool value) {
          holidayNotifier.changeValue(holiday, value);
          ref.refresh(userHolidayProvider);
        }

        return HolidayPickerComponent(
          holiday: holiday,
          onChange: onChange,
        );
      },
    );
  }
}
