import '../../../data/model/user.dart';
import '../../../data/repositories/users_repository.dart';
import '../../entity/model/user.dart';
import '../../i_repositories/users_repository.dart';

import '../../usecases/users/get_list/user_get_list_input.dart';
import '../../usecases/users/get_list/user_get_list_output.dart';
import '../../usecases/users/get_list/user_get_list_usecase.dart';

class UserGetListInteractor implements UserGetListUseCase {
  UsersRepository usersRepository = UsersRepositoryImpl();

  @override
  handle(UserGetListInput input) {
    final userDataList = usersRepository.getList();
    final userEntityList =
        userDataList.map((userData) => translate(userData)).toList();

    return UserGetListOutput(userEntityList);
  }

  /// Transformer
  UserEntity translate(UserData userData) {
    return UserEntity(userData.createdAt, userData.name);
  }
}
