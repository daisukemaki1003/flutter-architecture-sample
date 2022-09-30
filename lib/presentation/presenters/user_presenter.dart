import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/domain_module.dart';
import '../../domain/entity/model/user.dart';
import '../../domain/entity/model/user_detail.dart';
import '../../domain/usecases/users/add/user_add_input.dart';
import '../../domain/usecases/users/add/user_add_usecase.dart';
import '../../domain/usecases/users/get_detail/user_get_detail_input.dart';
import '../../domain/usecases/users/get_detail/user_get_detail_usecase.dart';
import '../../domain/usecases/users/get_list/user_get_list_input.dart';
import '../../domain/usecases/users/get_list/user_get_list_usecase.dart';
import '../../domain/usecases/users/search/user_search_input.dart';
import '../../domain/usecases/users/search/user_search_usecase.dart';
import '../view_models/user_add_form.dart';

final userPresenterProvider = Provider((ref) {
  return UserPresenter(
    ref,
    ref.watch(userAddUseCaseProvider),
    ref.watch(userGetDetailUseCaseProvider),
    ref.watch(userGetListUseCaseProvider),
    ref.watch(userSearchUseCaseProvider),
  );
});

class UserPresenter {
  final Ref ref;

  final UserAddUseCase _userAddUseCase;
  final UserGetDetailUseCase _userGetDetailUseCase;
  final UserGetListUseCase _userGetListUseCase;
  final UserSearchUseCase _userSearchUseCase;

  UserPresenter(
    this.ref,
    this._userAddUseCase,
    this._userGetDetailUseCase,
    this._userGetListUseCase,
    this._userSearchUseCase,
  );

  add(UserAddForm form) async {
    final input = UserAddInput(form.name);
    return _userAddUseCase.handle(input);
  }

  Future<UserDetailEntity> getDetail(UserEntity user) async {
    final input = UserGetDetailInput(user);
    return _userGetDetailUseCase.handle(input).user;
  }

  Future<List<UserEntity>> getList() async {
    final input = UserGetListInput();
    return _userGetListUseCase.handle(input).users;
  }

  Future<List<UserEntity>> search(String keyword) async {
    final input = UserSearchInput(keyword);
    return _userSearchUseCase.handle(input).users;
  }
}
