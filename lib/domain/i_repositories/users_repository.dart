import '../../data/model/user.dart';

abstract class UsersRepository {
  List<UserData> getUserList();
}
