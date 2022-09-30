import '../../domain/i_repositories/users_repository.dart';
import '../datasources/users_datasource.dart';
import '../model/user.dart';

class UsersRepositoryImpl implements UsersRepository {
  final UsersDataSource testUsersDataSource;
  final UsersDatabase usersDatabase;

  UsersRepositoryImpl(this.usersDatabase, this.testUsersDataSource);

  @override
  void add(String name) async {
    final user = User(
      id: null,
      createdAt: DateTime.now(),
      name: name,
      icon: "",
      age: 0,
      birthday: "birthday",
      birthplace: "birthplace",
      residence: "residence",
      holiday: 0,
      occupation: "occupation",
      memo: "memo",
    );

    print("create");
    usersDatabase.create(user);
    print("readAllUsers");
    final users = await usersDatabase.readAllUsers();
    for (var item in users) {
      print(item.name);
    }

    testUsersDataSource.add(name);
  }

  @override
  List<UserData> getList() {
    return testUsersDataSource.fetchList();
  }

  @override
  List<UserData> search(String searchText) {
    return testUsersDataSource.search(searchText);
  }

  @override
  getDetail(String uid) {
    return testUsersDataSource.getDetail();
  }
}
