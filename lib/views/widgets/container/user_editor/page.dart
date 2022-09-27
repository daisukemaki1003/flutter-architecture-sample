import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/views/widgets/components/user_editor/page.dart';

class UserEditorPageContainer extends ConsumerWidget {
  const UserEditorPageContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const UserEditorPageComponent();
  }
}
