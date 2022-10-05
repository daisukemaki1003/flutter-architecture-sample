import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/presentation/widgets/components/diary_editor/parts/editor.dart';

import '../../../../providers/diaries/diaries.dart';

class EditorWidgetContainer extends ConsumerWidget {
  const EditorWidgetContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, ref, _) {
        final diaryCreatedAt = ref.watch(diaryCreatedAtProvider.state);
        final diaryUserIds = ref.watch(diaryUserIdsProvider.state);
        final diaryTitle = ref.watch(diaryTitleProvider.state);
        final diaryBody = ref.watch(diaryBodyProvider.state);

        oncreatedAtChanged(DateTime createdAt) =>
            diaryCreatedAt.state = createdAt;
        onuserIdsChanged(List<int> userIds) => diaryUserIds.state = userIds;
        ontitleChanged(String title) => diaryTitle.state = title;
        onbodyChanged(String body) => diaryBody.state = body;

        return EditorWidgetComponent(
          createdAt: diaryCreatedAt.state,
          userIds: diaryUserIds.state,
          title: diaryTitle.state,
          body: diaryBody.state,
          oncreatedAtChanged: oncreatedAtChanged,
          onuserIdsChanged: onuserIdsChanged,
          ontitleChanged: ontitleChanged,
          onbodyChanged: onbodyChanged,
        );
      },
    );
  }
}
