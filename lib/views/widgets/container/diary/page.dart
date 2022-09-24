import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../presentation/provider/diary/diary_action.dart';
import '../../../../presentation/provider/diary/diary_state.dart';
import '../../component/diary/page.dart';

class DiaryPageContainer extends ConsumerWidget {
  const DiaryPageContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final diary = ref.watch(diaryStateProvider);
    final diaryActions = ref.watch(diaryActionsProvider);

    save() {
      if (diary != null) {
        diaryActions.save(diary);
      }
    }

    return Consumer(builder: (context, ref, _) {
      return DiaryPageComponent(
        diary: diary!,
        save: save,
      );
    });
  }
}
