import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/domain/usecases/users_usecase.dart';

import '../../domain/domain_module.dart';

import '../providers/users/user_model.dart';

final userPresenterProvider = Provider((ref) {
  return UserPresenter(ref.watch(usersUseCaseProvider));
});

class UserPresenter {
  final UsersUseCase _usersUseCase;

  UserPresenter(this._usersUseCase);

  Future<UserModel> add(UserModel user) async {
    final entity = await _usersUseCase.add(user.name);
    return UserModel.fromEntity(entity);
  }

  Future<UserModel> fetch(int id) async {
    final entity = await _usersUseCase.fetch(id);
    return UserModel.fromEntity(entity);
  }

  Future<List<UserModel>> fetchAll() async {
    final entities = await _usersUseCase.fetchAll();
    return entities.map((e) => UserModel.fromEntity(e)).toList();
  }

  Future<List<UserModel>> search(String keyword) async {
    final entities = await _usersUseCase.search(keyword);
    return entities.map((e) => UserModel.fromEntity(e)).toList();
  }
}
