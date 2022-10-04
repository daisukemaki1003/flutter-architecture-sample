// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class EditorWidget extends StatelessWidget {
  const EditorWidget({
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
                Text(outputFormat.format(DateTime.now())),
                const Text("3人"),
              ],
            ),
          ),
          const Divider(
            height: 1,
            color: Colors.black,
          ),
          // const Padding(
          //   padding: EdgeInsets.only(
          //     left: 30,
          //     right: 30,
          //     top: 10,
          //     bottom: 10,
          //   ),
          //   child: UserIconListWidget(users: [1, 2], height: 53),
          // ),
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
}
