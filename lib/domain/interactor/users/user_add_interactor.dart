import 'package:man_memo_v2/domain/usecases/users/add/user_add_input.dart';
import 'package:man_memo_v2/domain/usecases/users/add/user_add_output.dart';

import '../../../data/repositories/users_repository.dart';
import '../../i_repositories/users_repository.dart';
import '../../usecases/users/add/user_add_usecase.dart';

class UserAddInteractor implements UserAddUseCase {
  UsersRepository usersRepository = UsersRepositoryImpl();

  @override
  handle(UserAddInput input) {
    usersRepository.add(input.name);
    return UserAddOutput();
  }
}
