import 'package:flutter/material.dart';
import 'package:man_memo_v2/domain/entity/model/user.dart';

class UserIconListWidget extends StatelessWidget {
  const UserIconListWidget({
    super.key,
    required this.users,
    required this.height,
  });

  final List<UserEntity> users;
  final double height;

  @override
  Widget build(BuildContext context) {
    const userIcon =
        "https://gws-ug.jp/wp-content/plugins/all-in-one-seo-pack/images/default-user-image.png";

    return SizedBox(
      height: height,
      width: double.infinity,
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
