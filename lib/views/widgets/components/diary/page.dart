// ignore_for_file: must_be_immutable, depend_on_referenced_packages

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:man_memo_v2/views/widgets/container/diary/parts/preview.dart';

import '../../../models/diary.dart';
import '../../container/diary_editor/page.dart';
import '../diary_editor/parts/markdown_body.dart';
import '../diary_list/parts/user_icon_list.dart';

class DiaryPageComponent extends StatelessWidget {
  const DiaryPageComponent({
    super.key,
    required this.diary,
  });

  final Diary diary;

  @override
  Widget build(BuildContext context) {
    final defaltColor = Theme.of(context).scaffoldBackgroundColor;
    const nabColor = Colors.black;
    const backButtonIcon = Icon(Icons.arrow_back_ios, color: nabColor);
    const nabButtonTextStyle = TextStyle(fontSize: 17, color: nabColor);
    const internalPaddingInset =
        EdgeInsets.symmetric(horizontal: 50, vertical: 30);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: defaltColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          DateFormat('yyyy年M月d日 H:m').format(diary.createdAt),
          style: nabButtonTextStyle,
        ),
        actions: [
          TextButton(
            child: const Text("編集", style: nabButtonTextStyle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const DiaryEditorContainer();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: UserIconListWidget(diary.users),
            ),
          ),
          const PreviewWidgetContainer(),
        ],
      ),
    );
  }
}
