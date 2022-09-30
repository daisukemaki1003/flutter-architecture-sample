import 'package:flutter/material.dart';
import 'package:man_memo_v2/domain/entity/model/user_detail.dart';

class ProfileWidgetComponent extends StatelessWidget {
  const ProfileWidgetComponent(this.user, {super.key});

  final UserDetailEntity user;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _profileWidget(
            "基本情報",
            {
              "名前": user.userBase.name,
              "年齢": user.age.toString(),
              "誕生日": user.birthday,
              "出身地": user.birthplace,
              "居住地": user.residence,
            },
          ),
          _profileWidget(
            "仕事",
            {
              "職種": user.occupation,
              "休日": user.holiday.toString(),
            },
          ),
          _profileWidget(
            "メモ",
            {
              "メモ": user.memo,
            },
          ),
        ],
      ),
    );
  }

  Widget _profileWidget(String title, Map<String, String> users) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: users.entries
                  .map((e) => _profileWidgetItem(e.key, e.value))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }

  Widget _profileWidgetItem(String key, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              key,
              style: const TextStyle(
                fontSize: 15.0,
                color: Colors.black54,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              softWrap: true,
              style: const TextStyle(
                fontSize: 15.0,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
