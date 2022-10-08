import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/domain/entity/model/user.dart';

import '../../../../providers/users/user_model.dart';
import '../../../components/user_detail/parts/profile_bar.dart';

class ProfileBarContainer extends ConsumerWidget {
  const ProfileBarContainer(this.user, {super.key});

  final UserModel user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (context, ref, _) {
      return ProfileBarComponent(user: user);
    });
  }
}
