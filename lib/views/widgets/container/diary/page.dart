import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../presentation/provider/diary/diary_state.dart';
import '../../components/diary/page.dart';

class DiaryPageContainer extends ConsumerWidget {
  const DiaryPageContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final diary = ref.watch(diaryStateProvider);

    return Consumer(builder: (context, ref, _) {
      return DiaryPageComponent(diary: diary!);
    });
  }
}
