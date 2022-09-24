// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class DiaryListPageComponent extends StatelessWidget {
  const DiaryListPageComponent(this.diaryListWidget, {super.key});

  final Widget diaryListWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('日記', style: TextStyle(color: Colors.black)),
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
      ),
      body: SafeArea(
        child: diaryListWidget,
      ),
    );
  }
}
