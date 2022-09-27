import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../provider/diary/diary_state.dart';
import '../../components/diary/page.dart';

class DiaryPageContainer extends ConsumerWidget {
  const DiaryPageContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (context, ref, _) {
      final diaries = ref.watch(diariesNotifierProvider);
      return diaries.map(
        error: (_) => const Text('On Error'),
        loading: (_) => const Center(child: CircularProgressIndicator()),
        data: (data) {
          return DiaryPageComponent(diary: data.value.diary!);
        },
      );
    });
  }
}
