import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/domain/entity/model/diary.dart';

import '../../../../presenter/diarys/diary_update_presenter.dart';
import '../../../components/diary_list/parts/diary.dart';
import '../../diary/page.dart';

class DiaryContainer extends ConsumerWidget {
  const DiaryContainer(this.diary, {super.key});

  final DiaryEntity diary;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDiary = ref.watch(selectedDiaryProvider.notifier);

    tap() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            selectedDiary.state = diary;
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
