import 'package:flutter/material.dart';
import 'package:man_memo_v2/domain/entity/model/user.dart';

import '../../../containers/user_editor/page.dart';

class ProfileWidgetComponent extends StatelessWidget {
  const ProfileWidgetComponent(this.user, {super.key});

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              _profileWidget(
                "基本情報",
                {
                  "名前": user.name,
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
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 76, 141, 195),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 13)),
              child: const Text(
                'プロフィールを編集',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (builder) => const UserEditorPageContainer(),
                  ),
                );
              },
            ),
          ),
        ),
      ],
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
