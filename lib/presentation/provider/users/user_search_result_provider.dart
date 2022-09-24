import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../views/models/user.dart';
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
    final data = state.value;
    if (data == null) {
      // loading or error
      return;
    }

    final users = ref.watch(userListNotifierProvider);
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
