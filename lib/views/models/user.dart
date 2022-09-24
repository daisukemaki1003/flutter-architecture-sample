class UserModel {
  final String name;
  String? iconPath;
  final DateTime createdAt;
  UserModel(this.name, this.iconPath, this.createdAt);
}

// class Diary {
//   DateTime createdAt;
//   List<UserModel> users;
//   String title;
//   String body;
//   Diary({
//     required this.createdAt,
//     required this.users,
//     required this.title,
//     required this.body,
//   });
// }

class UserViewModel {
  UserModel? user;
  final List<UserModel> users;
  UserViewModel(this.users);
}
