import 'package:man_memo_v2/domain/entity/model/user.dart';

abstract class UsersRepository {
  Future<UserEntity> add(UserEntity user);
  Future<UserEntity> get(int id);
  Future<List<UserEntity>> fetchAll();
  Future<List<UserEntity>> search(String searchText);
}
