import 'package:flutter/material.dart';

import '../../../../models/user.dart';
import 'user.dart';

class UserListComponent extends StatelessWidget {
  const UserListComponent(this.users, {super.key});

  final List<UserModel> users;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListView(
        children: [
          const SizedBox(height: 100),
          ListView.builder(
            itemCount: users.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              final user = users[index];
              return UserWidget(user);
            },
          ),
        ],
      ),
    );
  }
}
