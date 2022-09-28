import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/presentation/widgets/components/diary_editor/page.dart';

import '../../../presenter/diarys/diary_update_presenter.dart';

class DiaryEditorContainer extends ConsumerWidget {
  const DiaryEditorContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final diaryUpdatePresenter =
        ref.watch(diaryUpdatePresenterNotifierProvider.notifier);

    return Consumer(builder: (context, ref, _) {
      return DiaryEditorComponent(
        save: diaryUpdatePresenter.handle,
      );
    });
  }
}
