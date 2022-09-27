import 'package:flutter/material.dart';
import 'package:man_memo_v2/views/models/user.dart';

class UserIconListWidget extends StatelessWidget {
  const UserIconListWidget(this.users, {super.key});

  final List<UserModel> users;

  @override
  Widget build(BuildContext context) {
    const userIcon =
        "https://gws-ug.jp/wp-content/plugins/all-in-one-seo-pack/images/default-user-image.png";

    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];

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
    );
  }
}
