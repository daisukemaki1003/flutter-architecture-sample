import '../../data/model/user.dart';

abstract class UsersRepository {
  add(String name);
  List<UserData> fetchList();
  List<UserData> search(String searchText);
}
