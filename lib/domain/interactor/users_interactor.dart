import 'package:man_memo_v2/domain/entity/enum/prefectures.dart';
import 'package:man_memo_v2/domain/entity/model/user.dart';
import 'package:man_memo_v2/domain/usecases/users_usecase.dart';

import '../entity/enum/occupation.dart';
import '../repositories/users_repository.dart';

class UsersInteractor implements UsersUseCase {
  final UsersRepository repository;

  UsersInteractor(this.repository);

  @override
  Future<UserEntity> add(String name) async {
    final user = UserEntity(
        createdAt: DateTime.now(),
        name: name,
        icon: "icon",
        age: 21,
        birthday: "birthday",
        birthplace: PrefecturesEnum.aichi,
        residence: PrefecturesEnum.chiba,
        holiday: 0,
        occupation: OccupatioEenum.student,
        memo: "memo");
    return await repository.add(user);
  }

  @override
  Future<UserEntity> fetch(int id) async {
    return repository.get(id);
  }

  @override
  Future<List<UserEntity>> fetchAll() async {
    return await repository.fetchAll();
  }

  @override
  Future<List<UserEntity>> search(String keyword) async {
    return await repository.fetchAll();
  }
}
