import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/views/widgets/components/user_list/parts/user_list.dart';

import '../../../../provider/users/user_action_provider.dart';
import '../../../../provider/users/user_list_provider.dart';

class UserListContainer extends ConsumerWidget {
  const UserListContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userList = ref.watch(userListNotifierProvider);
    final action = ref.watch(userActionsProvider);

    return Consumer(
      builder: (context, ref, _) {
        return userList.map(
          error: (_) => const Text('On Error'),
          loading: (_) => const CircularProgressIndicator(),
          data: (data) => UserListComponent(
            users: data.value.users,
            open: action.open,
          ),
        );
      },
    );
  }
}
