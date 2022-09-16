import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/diary_list.dart';
import 'diary_model.dart';

class DiaryPage extends ConsumerWidget {
  const DiaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final diaryViewModel = ref.watch(diaryViewModelProvider);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: const Text(
              '日記',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0.0,
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(5),
              child: Divider(
                height: 1,
                thickness: 1,
                endIndent: 0,
                color: Colors.grey,
              ),
            )),
        body: diaryViewModel.when(
          error: (err, _) => Text(err.toString()),
          loading: () => const CircularProgressIndicator(),
          data: (data) => MyDiaryList(data),
        ),
      ),
    );
  }
}
