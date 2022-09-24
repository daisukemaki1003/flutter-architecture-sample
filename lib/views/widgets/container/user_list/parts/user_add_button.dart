import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/presentation/provider/users/user_list_provider.dart';

import '../../../../../presentation/provider/users/user_action_provider.dart';
import '../../../component/user_list/parts/user_add_button.dart';

class UserAddButtonContainer extends ConsumerWidget {
  const UserAddButtonContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userActions = ref.watch(userActionsProvider);
    final userList = ref.watch(userListNotifierProvider);

    add() async {
      /// ボトムシート
      print("object");
      // userActions.add("name");
      await userActions.add("name");
      // ref.read(userListNotifierProvider.notifier).add("name");
      // ref.refresh(userActionsProvider);
      print(userList.value);
    }

    return UserAddButtonComponent(add);
  }
}
