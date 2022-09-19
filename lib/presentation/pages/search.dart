// final repositoryListState =
//     useProvider(repositoryListViewModelProvider.state);

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import '../provider/users_provider.dart';

// class MySerachBar extends ConsumerWidget {
//   const MySerachBar({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final repositoryListState = ref.watch(repositoryListViewModelProvider);
//     final repositoryListNotifier =
//         ref.watch(repositoryListViewModelProvider.notifier);

//     return FloatingSearchBar(
//       hint: 'Search...',
//       openAxisAlignment: 0.0,
//       elevation: 4,
//       height: 55,
//       margins: const EdgeInsets.only(top: 70, left: 10, right: 10, bottom: 10),
//       isScrollControlled: true,
//       scrollPadding: const EdgeInsets.only(top: 16, bottom: 20),
//       transitionDuration: const Duration(milliseconds: 500),
//       transitionCurve: Curves.easeInOut,
//       physics: const BouncingScrollPhysics(),
//       axisAlignment: MediaQuery.of(context).orientation == Orientation.portrait
//           ? 0.0
//           : -1.0,
//       width: MediaQuery.of(context).orientation == Orientation.portrait
//           ? 600
//           : 500,
//       debounceDelay: const Duration(milliseconds: 500),
//       onQueryChanged: (query) {
//         repositoryListNotifier.searchRepositories(query);
//       },
//       transition: CircularFloatingSearchBarTransition(),
//       actions: [
//         FloatingSearchBarAction(
//           showIfOpened: false,
//           child: CircularButton(
//             icon: const Icon(Icons.place),
//             onPressed: () {
//               print("place");
//             },
//           ),
//         ),
//         FloatingSearchBarAction.searchToClear(
//           showIfClosed: false,
//         ),
//       ],
//       builder: (context, transition) {
//         return ClipRRect(
//           borderRadius: BorderRadius.circular(8),
//           child: Material(
//             color: Colors.white,
//             elevation: 4.0,
//             child: repositoryListState.when(
//               error: (error, _) => Text(error.toString()),
//               loading: () => const Text("指定した検索キーワードをすべて含む検索結果は見つかりませんでした。"),
//               data: (users) {
//                 return Column(
//                   children: users
//                       .map((user) => ListTile(
//                             title: Text(user.name),
//                             subtitle: const Text("body text"),
//                           ))
//                       .toList(),
//                 );
//               },
//             ),
//           ),
//         );

//         // return repositoryListState.when(
//         //   error: (error, _) => Text(error.toString()),
//         //   loading: () => const CircularProgressIndicator(),
//         //   data: (users) {
//         //     return ClipRRect(
//         //       borderRadius: BorderRadius.circular(8),
//         //       child: Material(
//         //           color: Colors.white,
//         //           elevation: 4.0,
//         //           child: Column(
//         //             children: users
//         //                 .map((user) => ListTile(
//         //                       title: Text(user.name),
//         //                       subtitle: const Text("body text"),
//         //                     ))
//         //                 .toList(),
//         //           )),
//         //     );
//         //   },
//         // );
//       },
//     );
//   }
// }

class MySerachBar extends ConsumerWidget {
  const MySerachBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return FloatingSearchBar(
      hint: 'Search...',
      openAxisAlignment: 0.0,
      elevation: 4,
      height: 55,
      margins: const EdgeInsets.only(top: 70, left: 10, right: 10, bottom: 10),
      isScrollControlled: true,
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 20),
      transitionDuration: const Duration(milliseconds: 500),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      transition: CircularFloatingSearchBarTransition(),
      onSubmitted: ((query) {
        ref.watch(usersActionsProvider).search(query);
      }),
      onFocusChanged: ((isFocused) {
        if (!isFocused) ref.watch(usersActionsProvider).searchResultsClear();
      }),
      actions: [],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.white,
            elevation: 4.0,
            child: Consumer(
              builder: (context, ref, _) {
                final users = ref.watch(usersSearchNotifierProvider);
                return users.map(
                  error: (_) => const Text('On Error'),
                  loading: (_) => const CircularProgressIndicator(),
                  data: (data) {
                    return Column(
                      children: data.value
                          .map(
                            (user) => ListTile(
                              title: Text(user.name),
                              subtitle: const Text("body text"),
                            ),
                          )
                          .toList(),
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
