import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/user_model.dart';
import '../presenter/users/user_add_presenter.dart';
import '../presenter/users/user_get_list_presenter.dart';
import '../presenter/users/user_search_presenter.dart';

// https://qiita.com/tfandkusu/items/e6446008dee2ae375105

final userSearchPresenterProvder = Provider((ref) => UserSearchPresenter());

final listProvider = FutureProvider<List<UserModel>>((ref) async {
  final presenter = ref.read(userSearchPresenterProvder);
  return presenter.handle("te");
});

final userSearchResultsProvider = StateProvider<List<UserModel>>((ref) => []);

/////
///
///
///
///
///

/// Provider
final usersNotifierProvider =
    StateNotifierProvider<UsersNotifier, AsyncValue<List<UserModel>>>(
  (ref) => UsersNotifier(ref)..initialize(),
);

final usersActionsProvider = Provider((ref) => UsersActions(ref));

/// State 管理
class UsersNotifier extends StateNotifier<AsyncValue<List<UserModel>>> {
  UsersNotifier(this.ref) : super(const AsyncValue<List<UserModel>>.loading());

  final Ref ref;

  /// 初期化
  Future<void> initialize() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    final userFetchList =
        await ref.watch(userFetchListPresenterProvider.future);
    state = AsyncValue.data(userFetchList);
  }

  /// ユーザー追加
  Future<void> add(String name) async {
    final data = state.value;
    if (data == null) {
      // loading or error
      return;
    }
    final newUser = UserModel(name, "");
    state.value!.add(newUser);
  }
}

/// Presenter 操作
class UsersActions {
  UsersActions(this.ref);

  final Ref ref;

  add(String name) async {
    /// State更新
    await ref.read(usersNotifierProvider.notifier).add(name);

    /// Firebase更新
    final newUser = ref.read(usersNotifierProvider).value?.last;
    await ref.read(userAddPresenterProvider(newUser!).future);
  }
}
