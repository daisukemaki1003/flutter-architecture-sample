import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/presentation/providers/diaries/diaries.dart';

import '../../components/diary_list/page.dart';
import '../diary_editor/page.dart';

class DiaryListPageContainer extends ConsumerWidget {
  const DiaryListPageContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    newDiary() {
      /// パラメータクリア
      clearParams(ref);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (builder) => const DiaryEditorContainer(newDiary: true),
        ),
      );
    }

    return DiaryListPageComponent(newDiary: newDiary);
  }
}
