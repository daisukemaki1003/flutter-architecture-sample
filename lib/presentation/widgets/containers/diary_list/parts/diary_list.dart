import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/domain/entity/model/diary.dart';
import 'package:man_memo_v2/domain/entity/model/user.dart';

import '../../../../presenters/diarys/diary_get_list_presenter.dart';
import '../../../components/diary_list/parts/diary_list.dart';

class DiaryListContainer extends ConsumerWidget {
  const DiaryListContainer({super.key, this.user});

  final UserEntity? user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final diaries = ref.watch(diaryGetListPresenterNotifierProvider);

    return diaries.map(
      error: (_) => const Text('On Error'),
      loading: (_) => const Center(child: CircularProgressIndicator()),
      data: (data) {
        if (user == null) {
          return DiaryListComponent(data.value);
        }

        final List<DiaryEntity> diaries = [];
        for (var lDiary in data.value) {
          for (var lUser in lDiary.users) {
            if (user!.id == lUser.id) {
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
