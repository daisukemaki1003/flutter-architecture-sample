import 'package:flutter/material.dart';
import 'package:man_memo_v2/domain/entity/model/holiday.dart';

import '../../../../../domain/entity/enum/holiday.dart';
import 'edit_select_tile.dart';

// class HolidayPickerComponent extends StatefulWidget {
//   const HolidayPickerComponent({
//     super.key,
//     required this.mon,
//     required this.tue,
//     required this.wed,
//     required this.thu,
//     required this.fri,
//     required this.sat,
//     required this.sun,
//     required this.onChangeMon,
//     required this.onChangeTue,
//     required this.onChangeWed,
//     required this.onChangeThu,
//     required this.onChangeFri,
//     required this.onChangeSat,
//     required this.onChangeSun,
//   });

//   final bool mon;
//   final bool tue;
//   final bool wed;
//   final bool thu;
//   final bool fri;
//   final bool sat;
//   final bool sun;

//   final Function onChangeMon;
//   final Function onChangeTue;
//   final Function onChangeWed;
//   final Function onChangeThu;
//   final Function onChangeFri;
//   final Function onChangeSat;
//   final Function onChangeSun;

//   @override
//   State<StatefulWidget> createState() => HolidayPickerComponentState();
// }

class HolidayPickerComponent extends StatelessWidget {
  const HolidayPickerComponent({
    super.key,
    required this.holiday,
    required this.onChange,
  });

  final Holiday holiday;
  final Function(HolidayEnum holiday, bool value) onChange;

  @override
  Widget build(BuildContext context) {
    return EditSelectTile(
      item: "休日",
      itemValue: "s",
      fontSize: 15,
      editSheet: ListView(
        children: [
          _holidayPickerTile(
            check: holiday.mon,
            title: "Monday",
            holidayEnum: HolidayEnum.mon,
          ),
          _holidayPickerTile(
            check: holiday.tue,
            title: "Tuesday",
            holidayEnum: HolidayEnum.tue,
          ),
          // _holidayPickerTile(holiday.wed, "Wednesday", ((v) {})),
          // _holidayPickerTile(holiday.thu, "Thursday", ((v) {})),
          // _holidayPickerTile(holiday.fri, "Friday", ((v) {})),
          // _holidayPickerTile(holiday.sat, "Saturday", ((v) {})),
          // _holidayPickerTile(holiday.sun, "Sunday", ((v) {})),
        ],
      ),
    );
  }

  _holidayPickerTile({
    required bool check,
    required String title,
    required HolidayEnum holidayEnum,
  }) {
    return SizedBox(
      height: 60,
      child: CheckboxListTile(
        value: check,
        title: Text(title),
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: Colors.lightBlue,
        checkColor: Colors.white,
        onChanged: ((value) {
          if (value != null) {
            onChange(holidayEnum, value);
          } else {
            print("object");
          }
        }),
      ),
    );
  }
}
