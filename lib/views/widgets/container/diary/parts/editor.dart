import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../provider/diary/diary_state.dart';
import '../../../components/diary_editor/parts/editor.dart';

class EditorWidgetContainer extends ConsumerWidget {
  const EditorWidgetContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var diary = ref.watch(diaryStateProvider.state);
    print(diary);

    onContentChange(String value) {
      diary.state = value;
    }

    return EditorWidget(
      content: diary.state,
      onContentChanged: onContentChange,
    );
  }
}
