import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/domain/entity/model/user.dart';
import 'package:man_memo_v2/presentation/view_models/users.dart';
import 'package:man_memo_v2/presentation/widgets/components/user_detail/parts/profile_widget.dart';

class ProfileWidgetContainer extends ConsumerWidget {
  const ProfileWidgetContainer(this.user, {super.key});

  final UserEntity user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersViewModelNotifier =
        ref.watch(usersViewModelNotifierProvider.notifier);

    return FutureBuilder(
        future: usersViewModelNotifier.getDetail(user),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ProfileWidgetComponent(snapshot.data!);
          } else {
            return Column(
              children: const [
                CircularProgressIndicator(),
                Text('Awaiting result...'),
              ],
            );
          }
        });
  }
}
