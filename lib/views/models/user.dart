class UserModel {
  final String userId;
  final String name;
  String? iconPath;
  final DateTime createdAt;
  UserModel(this.userId, this.name, this.iconPath, this.createdAt);
}

class UserViewModel {
  UserModel? user;
  final List<UserModel> users;
  UserViewModel(this.users);
}
