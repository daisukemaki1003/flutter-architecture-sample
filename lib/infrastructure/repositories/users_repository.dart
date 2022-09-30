import 'package:man_memo_v2/domain/entity/model/user.dart';

import '../../domain/i_repositories/users_repository.dart';
import '../datasources/users_datasource.dart';
import '../model/user.dart';

class UsersRepositoryImpl implements UsersRepository {
  final UsersDatabase usersDatabase;

  UsersRepositoryImpl(this.usersDatabase);

  @override
  Future<UserEntity> add(UserEntity user) async {
    final addedUser = await usersDatabase.create(UserData.fromEntity(user));
    return addedUser.toEntity();
  }

  @override
  Future<UserEntity> get(int id) async {
    final user = await usersDatabase.readUser(id);
    return user.toEntity();
  }

  @override
  Future<List<UserEntity>> getAll() async {
    final users = await usersDatabase.readAllUsers();
    return users.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<UserEntity>> search(String searchText) async {
    final users = await usersDatabase.readAllUsers();
    return users.map((e) => e.toEntity()).toList();
  }
}
