import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/domain/entity/model/user.dart';

import '../../../presenters/users_presenter.dart';
import '../models/users.dart';
import 'user_add_form.dart';

///
/// Provider
final usersViewModelNotifierProvider =
    StateNotifierProvider<UsersViewModelNotifier, AsyncValue<UsersViewModel>>(
        (ref) {
  return UsersViewModelNotifier(ref, ref.watch(userPresenterProvider))
    ..initialize();
});

///
/// State
class UsersViewModelNotifier extends StateNotifier<AsyncValue<UsersViewModel>> {
  UsersViewModelNotifier(this.ref, this.userPresenter)
      : super(const AsyncValue<UsersViewModel>.loading());
  final Ref ref;
  final UserPresenter userPresenter;

  Future<void> initialize() async {
    final users = await userPresenter.getList();
    state = AsyncValue.data(UsersViewModel(users));
  }

  add() async {
    final form = ref.watch(userAddFormProvider);
    await userPresenter.add(form);
    ref.refresh(usersViewModelNotifierProvider);
  }

  getList() async {
    final data = state.value;
    if (data == null) return;
    final users = await userPresenter.getList();
    data.users = users;
    state = AsyncValue.data(data);
  }

  search(String keyword) async {
    final data = state.value;
    if (data == null) return;
    final results = await userPresenter.search(keyword);
    data.searchResults = results;
    state = AsyncValue.data(data);
  }

  clearSearchResults() {
    final data = state.value;
    if (data == null) return;
    data.searchResults = List.empty();
    state = AsyncValue.data(data);
  }
}
