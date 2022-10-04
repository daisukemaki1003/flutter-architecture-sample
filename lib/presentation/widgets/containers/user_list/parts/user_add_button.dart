import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../providers/users/status/users.dart';
import '../../../components/user_list/parts/user_add_button.dart';

class UserAddButtonContainer extends ConsumerWidget {
  const UserAddButtonContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersViewModelNotifier =
        ref.watch(usersViewModelNotifierProvider.notifier);

    return UserAddButtonComponent(usersViewModelNotifier.add);
  }
}
