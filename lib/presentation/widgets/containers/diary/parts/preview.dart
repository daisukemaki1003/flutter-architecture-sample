import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../providers/diaries/diaries.dart';
import '../../../components/diary_editor/parts/preview.dart';

class PreviewWidgetContainer extends StatelessWidget {
  const PreviewWidgetContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final diaryCreatedAt = ref.watch(diaryCreatedAtProvider.state);
      final diaryUserIds = ref.watch(diaryUserIdsProvider.state);
      final diaryTitle = ref.watch(diaryTitleProvider.state);
      final diaryBody = ref.watch(diaryBodyProvider.state);

      return PreviewWidgetComponent(
        createdAt: diaryCreatedAt.state,
        userIds: diaryUserIds.state,
        title: diaryTitle.state,
        body: diaryBody.state,
      );
    });
  }
}
