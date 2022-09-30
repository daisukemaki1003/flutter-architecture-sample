import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:man_memo_v2/domain/entity/model/user.dart';
import 'package:man_memo_v2/presentation/widgets/containers/user_detail/page.dart';

class UserWidgetComponent extends StatelessWidget {
  const UserWidgetComponent(this.user, {super.key});

  final UserEntity user;

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
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (builder) => UserDetailPageContainer(user),
              ),
            );
          },
        ),
      ),
    );
  }
}
