import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/presentation/widgets/components/user_list/page.dart';

class UserListPageContainer extends ConsumerWidget {
  const UserListPageContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, ref, _) {
        return const UserListPageComponent();
      },
    );
  }
}
