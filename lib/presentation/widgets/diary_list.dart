import 'package:flutter/material.dart';

import '../model/diary_model.dart';

class MyDiaryList extends StatelessWidget {
  const MyDiaryList(this.diaries, {super.key});

  final List<DiaryModel> diaries;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListView.builder(
          itemCount: diaries.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            DiaryModel diary = diaries[index];
            return myDiaryListItem(diary);
          },
        ),
      ],
    );
  }

  Widget myDiaryListItem(DiaryModel diary) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // 上揃えにする
            children: [
              Row(
                children: [
                  Text(diary.userNames.first),
                  const SizedBox(width: 10),
                  Text(diary.createdAt.toString()),
                ],
              ),
              const SizedBox(height: 10),
              Text(diary.body),
            ],
          ),
        ),
        const Divider(
          height: 1,
          thickness: 1,
          endIndent: 0,
          color: Colors.grey,
        ),
      ],
    );
  }
}
