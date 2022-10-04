import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../providers/users/status/users.dart';
import '../../../components/user_list/parts/user_list_serach_bar.dart';

class SerachBarContainer extends ConsumerWidget {
  const SerachBarContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersViewModel = ref.watch(usersViewModelNotifierProvider);
    final usersViewModelNotifier =
        ref.watch(usersViewModelNotifierProvider.notifier);

    Widget searchResults = Consumer(
      builder: (context, ref, _) {
        return usersViewModel.map(
          error: (_) => const Text('On Error'),
          loading: (_) => const CircularProgressIndicator(),
          data: (data) {
            return SingleChildScrollView(
              child: Column(
                children: data.value.searchResults
                    .map(
                      (user) => ListTile(
                        title: Text(user.name),
                        subtitle: const Text("body text"),
                      ),
                    )
                    .toList(),
              ),
            );
          },
        );
      },
    );

    return SerachBarComponent(
      search: usersViewModelNotifier.search,
      searchResultClear: usersViewModelNotifier.clearSearchResults,
      searchResultWidget: searchResults,
    );
  }
}
