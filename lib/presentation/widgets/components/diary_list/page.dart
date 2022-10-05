// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../../containers/diary_list/parts/diary_list.dart';

class DiaryListPageComponent extends StatelessWidget {
  const DiaryListPageComponent({super.key, required this.newDiary});

  final Function() newDiary;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('日記',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(5),
          child: Divider(
            height: 1,
            thickness: 1,
            indent: 10,
            endIndent: 10,
            color: Colors.grey,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.create,
              color: Colors.black,
            ),

            /// 日記作成
            onPressed: newDiary,
          )
        ],
      ),
      body: const SafeArea(
        child: DiaryListContainer(),
      ),
    );
  }
}
