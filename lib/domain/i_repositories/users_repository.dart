import 'package:man_memo_v2/data/model/user_detail.dart';

import '../../data/model/user.dart';

abstract class UsersRepository {
  add(String name);
  List<UserData> getList();
  List<UserData> search(String searchText);
  UserDetailData getDetail(String uid);
}
