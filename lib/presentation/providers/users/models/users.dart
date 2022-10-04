import '../../../../domain/entity/model/user.dart';

///
/// View model
class UsersViewModel {
  List<UserEntity> users;
  List<UserEntity> searchResults = [];
  UsersViewModel(this.users);
}
