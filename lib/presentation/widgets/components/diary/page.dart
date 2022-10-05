// ignore_for_file: must_be_immutable, depend_on_referenced_packages

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:man_memo_v2/presentation/widgets/containers/diary/parts/preview.dart';

import '../../../providers/diaries/diary_model.dart';
import '../../containers/diary_editor/page.dart';

class DiaryPageComponent extends StatelessWidget {
  const DiaryPageComponent({
    super.key,
    required this.diary,
  });

  final DiaryModel diary;

  @override
  Widget build(BuildContext context) {
    final defaltColor = Theme.of(context).scaffoldBackgroundColor;
    const nabColor = Colors.black;
    const nabButtonTextStyle = TextStyle(fontSize: 17, color: nabColor);

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
                    /// 編集
                    return const DiaryEditorContainer(newDiary: false);
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            PreviewWidgetContainer(false),
          ],
        ),
      ),
    );
  }
}
