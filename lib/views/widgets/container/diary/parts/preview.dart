import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../provider/diary/diary_state.dart';
import '../../../components/diary_editor/parts/preview.dart';

class PreviewWidgetContainer extends StatelessWidget {
  const PreviewWidgetContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final diary = ref.watch(diaryStateProvider);
      print(diary);
      return PreviewWidget(diary);
    });
  }
}
