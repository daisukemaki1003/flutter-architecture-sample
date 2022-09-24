import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../presentation/provider/diary/diary_state.dart';
import '../../component/diary_list/page.dart';
import '../../component/diary_list/parts/diary_list.dart';

class DiaryListPageContainer extends ConsumerWidget {
  const DiaryListPageContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final diaryList = ref.watch(diariesNotifierProvider);
    Widget diaryListWidget = diaryList.map(
      error: (_) => const Text('On Error'),
      loading: (_) => const CircularProgressIndicator(),
      data: (data) => DiaryListComponent(data.value.diaries),
    );
    return DiaryListPageComponent(diaryListWidget);
  }
}
