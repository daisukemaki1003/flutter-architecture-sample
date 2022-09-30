import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../infrastructure/data_module.dart';
import 'Interactor/users/user_add_interactor.dart';
import 'Interactor/users/user_get_detail_interactor.dart';
import 'Interactor/users/user_get_list_interactor.dart';
import 'interactor/users/user_search_interactor.dart';
import 'usecases/users/add/user_add_usecase.dart';
import 'usecases/users/get_detail/user_get_detail_usecase.dart';
import 'usecases/users/get_list/user_get_list_usecase.dart';
import 'usecases/users/search/user_search_usecase.dart';

final userAddUseCaseProvider = Provider<UserAddUseCase>(((ref) {
  return UserAddInteractor(ref.watch(usersRepositoryProvider));
}));

final userGetDetailUseCaseProvider = Provider<UserGetDetailUseCase>(((ref) {
  return UserGetDetailInteractor(ref.watch(usersRepositoryProvider));
}));

final userGetListUseCaseProvider = Provider<UserGetListUseCase>(((ref) {
  return UserGetListInteractor(ref.watch(usersRepositoryProvider));
}));

final userSearchUseCaseProvider = Provider<UserSearchUseCase>(((ref) {
  return UserSearchInteractor(ref.watch(usersRepositoryProvider));
}));
