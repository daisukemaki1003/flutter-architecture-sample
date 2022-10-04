import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../domain/entity/model/user.dart';
import '../../../../providers/diaries/diary_model.dart';
import '../../../../providers/diaries/diaries_state.dart';
import '../../../components/diary_list/parts/diary_list.dart';

class DiaryListContainer extends ConsumerWidget {
  const DiaryListContainer({super.key, this.user});

  final UserEntity? user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final diariesNotifier = ref.watch(diariesNotifierProvider);

    return diariesNotifier.map(
      error: (_) => const Text('On Error'),
      loading: (_) => const Center(child: CircularProgressIndicator()),
      data: (data) {
        if (user == null) {
          return DiaryListComponent(data.value);
        }

        final List<DiaryModel> diaries = [];
        for (var diary in data.value) {
          for (var id in diary.userIds) {
            if (user!.id == id) {
              diaries.add(diary);
              break;
            }
          }
        }

        return DiaryListComponent(diaries);
      },
    );
  }
}
