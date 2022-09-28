import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/presentation/widgets/components/user_detail/page.dart';

import '../../../presenter/users/user_get_detail_presenter.dart';

class UserDetailPageContainer extends ConsumerWidget {
  const UserDetailPageContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, ref, _) {
        final user = ref.watch(selectedUserProvider.notifier).state;
        return UserDetailPageComponent(user: user!);
      },
    );
  }
}
