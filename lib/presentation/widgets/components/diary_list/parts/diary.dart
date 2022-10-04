// ignore_for_file: depend_on_referenced_packages

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../../../../providers/diaries/diary_model.dart';
import 'user_icon_list.dart';

class DiaryComponent extends StatelessWidget {
  const DiaryComponent(
      {super.key, required this.diary, required this.onTapFunc});

  final DiaryModel diary;
  final Function() onTapFunc;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 140,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            offset: Offset(0.0, 4.0),
          ),
        ],
      ),
      child: InkWell(
        /// 遷移
        onTap: onTapFunc,
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                // diary.content,
                diary.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                DateFormat('yyyy年M月d日 H:m').format(diary.createdAt),
              ),
              const SizedBox(height: 10),
              UserIconListWidget(users: diary.userIds, height: 53),
            ],
          ),
        ),
      ),
    );
  }
}
