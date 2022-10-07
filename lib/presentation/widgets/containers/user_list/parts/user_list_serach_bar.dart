import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../providers/users/users_state.dart';
import '../../../components/user_list/parts/user_list_serach_bar.dart';

class SerachBarContainer extends ConsumerWidget {
  const SerachBarContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, ref, _) {
        final usersNotifier = ref.watch(usersNotifierProvider.notifier);
        final userSearchResults = ref.watch(userSearchResultsProvider.state);
        return SerachBarComponent(
          search: usersNotifier.search,
          searchResults: userSearchResults.state,
        );
      },
    );
  }
}
