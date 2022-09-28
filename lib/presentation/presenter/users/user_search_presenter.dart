import 'dart:ffi';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/domain/interactor/users/user_search_interactor.dart';
import 'package:man_memo_v2/domain/usecases/users/search/user_search_input.dart';
import 'package:man_memo_v2/domain/usecases/users/search/user_search_usecase.dart';

import '../../../domain/entity/model/user.dart';

///
/// Notifier provider
///
final userSearchPresenterNotifierProvider = StateNotifierProvider<
    UserSearchPresenterNotifier, AsyncValue<List<UserEntity>>>((ref) {
  return UserSearchPresenterNotifier(ref)..initialize();
});

/// Notifier
class UserSearchPresenterNotifier
    extends StateNotifier<AsyncValue<List<UserEntity>>> {
  UserSearchPresenterNotifier(this.ref)
      : super(const AsyncValue<List<UserEntity>>.loading());

  final Ref ref;

  Future<void> initialize() async {
    state = AsyncValue.data(List.empty());
  }

  /// 検索
  handle() async {
    final usecase = ref.watch(userSearchUseCaseProvider);
    final input = ref.watch(userSearchInputProvider.notifier).state;
    state = AsyncValue.data(usecase.handle(input).users);
  }

  clear() {
    initialize();
  }
}

///
/// 検索キーワード
///
final searchKeyWordProvider = StateProvider<String>((_) {
  return "";
});

///
/// Use case input data
///
final userSearchInputProvider = StateProvider<UserSearchInput>((ref) {
  final searchKeyWord = ref.watch(searchKeyWordProvider.notifier).state;
  return UserSearchInput(searchKeyWord);
});

///
/// Use case
///
final userSearchUseCaseProvider = Provider<UserSearchUseCase>(((ref) {
  return UserSearchInteractor();
}));
