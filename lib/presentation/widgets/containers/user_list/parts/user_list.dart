import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/domain/entity/model/user.dart';
import 'package:man_memo_v2/presentation/widgets/components/user_list/parts/user_list.dart';

import '../../../../presenter/users/user_get_detail_presenter.dart';
import '../../../../presenter/users/user_get_list_presenter.dart';

class UserListContainer extends ConsumerWidget {
  const UserListContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(userGetListPresenterNotifierProvider);
    final selectedUser = ref.watch(selectedUserProvider.notifier);

    open(UserEntity user) {
      selectedUser.state = user;
    }

    return Consumer(
      builder: (context, ref, _) {
        return users.map(
          error: (_) => const Text('On Error'),
          loading: (_) => const CircularProgressIndicator(),
          data: (data) => UserListComponent(
            users: data.value,
            open: open,
          ),
        );
      },
    );
  }
}
