import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/presentation/model/user_model.dart';

import '../../provider/users_provider.dart';

class HomeViewModel {
  List<UserModel>? users;
  String stringToSearch = "";
  HomeViewModel(this.users);
}

final homeViewModelProvider = FutureProvider.autoDispose((ref) async {
  final futureUserList = ref.watch(userListStreamProvider.future);
  final userList = await futureUserList;

  List<UserModel>? users;
  if (userList.users != null) {
    users = userList.users!
        .map((user) => UserModel(user.name, user.iconPath))
        .toList();
  }
  return HomeViewModel(users);
});
