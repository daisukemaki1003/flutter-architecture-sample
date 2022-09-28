import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../presenter/users/user_get_detail_presenter.dart';
import '../../../components/user_detail/parts/profile_bar.dart';

class ProfileBarContainer extends ConsumerWidget {
  const ProfileBarContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (context, ref, _) {
      final user = ref.watch(selectedUserProvider);
      if (user == null) {
        return const Center(child: CircularProgressIndicator());
      }
      return ProfileBarComponent(user: user);
    });
  }
}
