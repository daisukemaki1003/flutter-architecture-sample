import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/presentation/provider/users/user_list_provider.dart';
import 'package:man_memo_v2/views/widgets/components/user_detail/page.dart';

class UserDetailPageContainer extends ConsumerWidget {
  const UserDetailPageContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, ref, _) {
        final user = ref.watch(userStateProvider);

        if (user == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return UserDetailPageComponent(user: user);
      },
    );
  }
}
