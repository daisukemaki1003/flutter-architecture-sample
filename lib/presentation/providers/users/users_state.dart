import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../presenters/users_presenter.dart';
import 'user_model.dart';
import 'user_state.dart';

/// 検索結果
final userSearchResultsProvider = StateProvider<List<UserModel>>((ref) => []);

///
/// Provider
final usersNotifierProvider =
    StateNotifierProvider<UsersNotifier, AsyncValue<List<UserModel>>>((ref) {
  return UsersNotifier(
    ref,
    ref.watch(userPresenterProvider),
  )..initialize();
});

///
/// State
class UsersNotifier extends StateNotifier<AsyncValue<List<UserModel>>> {
  UsersNotifier(this.ref, this.presenter)
      : super(const AsyncValue<List<UserModel>>.loading());

  final Ref ref;
  final UsersPresenter presenter;

  Future<void> initialize() async {
    final users = await presenter.fetchAll();
    state = AsyncValue.data(users);
  }

  add() async {
    final form = ref.watch(userProvider);
    await presenter.add(form);
    ref.refresh(usersNotifierProvider);
  }

  fetchAll() async {
    state = AsyncValue.data(await presenter.fetchAll());
  }

  void search(String keyword) async {
    print("object");
    final userSearchResults = ref.watch(userSearchResultsProvider.state);
    userSearchResults.state.clear();
    userSearchResults.state = await presenter.search(keyword);
  }
}
