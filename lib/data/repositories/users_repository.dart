import '../../domain/i_repositories/users_repository.dart';
import '../model/user.dart';

// class UserGetListRepository {
//   getUserList(Ref ref) {
//     final userList = ref.watch(userGetListProvider);
//     if (userList.when(data: data, error: error, loading: loading)) {}
//   }
// }

class UsersRepositoryImpl implements UsersRepository {
  @override
  List<UserData> getUserList() {
    return [
      UserData.doc(name: 'test0', userId: '0'),
      UserData.doc(name: 'test1', userId: '1'),
      UserData.doc(name: 'test2', userId: '2'),
      UserData.doc(name: 'test3', userId: '3'),
    ];
  }
}
