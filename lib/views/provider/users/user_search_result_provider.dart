import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/user.dart';
import 'user_list_provider.dart';

///
/// ユーザー検索結果
///
/// [usersSearchNotifierProvider] プロバイダー
/// [UsersSearchNotifier] State 管理
///

/// ユーザー検索プロバイダー
final userSearchNotifierProvider =
    StateNotifierProvider<UserSearchNotifier, AsyncValue<List<UserModel>>>(
  (ref) => UserSearchNotifier(ref)..initialize(),
);

/// State 管理
class UserSearchNotifier extends StateNotifier<AsyncValue<List<UserModel>>> {
  UserSearchNotifier(this.ref)
      : super(const AsyncValue<List<UserModel>>.loading());

  final Ref ref;

  /// 初期化
  void initialize() {
    state = AsyncValue.data(List<UserModel>.empty(growable: true));
  }

  /// ユーザー検索
  Future<void> search(String keyword) async {
    final users = ref.watch(userListNotifierProvider);
    users.map(
      error: (_) => print('On Error'),
      loading: (_) => print("load"),
      data: (users) {
        final data = users.value.users.where(
          (user) => user.name.contains(keyword),
        );
        state = AsyncValue.data(data.toList());
      },
    );
  }

  clear() {
    initialize();
  }
}
