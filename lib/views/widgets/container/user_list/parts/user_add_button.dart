import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../provider/users/user_action_provider.dart';
import '../../../components/user_list/parts/user_add_button.dart';

class UserAddButtonContainer extends ConsumerWidget {
  const UserAddButtonContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userActions = ref.watch(userActionsProvider);

    add() async {
      /// ボトムシート
      await userActions.add("test3");
    }

    return UserAddButtonComponent(add);
  }
}
