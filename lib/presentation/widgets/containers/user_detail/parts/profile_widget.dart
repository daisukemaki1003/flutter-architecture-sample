import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/domain/entity/model/user_detail.dart';
import 'package:man_memo_v2/presentation/widgets/components/user_detail/parts/profile_widget.dart';

import '../../../../presenter/users/user_get_detail_presenter.dart';

class ProfileWidgetContainer extends ConsumerWidget {
  const ProfileWidgetContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userGetDetailPresenterNotifier =
        ref.watch(userGetDetailPresenterNotifierProvider.notifier);

    return FutureBuilder(
      future: userGetDetailPresenterNotifier.handle(),
      builder: (context, AsyncSnapshot<UserDetailEntity> snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        } else {
          final user = userGetDetailPresenterNotifier.state;
          return ProfileWidgetComponent(user: user!);
        }
      },
    );
  }
}
