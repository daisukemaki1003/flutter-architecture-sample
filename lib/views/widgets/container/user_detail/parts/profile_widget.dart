import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/views/provider/users/user_list_provider.dart';
import 'package:man_memo_v2/views/widgets/components/user_detail/parts/profile_widget.dart';

import '../../../../provider/users/user_action_provider.dart';
import '../../../../models/user_detail.dart';

class ProfileWidgetContainer extends ConsumerWidget {
  const ProfileWidgetContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userStateProvider);
    return FutureBuilder(
      future: ref.watch(userActionsProvider).getDetail(user!),
      builder: (context, AsyncSnapshot<UserDetailModel> snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        } else {
          return ProfileWidgetComponent(user: snapshot.data!);
        }
      },
    );
  }
}
