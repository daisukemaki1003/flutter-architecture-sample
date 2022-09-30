import 'package:man_memo_v2/domain/entity/model/user.dart';

import '../../i_repositories/users_repository.dart';
import '../../usecases/users/user_add_usecase.dart';

class UserAddInteractor implements UserAddUseCase {
  final UsersRepository usersRepository;

  UserAddInteractor(this.usersRepository);

  @override
  Future<UserEntity> handle(String name) async {
    final user = UserEntity(
        createdAt: DateTime.now(),
        name: name,
        icon: "icon",
        age: 21,
        birthday: "birthday",
        birthplace: "birthplace",
        residence: "residence",
        holiday: 0,
        occupation: "occupation",
        memo: "memo");
    return await usersRepository.add(user);
  }
}
