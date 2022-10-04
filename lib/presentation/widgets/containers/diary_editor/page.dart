import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:man_memo_v2/presentation/widgets/components/diary_editor/page.dart';

import '../../../providers/diaries/diaries.dart';

class DiaryEditorContainer extends ConsumerWidget {
  const DiaryEditorContainer({super.key, this.diary});

  /// null: 新規作成
  /// none null: 編集
  final DiaryModel? diary;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (context, ref, _) {
      final diariesNotifier = ref.watch(diariesNotifierProvider.notifier);

      return DiaryEditorComponent(
        title: diary != null ? "編集" : "新規作成",
        save: diary != null ? diariesNotifier.update : diariesNotifier.create,
      );
    });
  }
}
