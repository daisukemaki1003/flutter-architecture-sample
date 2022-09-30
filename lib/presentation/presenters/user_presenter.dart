import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/domain_module.dart';
import '../../domain/entity/model/user.dart';
import '../../domain/usecases/users/user_add_usecase.dart';
import '../../domain/usecases/users/user_fetch_all_usecase.dart';
import '../../domain/usecases/users/user_search_usecase.dart';
import '../view_models/user_add_form.dart';

final userPresenterProvider = Provider((ref) {
  return UserPresenter(
    ref,
    ref.watch(userAddUseCaseProvider),
    ref.watch(userFetchAllUseCaseProvider),
    ref.watch(userSearchUseCaseProvider),
  );
});

class UserPresenter {
  final Ref ref;

  final UserAddUseCase _userAddUseCase;
  final UserFetchAllUseCase _userGetListUseCase;
  final UserSearchUseCase _userSearchUseCase;

  UserPresenter(
    this.ref,
    this._userAddUseCase,
    this._userGetListUseCase,
    this._userSearchUseCase,
  );

  add(UserAddForm form) async {
    return _userAddUseCase.handle(form.name);
  }

  Future<List<UserEntity>> getList() async {
    return await _userGetListUseCase.handle(null);
  }

  Future<List<UserEntity>> search(String keyword) async {
    return await _userSearchUseCase.handle(keyword);
  }
}
