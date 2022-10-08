import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/diaries/diary_model.dart';
import '../../components/diary/page.dart';

class DiaryPageContainer extends ConsumerWidget {
  const DiaryPageContainer(this.diary, {super.key});

  final DiaryModel diary;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (context, ref, _) {
      return DiaryPageComponent(diary: diary);
    });
  }
}
