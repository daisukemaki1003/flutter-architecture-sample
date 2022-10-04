import 'package:man_memo_v2/domain/entity/model/user.dart';

import '../../domain/repositories/users_repository.dart';
import '../datasources/users_datasource.dart';
import '../models/user.dart';

class UsersRepositoryImpl implements UsersRepository {
  final UsersDatabase usersDatabase;

  UsersRepositoryImpl(this.usersDatabase);

  @override
  Future<UserEntity> add(UserEntity entity) async {
    final data = await usersDatabase.create(UserData.fromEntity(entity));
    return data.toEntity();
  }

  @override
  Future<UserEntity> get(int id) async {
    final data = await usersDatabase.readUser(id);
    return data.toEntity();
  }

  @override
  Future<List<UserEntity>> fetchAll() async {
    final datas = await usersDatabase.readAllUsers();
    return datas.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<UserEntity>> search(String searchText) async {
    final datas = await usersDatabase.readAllUsers();
    return datas.map((e) => e.toEntity()).toList();
  }
}
