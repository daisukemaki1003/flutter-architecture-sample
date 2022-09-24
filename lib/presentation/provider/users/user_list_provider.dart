import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../views/models/user.dart';
import '../../presenter/users/user_get_list_presenter.dart';

/// プロバイダー
final userListNotifierProvider =
    StateNotifierProvider<UserListNotifier, AsyncValue<List<UserModel>>>(
  (ref) => UserListNotifier(ref)..initialize(),
);

/// State 管理
class UserListNotifier extends StateNotifier<AsyncValue<List<UserModel>>> {
  UserListNotifier(this.ref)
      : super(const AsyncValue<List<UserModel>>.loading());

  final Ref ref;
  final userGetListPresenter = UserGetListPresenter();

  /// 初期化
  Future<void> initialize() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    final userFetchList = await userGetListPresenter.handle();
    state = AsyncValue.data(userFetchList);
  }

  /// ユーザー追加
  void add(String name) async {
    final data = state.value;
    if (data == null) {
      // loading or error
      return;
    }

    final newUser = UserModel(name, "", DateTime.now());
    state = AsyncValue.data([...data, newUser]);
  }
}
