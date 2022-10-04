import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../providers/diaries/diary_model.dart';
import '../../../containers/diary_list/parts/diary.dart';

class DiaryListComponent extends ConsumerWidget {
  const DiaryListComponent(this.diaries, {super.key});

  final List<DiaryModel> diaries;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimationLimiter(
      child: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: diaries.length,
        itemBuilder: (BuildContext context, int index) {
          final diary = diaries[index];
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 44.0,
              child: FadeInAnimation(
                child: DiaryContainer(diary),
              ),
            ),
          );
        },
      ),
    );
  }
}
