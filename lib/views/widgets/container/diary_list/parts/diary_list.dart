import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/views/models/user.dart';

import '../../../../provider/diary/diary_state.dart';
import '../../../../models/diary.dart';
import '../../../components/diary_list/parts/diary_list.dart';

class DiaryListContainer extends ConsumerWidget {
  const DiaryListContainer({super.key, this.user});

  final UserModel? user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final diaries = ref.watch(diariesNotifierProvider);
    return diaries.map(
      error: (_) => const Text('On Error'),
      loading: (_) => const Center(child: CircularProgressIndicator()),
      data: (data) {
        if (user == null) {
          return DiaryListComponent(data.value.diaries);
        }

        final List<Diary> diaries = [];
        for (var lDiary in data.value.diaries) {
          for (var lUser in lDiary.users) {
            if (user!.userId == lUser.userId) {
              diaries.add(lDiary);
              break;
            }
          }
        }

        return DiaryListComponent(diaries);
      },
    );
  }
}
