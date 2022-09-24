import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../views/models/user.dart';
import '../../../views/models/user_detail.dart';
import '../../presenter/users/user_add_presenter.dart';
import '../../presenter/users/user_get_detail_presenter.dart';
import 'user_list_provider.dart';
import 'user_search_result_provider.dart';

final userActionsProvider = Provider((ref) => UserActions(ref));

/// Presenter 操作
class UserActions {
  UserActions(this.ref);

  final Ref ref;

  /// Presenter
  /// Domain層へのアクセス
  final userAddPresenter = UserAddPresenter();
  final userGetDetailPresenter = UserGetDetailPresenter();

  /// ユーザー追加
  Future<void> add(String name) async {
    ref.read(userListNotifierProvider.notifier).add(name);
    // await ref.read(userListNotifierProvider.notifier).add(name);
    final newUser = ref.read(userListNotifierProvider).value!.last;
    await userAddPresenter.handle(newUser);
  }

  /// ユーザー詳細
  Future<UserDetailModel> getDetail(UserModel user) async {
    return await userGetDetailPresenter.handle(user);
  }

  /// 検索
  Future<void> search(String keyword) async {
    await ref.read(userSearchNotifierProvider.notifier).search(keyword);
  }

  /// 検索結果クリア
  Future<void> searchResultsClear() async {
    await ref.read(userSearchNotifierProvider.notifier).clear();
  }
}
