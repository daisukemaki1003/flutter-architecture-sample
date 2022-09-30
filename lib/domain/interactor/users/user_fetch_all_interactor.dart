import '../../entity/model/user.dart';
import '../../i_repositories/users_repository.dart';
import '../../usecases/users/user_fetch_all_usecase.dart';

class UserFetchAllInteractor implements UserFetchAllUseCase {
  final UsersRepository usersRepository;

  UserFetchAllInteractor(this.usersRepository);

  @override
  Future<List<UserEntity>> handle(void input) async {
    return await usersRepository.getAll();
  }
}
