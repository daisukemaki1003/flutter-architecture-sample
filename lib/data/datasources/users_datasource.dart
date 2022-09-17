import "package:man_memo_v2/data/model/user.dart";

class UsersDataSource {
  static final UsersDataSource _instance = UsersDataSource._internal();

  factory UsersDataSource() {
    return _instance;
  }

  UsersDataSource._internal();

  List<UserData> users = [
    UserData(name: "test0", userId: "0", createdAt: DateTime.now()),
    UserData(name: "test2", userId: "1", createdAt: DateTime.now()),
    UserData(name: "test1", userId: "2", createdAt: DateTime.now()),
    UserData(name: "test3", userId: "3", createdAt: DateTime.now()),
  ];

  add(String name) {
    print(users.length);
    users.add(UserData(name: name, userId: "3", createdAt: DateTime.now()));
  }

  List<UserData> fetchList() {
    print(users.length);

    return users;
  }
}
