import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../presenter/diarys/diary_update_presenter.dart';
import '../../../components/diary_editor/parts/editor.dart';

class EditorWidgetContainer extends ConsumerWidget {
  const EditorWidgetContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var diary = ref.watch(diaryContentProvider.notifier);

    onContentChange(String value) {
      diary.state = value;
    }

    return EditorWidget(
      content: diary.state,
      onContentChanged: onContentChange,
    );
  }
}
