import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/domain/interactor/users/user_fetch_all_interactor.dart';

import '../infrastructure/data_module.dart';
import 'Interactor/users/user_add_interactor.dart';
import 'interactor/users/user_search_interactor.dart';
import 'usecases/users/user_add_usecase.dart';

import 'usecases/users/user_fetch_all_usecase.dart';
import 'usecases/users/user_search_usecase.dart';

final userAddUseCaseProvider = Provider<UserAddUseCase>(((ref) {
  return UserAddInteractor(ref.watch(usersRepositoryProvider));
}));

final userFetchAllUseCaseProvider = Provider<UserFetchAllUseCase>(((ref) {
  return UserFetchAllInteractor(ref.watch(usersRepositoryProvider));
}));

final userSearchUseCaseProvider = Provider<UserSearchUseCase>(((ref) {
  return UserSearchInteractor(ref.watch(usersRepositoryProvider));
}));
