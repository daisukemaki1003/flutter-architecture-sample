import 'package:flutter/material.dart';
import 'package:man_memo_v2/presentation/model/user_model.dart';

class MyUserList extends StatelessWidget {
  const MyUserList(this.users, {super.key});

  final List<UserModel> users;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 100),
        ListView.builder(
          itemCount: users.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            UserModel user = users[index];
            return myUserListItem(user);
          },
        ),
      ],
    );
  }

  Widget myUserListItem(UserModel user) {
    return Dismissible(
      key: ObjectKey(user),
      background: Container(
        alignment: Alignment.centerRight,
        color: Colors.redAccent[700],
      ),
      confirmDismiss: (DismissDirection direction) async {
        print("object");
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: const CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
                "https://gws-ug.jp/wp-content/plugins/all-in-one-seo-pack/images/default-user-image.png"),
          ),
          title: Text(user.name),
          onTap: () {},
        ),
      ),
    );
  }
}
