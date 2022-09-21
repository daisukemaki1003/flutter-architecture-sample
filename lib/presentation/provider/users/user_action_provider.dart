import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/user.dart';
import '../../model/user_detail.dart';
import '../../presenter/users/user_add_presenter.dart';
import '../../presenter/users/user_get_detail_presenter.dart';
import 'user_list_provider.dart';
import 'user_search_result_provider.dart';

///
/// メソッド管理
///
/// [usersActionsProvider] プロバイダー
/// [UsersActions] Presenter操作メソッド群
///

final usersActionsProvider = Provider((ref) => UsersActions(ref));

/// Presenter 操作
class UsersActions {
  UsersActions(this.ref);

  final Ref ref;

  /// Presenter
  /// Domain層へのアクセス
  final userAddPresenter = UserAddPresenter();
  final userGetDetailPresenter = UserGetDetailPresenter();

  /// ユーザー追加
  Future<void> add(String name) async {
    await ref.read(usersNotifierProvider.notifier).add(name);
    final newUser = ref.read(usersNotifierProvider).value?.last;
    await userAddPresenter.handle(newUser!);
  }

  /// ユーザー詳細
  Future<UserDetailModel> getDetail(UserModel user) async {
    return await userGetDetailPresenter.handle(user);
  }

  /// 検索
  Future<void> search(String keyword) async {
    await ref.read(usersSearchNotifierProvider.notifier).search(keyword);
  }

  /// 検索結果クリア
  Future<void> searchResultsClear() async {
    await ref.read(usersSearchNotifierProvider.notifier).clear();
  }
}
