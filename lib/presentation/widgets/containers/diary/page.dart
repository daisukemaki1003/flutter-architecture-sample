import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../presenter/diarys/diary_update_presenter.dart';
import '../../components/diary/page.dart';

class DiaryPageContainer extends ConsumerWidget {
  const DiaryPageContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (context, ref, _) {
      final diary = ref.watch(selectedDiaryProvider.notifier).state;
      return DiaryPageComponent(diary: diary!);
    });
  }
}
