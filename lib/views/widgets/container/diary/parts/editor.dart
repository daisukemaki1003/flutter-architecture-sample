import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/presentation/provider/diary/diary_state.dart';

import '../../../component/diary_editor/parts/editor.dart';

class EditorWidgetContainer extends ConsumerWidget {
  const EditorWidgetContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final diary = ref.watch(diaryStateProvider);
    onTextChange(String value) {
      if (diary != null) {
        diary.body = value;
      }
    }

    return EditorWidget(
      content: diary?.body,
      onContentChanged: onTextChange,
    );
  }
}
