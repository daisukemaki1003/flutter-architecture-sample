// ignore_for_file: depend_on_referenced_packages

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../../../../providers/users/users.dart';

class ProfileBarComponent extends StatelessWidget {
  const ProfileBarComponent({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    var dateFormat = DateFormat('登録日 yyyy年M月d日');
    const networkImage = NetworkImage(
        "https://gws-ug.jp/wp-content/plugins/all-in-one-seo-pack/images/default-user-image.png");

    return FlexibleSpaceBar(
      collapseMode: CollapseMode.pin,
      background: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 90),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// 名前
                  Text(
                    user.name,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  /// 登録日
                  Text(
                    dateFormat.format(user.createdAt),
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),

            /// アイコン
            RawMaterialButton(
              onPressed: () {
                /// アイコン変更
              },
              child: CircleAvatar(
                radius: 35,
                backgroundImage: networkImage,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Stack(
                    alignment: Alignment.center,
                    children: const [
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.white,
                      ),
                      CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.blue,
                      ),
                      Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 14,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
