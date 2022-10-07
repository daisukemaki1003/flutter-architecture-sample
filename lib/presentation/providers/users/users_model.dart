import 'user_model.dart';

///
/// View model
class UsersViewModel {
  List<UserModel> users;
  List<UserModel> searchResults = [];
  UsersViewModel(this.users);
}
