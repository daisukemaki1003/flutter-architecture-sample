import 'package:man_memo_v2/domain/entity/model/user.dart';
import 'package:man_memo_v2/infrastructure/models/user_detail.dart';

abstract class UsersRepository {
  Future<UserEntity> add(UserEntity user);
  Future<UserEntity> get(int id);
  Future<List<UserEntity>> getAll();
  Future<List<UserEntity>> search(String searchText);
}
