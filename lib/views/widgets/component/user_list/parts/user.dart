import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../models/user.dart';
import '../../../../pages/user_detail.dart';

class UserWidget extends StatelessWidget {
  const UserWidget(this.user, {super.key});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    const String userImage =
        "https://gws-ug.jp/wp-content/plugins/all-in-one-seo-pack/images/default-user-image.png";

    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.25,
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            label: 'Delete',
            icon: Icons.delete,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            onPressed: (BuildContext context) {
              print("onDismissed");
            },
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: const CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(userImage),
          ),
          title: Text(user.name),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return UserDetailScreen(user);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
