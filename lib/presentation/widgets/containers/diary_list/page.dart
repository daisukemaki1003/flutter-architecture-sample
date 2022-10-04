import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/diary_list/page.dart';

class DiaryListPageContainer extends ConsumerWidget {
  const DiaryListPageContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DiaryListPageComponent();
  }
}
