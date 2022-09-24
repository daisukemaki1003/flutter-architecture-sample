import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../presentation/provider/diary/diary_state.dart';
import '../../../component/diary_editor/parts/preview.dart';

class PreviewWidgetContainer extends StatelessWidget {
  const PreviewWidgetContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final diary = ref.watch(diaryStateProvider);
      return PreviewWidget(diary!.body);
    });
  }
}
