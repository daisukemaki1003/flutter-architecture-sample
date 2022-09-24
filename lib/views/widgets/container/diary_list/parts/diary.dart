import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/presentation/provider/diary/diary_action.dart';

import '../../../../models/diary.dart';
import '../../../component/diary_list/parts/diary.dart';
import '../../diary/page.dart';

class DiaryContainer extends ConsumerWidget {
  const DiaryContainer(this.diary, {super.key});

  final Diary diary;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final diaryActions = ref.watch(diaryActionsProvider);
    tap() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            diaryActions.open(diary);
            return const DiaryPageContainer();
          },
        ),
      );
    }

    return Consumer(
      builder: (context, ref, child) {
        return DiaryComponent(diary: diary, onTapFunc: tap);
      },
    );
  }
}
