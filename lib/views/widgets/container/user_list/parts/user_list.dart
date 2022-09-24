import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/views/widgets/component/user_list/parts/user_list.dart';

import '../../../../../presentation/provider/users/user_list_provider.dart';

class UserListContainer extends ConsumerWidget {
  const UserListContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userList = ref.watch(userListNotifierProvider);

    return Consumer(
      builder: (context, ref, _) {
        return MaterialApp(
          home: userList.map(
            error: (_) => const Text('On Error'),
            loading: (_) => const CircularProgressIndicator(),
            data: (data) => MaterialApp(home: UserListComponent(data.value)),
          ),
        );
      },
    );
  }
}
