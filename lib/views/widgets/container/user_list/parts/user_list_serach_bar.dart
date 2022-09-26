import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../provider/users/user_action_provider.dart';
import '../../../../provider/users/user_search_result_provider.dart';
import '../../../components/user_list/parts/user_list_serach_bar.dart';

class SerachBarContainer extends ConsumerWidget {
  const SerachBarContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userActions = ref.watch(userActionsProvider);
    final userSearch = ref.watch(userSearchNotifierProvider);

    Widget searchResults = Consumer(
      builder: (context, ref, _) {
        return userSearch.map(
          error: (_) => const Text('On Error'),
          loading: (_) => const CircularProgressIndicator(),
          data: (data) {
            return SingleChildScrollView(
              child: Column(
                children: data.value
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
      search: userActions.search,
      searchResultClear: userActions.searchResultsClear,
      searchResultWidget: searchResults,
    );
  }
}
