// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class EditorWidgetComponent extends StatelessWidget {
  const EditorWidgetComponent({
    super.key,
    required this.createdAt,
    required this.userIds,
    required this.title,
    required this.body,
    required this.oncreatedAtChanged,
    required this.onuserIdsChanged,
    required this.ontitleChanged,
    required this.onbodyChanged,
  });

  final DateTime createdAt;
  final List<int> userIds;
  final String title;
  final String body;

  final Function(DateTime createdAt) oncreatedAtChanged;
  final Function(List<int> userIds) onuserIdsChanged;
  final Function(String title) ontitleChanged;
  final Function(String body) onbodyChanged;

  @override
  Widget build(BuildContext context) {
    const externalPaddingInset =
        EdgeInsets.symmetric(horizontal: 30, vertical: 15);

    DateFormat outputFormat = DateFormat('yyyy年MM月dd日');

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
              top: 30,
              bottom: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// 日付選択
                TextButton(
                  child: Text(
                    outputFormat.format(createdAt),
                  ),
                  onPressed: () async {
                    final date = await _datePicker(context);
                    if (date != null) oncreatedAtChanged(date);
                  },
                ),

                /// 遊んだ友人
                TextButton(
                  child: Text("${userIds.length}人"),
                  onPressed: () {
                    print("object");
                  },
                ),
              ],
            ),
          ),
          const Divider(
            height: 1,
            color: Colors.black,
          ),
          Padding(
            padding: externalPaddingInset,
            child: Column(
              children: [
                TextFormField(
                  style: const TextStyle(fontSize: 18),
                  decoration: const InputDecoration(
                    hintText: 'タイトル',
                    isDense: true,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) return "error";
                    return null;
                  },
                  initialValue: title,
                  onChanged: ontitleChanged,
                ),
                const SizedBox(height: 15),
                TextFormField(
                  maxLines: null,
                  decoration: const InputDecoration(
                    hintText: 'マークダウンで日記を書こう',
                    isDense: true,
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  ),
                  initialValue: body,
                  onChanged: onbodyChanged,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<DateTime?> _datePicker(BuildContext context) async {
    final DateTime? datePicked = await showDatePicker(
        context: context,
        initialDate: createdAt,
        firstDate: DateTime(2000),
        lastDate: DateTime(DateTime.now().year + 1));

    return datePicked;
  }
}
