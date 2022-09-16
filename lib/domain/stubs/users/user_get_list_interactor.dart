import 'package:man_memo_v2/data/repositories/user_get_list_repository.dart';
import 'package:man_memo_v2/domain/entity/model/user.dart';

import '../../../data/model/user.dart';
import '../../i_repositories/user_get_list_repository.dart';
import '../../usecases/users/user_get_list/user_get_list_input.dart';
import '../../usecases/users/user_get_list/user_get_list_output.dart';
import '../../usecases/users/user_get_list/user_get_list_usecase.dart';

class UserGetListInteractor implements UserGetListUseCase {
  UserGetListRepository userGetListRepository = UserGetListRepositoryImpl();

  @override
  UserGetListOutput handle(UserGetListInput input) {
    final userDataList = userGetListRepository.getUserList();

    List<UserEntity> userEntityList =
        userDataList.map((userData) => translate(userData)).toList();

    return UserGetListOutput(userEntityList);
  }

  /// Transformer
  UserEntity translate(UserData userData) {
    return UserEntity(userData.name);
  }
}
