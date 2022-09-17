import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/presentation/model/user_model.dart';
import 'package:man_memo_v2/presentation/presenter/users/user_search_presenter.dart';

final repositoryListViewModelProvider = StateNotifierProvider.autoDispose<
    RepositoryListViewModel, AsyncValue<List<UserModel>>>(
  (ref) => RepositoryListViewModel(UserSearchPresenter()),
);

class RepositoryListViewModel
    extends StateNotifier<AsyncValue<List<UserModel>>> {
  RepositoryListViewModel(this._userSearchPresenter)
      : super(const AsyncValue.loading()) {
    searchRepositories("");
  }

  final UserSearchPresenter _userSearchPresenter;

  Future<void> searchRepositories(String searchKeyword) async {
    if (searchKeyword.isEmpty) {
      return;
    }

    state = const AsyncValue.loading();
    try {
      final repositoryList = _userSearchPresenter.handle(searchKeyword);
      print(searchKeyword);
      state = AsyncValue.data(repositoryList);
    } on Exception catch (error) {
      state = AsyncValue.error(error);
    }
  }
}
