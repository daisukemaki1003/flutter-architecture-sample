import '../../domain/i_repositories/users_repository.dart';
import '../datasources/users_datasource.dart';
import '../model/user.dart';

class UsersRepositoryImpl implements UsersRepository {
  UsersDataSource usersDataSource = UsersDataSource();

  @override
  void add(String name) {
    usersDataSource.add(name);
  }

  @override
  List<UserData> getList() {
    return usersDataSource.fetchList();
  }

  @override
  List<UserData> search(String searchText) {
    return usersDataSource.search(searchText);
  }

  @override
  getDetail(String uid) {
    return usersDataSource.getDetail();
  }
}
