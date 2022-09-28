import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../presenter/diarys/diary_update_presenter.dart';
import '../../../components/diary_editor/parts/preview.dart';

class PreviewWidgetContainer extends StatelessWidget {
  const PreviewWidgetContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final diary = ref.watch(diaryContentProvider.notifier).state;
      return PreviewWidget(diary);
    });
  }
}
