import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:man_memo_v2/domain/entity/model/user.dart';

import '../../../containers/user_detail/page.dart';

class UserListComponent extends StatelessWidget {
  const UserListComponent(this.users, {super.key});

  final List<UserEntity> users;

  @override
  Widget build(BuildContext context) {
    const String userImage =
        "https://gws-ug.jp/wp-content/plugins/all-in-one-seo-pack/images/default-user-image.png";

    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: GroupedListView<UserEntity, String>(
        elements: users,
        groupBy: (element) => element.name,
        groupSeparatorBuilder: (String groupByValue) => Container(),
        itemBuilder: (context, element) {
          return Card(
            elevation: 8.0,
            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              leading: const CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(userImage),
              ),
              title: Text(element.name),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (builder) => UserDetailPageContainer(element),
                  ),
                );
              },
            ),
          );
        },
        itemComparator: (item1, item2) => item1.name.compareTo(item2.name),
        useStickyGroupSeparators: false,
        floatingHeader: false,
        stickyHeaderBackgroundColor: Colors.white.withOpacity(0.5),
        order: GroupedListOrder.ASC, // optional
      ),
    );
  }
}
