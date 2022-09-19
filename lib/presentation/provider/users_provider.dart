import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/user_model.dart';
import '../presenter/users/user_add_presenter.dart';
import '../presenter/users/user_get_list_presenter.dart';

// https://qiita.com/tfandkusu/items/e6446008dee2ae375105

// final userSearchPresenterProvder = Provider((ref) => UserSearchPresenter());

// final listProvider = FutureProvider<List<UserModel>>((ref) async {
//   final presenter = ref.read(userSearchPresenterProvder);
//   return presenter.handle("te");
// });

// final userSearchResultsProvider = StateProvider<List<UserModel>>((ref) => []);

final usersSearchNotifierProvider =
    StateNotifierProvider<UsersSearchNotifier, AsyncValue<List<UserModel>>>(
  (ref) => UsersSearchNotifier(ref)..initialize(),
);

/// State 管理
class UsersSearchNotifier extends StateNotifier<AsyncValue<List<UserModel>>> {
  UsersSearchNotifier(this.ref)
      : super(const AsyncValue<List<UserModel>>.loading());

  final Ref ref;

  /// 初期化
  void initialize() {
    state = AsyncValue.data(List<UserModel>.empty(growable: true));
  }

  /// ユーザー検索
  Future<void> search(String keyword) async {
    final data = state.value;
    if (data == null) {
      // loading or error
      return;
    }

    final users = ref.watch(usersNotifierProvider);
    users.map(
      error: (_) => print('On Error'),
      loading: (_) => print("load"),
      data: (data) {
        for (var element in data.value) {
          if (element.name.contains(keyword)) {
            print(element.name);
            state.value!.add(element);
          }
        }
      },
    );
  }

  clear() {
    initialize();
  }
}

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

/// メソッド管理
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

  search(String keyword) async {
    /// State更新
    await ref.read(usersSearchNotifierProvider.notifier).search(keyword);
  }

  searchResultsClear() async {
    /// State更新
    await ref.read(usersSearchNotifierProvider.notifier).clear();
  }
}
