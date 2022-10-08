// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../../../providers/diaries/diary_model.dart';
import '../../../containers/diary_list/parts/diary.dart';

class DiaryListComponent extends ConsumerWidget {
  const DiaryListComponent(this.diaries, {super.key});

  final List<DiaryModel> diaries;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DateFormat outputFormat = DateFormat('yyyy年MM月');

    return AnimationLimiter(
      child: GroupedListView<DiaryModel, String>(
        elements: diaries,
        groupBy: (element) => outputFormat.format(element.createdAt),
        groupSeparatorBuilder: (String value) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        indexedItemBuilder: (context, element, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 44.0,
              child: FadeInAnimation(
                child: DiaryContainer(element),
              ),
            ),
          );
        },
        itemComparator: (item1, item2) => item1.title.compareTo(item2.title),
        useStickyGroupSeparators: false,
        floatingHeader: false,
        stickyHeaderBackgroundColor: Colors.white.withOpacity(0.5),
        order: GroupedListOrder.DESC, // optional
      ),
    );
  }
}
