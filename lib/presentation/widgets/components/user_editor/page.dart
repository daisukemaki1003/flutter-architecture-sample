import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entity/enum/holiday.dart';
import '../../../../domain/entity/enum/occupation.dart';
import '../../../../domain/entity/enum/prefectures.dart';
import '../../../../domain/entity/model/holiday.dart';
import '../../containers/user_editor/parts/holiday_picker.dart';
import 'parts/edit_select_tile.dart';
import 'parts/edit_string_page.dart';
import 'parts/edit_string_tile.dart';
import 'parts/holiday_picker.dart';

class UserEditorPageComponent extends StatelessWidget {
  const UserEditorPageComponent({
    super.key,
    required this.name,
    required this.age,
    required this.birthday,
    required this.birthplace,
    required this.residence,
    required this.occupation,
    required this.memo,
  });

  final TextEditingController name;
  final int age;
  final String birthday;
  final PrefecturesEnum birthplace;
  final PrefecturesEnum residence;
  final OccupatioEenum occupation;
  final TextEditingController memo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text(
          "プロフィール編集",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: Navigator.of(context).pop,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 30, right: 0),
        child: ListView(
          children: [
            _nameEditor(),
            _agePicker(),
            _birthdayPicker(),
            _selectRegionPicker(
                "出身地", birthplace.nameValue!, (prefectures) => null),
            _selectRegionPicker(
                "居住地", residence.nameValue!, (prefectures) => null),
            const HolidayPickerContainer(),
          ],
        ),
      ),
    );
  }

  Widget _nameEditor() {
    return EditStringTile(
      item: "名前",
      itemValue: name.text,
      fontSize: 15,
      editPege: EditStringPege(name),
    );
  }

  Widget _agePicker() {
    return EditSelectTile(
      item: "年齢",
      itemValue: "$age歳",
      fontSize: 15,
      editSheet: CupertinoPicker(
        itemExtent: 30,
        onSelectedItemChanged: ((value) {
          print(value);
        }),
        children: [
          for (var i = 1; i <= 99; i++) Text("$i歳", style: const TextStyle()),
        ],
      ),
    );
  }

  Widget _birthdayPicker() {
    return EditSelectTile(
      item: "誕生日",
      itemValue: "birthday",
      fontSize: 15,
      editSheet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: _datePickerItems(13, '月', true)),
          Expanded(child: _datePickerItems(32, '日', false)),
        ],
      ),
    );
  }

  Widget _datePickerItems(int itemNum, String text, bool dateType) {
    return CupertinoPicker(
      itemExtent: 40,
      onSelectedItemChanged: ((value) {}),
      children: [
        for (int i = 1; i < itemNum; i++)
          Text(i.toString() + text, style: const TextStyle(fontSize: 20))
      ],
    );
  }

  ///
  /// 地域選択
  _selectRegionPicker(
    String title,
    String value,
    Function(PrefecturesEnum prefectures) onChanged,
  ) {
    return EditSelectTile(
      item: title,
      itemValue: value,
      fontSize: 15,
      editSheet: ListView(
        children: PrefecturesEnum.values.map(
          (e) {
            return ListTile(
              title: Text(e.nameValue!),
              leading: Radio(
                value: e,
                groupValue: residence,
                onChanged: (PrefecturesEnum? value) {},
                activeColor: Colors.indigo,
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
