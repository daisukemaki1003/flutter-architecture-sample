import '../../../data/model/user.dart';
import '../../../data/repositories/users_repository.dart';
import '../../entity/model/user.dart';
import '../../i_repositories/users_repository.dart';
import '../../usecases/users/search/user_search_input.dart';
import '../../usecases/users/search/user_search_output.dart';
import '../../usecases/users/search/user_search_usecase.dart';

class UserSearchInteractor implements UserSearchUseCase {
  UsersRepository usersRepository = UsersRepositoryImpl();

  @override
  handle(UserSearchInput input) {
    final userDataList = usersRepository.search(input.searchText);
    final userEntityList =
        userDataList.map((userData) => translate(userData)).toList();

    return UserSearchOutput(userEntityList);
  }

  /// Transformer
  UserEntity translate(UserData userData) {
    return UserEntity(userData.name);
  }
}
