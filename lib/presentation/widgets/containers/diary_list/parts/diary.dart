import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../providers/diaries/diaries.dart';
import '../../../components/diary_list/parts/diary.dart';
import '../../diary/page.dart';

class DiaryContainer extends ConsumerWidget {
  const DiaryContainer(this.diary, {super.key});

  final DiaryModel diary;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    tap() {
      setrParams(ref, diary);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return DiaryPageContainer(diary);
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
