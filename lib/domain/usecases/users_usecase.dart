import '../entity/model/user.dart';

abstract class UsersUseCase {
  Future<UserEntity> add(String name);
  Future<UserEntity> fetch(int id);
  Future<List<UserEntity>> fetchAll();
  Future<List<UserEntity>> search(String keyword);
}
