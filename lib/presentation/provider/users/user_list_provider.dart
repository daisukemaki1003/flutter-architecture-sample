import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../views/models/user.dart';
import '../../presenter/users/user_get_list_presenter.dart';

final userStateProvider = StateProvider.autoDispose<UserModel?>((ref) {
  return ref.watch(userListNotifierProvider).value?.user;
});

/// プロバイダー
final userListNotifierProvider =
    StateNotifierProvider<UserListNotifier, AsyncValue<UserViewModel>>(
  (ref) => UserListNotifier(ref)..initialize(),
);

/// State 管理
class UserListNotifier extends StateNotifier<AsyncValue<UserViewModel>> {
  UserListNotifier(this.ref) : super(const AsyncValue<UserViewModel>.loading());

  final Ref ref;
  final userGetListPresenter = UserGetListPresenter();

  /// 初期化
  Future<void> initialize() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    final userList = await userGetListPresenter.handle();
    state = AsyncValue.data(UserViewModel(userList));
  }

  /// ユーザー追加
  void add(String name) async {
    final data = state.value;
    if (data == null) return;
    final newUser = UserModel(name, "", DateTime.now());
    state = AsyncValue.data(UserViewModel([...data.users, newUser]));
  }

  open(UserModel user) {
    state.value!.user = user;
  }
}
