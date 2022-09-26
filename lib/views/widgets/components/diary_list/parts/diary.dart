// ignore_for_file: depend_on_referenced_packages

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../../../../models/diary.dart';

class DiaryComponent extends StatelessWidget {
  const DiaryComponent(
      {super.key, required this.diary, required this.onTapFunc});

  final Diary diary;
  final Function() onTapFunc;

  @override
  Widget build(BuildContext context) {
    const userIcon =
        "https://gws-ug.jp/wp-content/plugins/all-in-one-seo-pack/images/default-user-image.png";

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
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                diary.content,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                DateFormat('yyyy年M月d日 H:m').format(diary.createdAt),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: diary.users.length,
                  itemBuilder: (context, index) {
                    final user = diary.users[index];

                    return const Padding(
                      padding: EdgeInsets.only(right: 10, top: 10),
                      child: CircleAvatar(
                        radius: 23,
                        backgroundImage: NetworkImage(userIcon),
                        child: Align(
                          alignment: Alignment.bottomRight,
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
