import '../../entity/model/user.dart';
import '../../i_repositories/users_repository.dart';
import '../../usecases/users/user_search_usecase.dart';

class UserSearchInteractor implements UserSearchUseCase {
  final UsersRepository usersRepository;

  UserSearchInteractor(this.usersRepository);

  @override
  Future<List<UserEntity>> handle(String keyword) async {
    return await usersRepository.getAll();
  }

  // @override
  // handle( input) {
  //   final userDataList = usersRepository.search(input.searchText);
  //   final userEntityList =
  //       userDataList.map((userData) => translate(userData)).toList();

  //   return UserSearchOutput(userEntityList);
  // }
}
