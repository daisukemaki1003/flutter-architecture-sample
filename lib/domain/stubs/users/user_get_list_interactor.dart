import 'package:man_memo_v2/data/repositories/users_repository.dart';
import 'package:man_memo_v2/domain/entity/model/user.dart';

import '../../../data/model/user.dart';
import '../../i_repositories/users_repository.dart';
import '../../usecases/users/fetch_list/user_fetch_list_input.dart';
import '../../usecases/users/fetch_list/user_fetch_list_output.dart';
import '../../usecases/users/fetch_list/user_fetch_list_usecase.dart';

class UserFetchListInteractor implements UserFetchListUseCase {
  UsersRepository usersRepository = UsersRepositoryImpl();

  @override
  handle(UserFetchListInput input) {
    final userDataList = usersRepository.fetchList();
    final userEntityList =
        userDataList.map((userData) => translate(userData)).toList();

    return UserFetchListOutput(userEntityList);
  }

  /// Transformer
  UserEntity translate(UserData userData) {
    return UserEntity(userData.name);
  }
}
