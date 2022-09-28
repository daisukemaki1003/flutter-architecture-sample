import 'package:flutter/material.dart';
import 'package:man_memo_v2/domain/entity/model/user.dart';

import 'user.dart';

class UserListComponent extends StatelessWidget {
  const UserListComponent({
    super.key,
    required this.users,
    required this.open,
  });

  final List<UserEntity> users;
  final Function(UserEntity) open;

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
            final user = users[index];
            return UserWidgetComponent(user: user, open: open);
          },
        ),
      ],
    );
  }
}
