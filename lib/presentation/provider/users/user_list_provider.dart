import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/user.dart';
import '../../presenter/users/user_get_list_presenter.dart';

///
/// ユーザー一覧
///
/// [usersNotifierProvider] プロバイダー
/// [UsersNotifier] State 管理
///

/// プロバイダー
final usersNotifierProvider =
    StateNotifierProvider<UsersNotifier, AsyncValue<List<UserModel>>>(
  (ref) => UsersNotifier(ref)..initialize(),
);

/// State 管理
class UsersNotifier extends StateNotifier<AsyncValue<List<UserModel>>> {
  UsersNotifier(this.ref) : super(const AsyncValue<List<UserModel>>.loading());

  final Ref ref;
  final userGetListPresenter = UserGetListPresenter();

  /// 初期化
  Future<void> initialize() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    final userFetchList = await userGetListPresenter.handle();
    // final userFetchList = await ref.watch(userGetListPresenterProvider.future);
    state = AsyncValue.data(userFetchList);
  }

  /// ユーザー追加
  Future<void> add(String name) async {
    final data = state.value;
    if (data == null) {
      // loading or error
      return;
    }
    final newUser = UserModel(name, "", DateTime.now());
    state.value!.add(newUser);
  }
}
