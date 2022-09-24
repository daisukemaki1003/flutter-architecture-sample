import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:man_memo_v2/views/widgets/container/user_detail/page.dart';

import '../../../../models/user.dart';
import '../page.dart';

class UserWidgetComponent extends StatelessWidget {
  const UserWidgetComponent({
    super.key,
    required this.user,
    required this.open,
  });

  final UserModel user;
  final Function(UserModel) open;

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
            onPressed: (BuildContext context) {},
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
            open(user);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (builder) => const UserDetailPageContainer(),
              ),
            );
          },
        ),
      ),
    );
  }
}
