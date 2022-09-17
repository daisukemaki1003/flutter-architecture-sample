import '../../domain/i_repositories/users_repository.dart';
import '../datasources/users_datasource.dart';
import '../model/user.dart';

class UsersRepositoryImpl implements UsersRepository {
  UsersDataSource usersDataSource = UsersDataSource();

  @override
  add(String name) {
    usersDataSource.add(name);
  }

  @override
  List<UserData> fetchList() {
    return usersDataSource.fetchList();
  }
}
