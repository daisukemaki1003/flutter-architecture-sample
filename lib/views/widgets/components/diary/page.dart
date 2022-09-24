// ignore_for_file: must_be_immutable, depend_on_referenced_packages

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../../../models/diary.dart';
import '../../container/diary_editor/page.dart';
import '../diary_editor/parts/markdown_body.dart';

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
        leadingWidth: 500,
        leading: OverflowBox(
          maxWidth: 500,
          child: ElevatedButton.icon(
            icon: backButtonIcon,
            label: const Text("日記一覧へ", style: nabButtonTextStyle),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: defaltColor,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
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
          const SizedBox(height: 5),
          Center(
            child: Text(
              DateFormat('yyyy年M月d日 H:m').format(diary.createdAt),
            ),
          ),
          Padding(
            padding: internalPaddingInset,
            child: MarkdownBodyContainer(
              markdownSource: diary.body,
              onCopyRequested: ((p0) {}),
            ),
          )
        ],
      ),
    );
  }
}
