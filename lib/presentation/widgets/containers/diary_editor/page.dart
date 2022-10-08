import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:man_memo_v2/presentation/widgets/components/diary_editor/page.dart';

import '../../../providers/diaries/diaries.dart';

class DiaryEditorContainer extends ConsumerWidget {
  const DiaryEditorContainer({super.key, required this.newDiary});

  /// true: 新規作成
  /// false: 編集
  final bool newDiary;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (context, ref, _) {
      final diariesNotifier = ref.watch(diariesNotifierProvider.notifier);

      return DiaryEditorComponent(
        title: newDiary ? "新規作成" : "編集",
        save: newDiary ? diariesNotifier.create : diariesNotifier.update,
      );
    });
  }
}
