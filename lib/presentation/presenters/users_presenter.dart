import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/domain/usecases/users_usecase.dart';

import '../../domain/domain_module.dart';
import '../../domain/entity/model/user.dart';

import '../view_models/user_add_form.dart';

final userPresenterProvider = Provider((ref) {
  return UserPresenter(
    ref,
    ref.watch(usersUseCaseProvider),
  );
});

class UserPresenter {
  final Ref ref;

  final UsersUseCase _usersUseCase;

  UserPresenter(
    this.ref,
    this._usersUseCase,
  );

  Future<UserEntity> add(UserAddForm form) async {
    return await _usersUseCase.add(form.name);
  }

  Future<UserEntity> fetch(int id) async {
    return await _usersUseCase.fetch(id);
  }

  Future<List<UserEntity>> getList() async {
    return await _usersUseCase.fetchAll();
  }

  Future<List<UserEntity>> search(String keyword) async {
    return await _usersUseCase.search(keyword);
  }
}
