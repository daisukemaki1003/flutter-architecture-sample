import 'package:flutter/material.dart';

class UserEditorPageComponent extends StatelessWidget {
  const UserEditorPageComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey, //色
                spreadRadius: 4,
                blurRadius: 4,
                offset: Offset(1, 1),
              ),
            ],
          ),
          padding: const EdgeInsets.only(top: 50.0),
          child: AppBar(
            title: const Text(
              "ユーザー編集",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            elevation: 0,
            actions: [
              TextButton(
                child: const Text(
                  "保存",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.blue),
                ),
                onPressed: () async {},
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(height: 40),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: TextField(
              cursorColor: Colors.black12,
              decoration: InputDecoration(
                labelText: '名前',
                labelStyle: TextStyle(color: Colors.black),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding:
                    EdgeInsets.only(left: 20, top: -10, bottom: 3, right: 10),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: TextField(
              keyboardType: TextInputType.number,
              cursorColor: Colors.black12,
              decoration: InputDecoration(
                labelText: '年齢',
                labelStyle: TextStyle(color: Colors.black),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding:
                    EdgeInsets.only(left: 20, top: -10, bottom: 3, right: 10),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: TextField(
                readOnly: true,
                cursorColor: Colors.black12,
                decoration: const InputDecoration(
                  labelText: '生年月日',
                  labelStyle: TextStyle(color: Colors.black),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding:
                      EdgeInsets.only(left: 20, top: -10, bottom: 3, right: 20),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                ),
                onTap: () async {}),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: TextField(
              cursorColor: Colors.black12,
              decoration: InputDecoration(
                labelText: '出身地',
                labelStyle: TextStyle(color: Colors.black),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding:
                    EdgeInsets.only(left: 20, top: -10, bottom: 3, right: 10),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: TextField(
              cursorColor: Colors.black12,
              decoration: InputDecoration(
                labelText: '居住地',
                labelStyle: TextStyle(color: Colors.black),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding:
                    EdgeInsets.only(left: 20, top: -10, bottom: 3, right: 10),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
              ),
            ),
          ),
          // const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: TextField(
              cursorColor: Colors.black12,
              decoration: InputDecoration(
                labelText: '職種',
                labelStyle: TextStyle(color: Colors.black),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding:
                    EdgeInsets.only(left: 20, top: -10, bottom: 3, right: 10),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: TextField(
              readOnly: true,
              cursorColor: Colors.black12,
              decoration: const InputDecoration(
                labelText: '休日',
                labelStyle: TextStyle(color: Colors.black),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding:
                    EdgeInsets.only(left: 20, top: -10, bottom: 3, right: 10),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
              ),
              onTap: () async {},
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                labelText: 'メモ',
                labelStyle: TextStyle(color: Colors.black),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding:
                    EdgeInsets.only(left: 20, top: -10, bottom: 3, right: 10),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
              ),
            ),
          ),

          const SizedBox(height: 100),
        ]),
      ),
    );
  }
}




//   Widget _saveDateButton(BuildContext context, String text, bool saveOr) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: TextButton(
//         onPressed: () => Navigator.of(context).pop(saveOr),
//         child: Text(text,
//             style: const TextStyle(
//                 color: Colors.lightBlue, fontWeight: FontWeight.bold)),
//       ),
//     );
//   }

//   Widget _datePickerItems(int itemNum, String text, bool dateType) {
//     return CupertinoPicker(
//       itemExtent: 40,
//       children: [
//         for (int i = 1; i < itemNum; i++)
//           Text(i.toString() + text, style: const TextStyle(fontSize: 20))
//       ],
//       onSelectedItemChanged: ((value) {
//         if (dateType) {
//           month = value + 1;
//         } else {
//           day = value + 1;
//         }
//       }),
//     );
//   }

//   Future<bool?> _datePicker(BuildContext context) async {
//     return await showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return Container(
//           height: MediaQuery.of(context).size.height / 3,
//           child: GestureDetector(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: 50,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         _saveDateButton(context, 'キャンセル', false),
//                         _saveDateButton(context, '保存', true),
//                       ],
//                     ),
//                   ),
//                   const Divider(height: 1, thickness: 1, color: Colors.black26),
//                   Expanded(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(child: _datePickerItems(13, '月', true)),
//                         Expanded(child: _datePickerItems(32, '日', false)),
//                       ],
//                     ),
//                   ),
//                 ],
//               )),
//         );
//       },
//     );
//   }

//   Future<bool?> _holidaySelectionCheckbox(BuildContext context) async {
//     return await showModalBottomSheet(
//       isScrollControlled: true,
//       context: context,
//       builder: (BuildContext context) {
//         return SizedBox(
//           height: 500,
//           child: StatefulBuilder(
//             builder: (BuildContext context, StateSetter state) {
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: 50,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         _saveDateButton(context, 'キャンセル', false),
//                         _saveDateButton(context, '保存', true),
//                       ],
//                     ),
//                   ),
//                   const Divider(height: 1, thickness: 1, color: Colors.black26),
//                   Column(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: holidayList.map<Widget>(
//                       (data) {
//                         print(data);
//                         return SizedBox(
//                           height: 60,
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: <Widget>[
//                               CheckboxListTile(
//                                 value: data.checked,
//                                 title: Text(data.getDisplayText() + '曜日'),
//                                 controlAffinity:
//                                     ListTileControlAffinity.leading,
//                                 onChanged: (bool? val) {
//                                   state(() => data.checked = !data.checked);
//                                 },
//                                 activeColor: Colors.lightBlue,
//                                 checkColor: Colors.white,
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     ).toList(),
//                   ),
//                 ],
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }
