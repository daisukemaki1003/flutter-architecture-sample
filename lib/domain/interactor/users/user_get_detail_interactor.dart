import '../../../infrastructure/model/user.dart';
import '../../entity/model/user.dart';
import '../../entity/model/user_detail.dart';
import '../../i_repositories/users_repository.dart';
import '../../usecases/users/get_detail/user_get_detail_input.dart';
import '../../usecases/users/get_detail/user_get_detail_output.dart';
import '../../usecases/users/get_detail/user_get_detail_usecase.dart';

class UserGetDetailInteractor implements UserGetDetailUseCase {
  final UsersRepository usersRepository;

  UserGetDetailInteractor(this.usersRepository);

  @override
  handle(UserGetDetailInput input) {
    final userDetailData = usersRepository.getDetail("");

    UserDetailEntity userDetailEntity = UserDetailEntity(
      userBase: translateUserEntity(userDetailData.user),
      age: userDetailData.age,
      birthday: userDetailData.birthday,
      birthplace: userDetailData.birthplace,
      residence: userDetailData.residence,
      holiday: userDetailData.holiday,
      occupation: userDetailData.occupation,
      memo: userDetailData.memo,
    );
    return UserGetDetailOutput(userDetailEntity);
  }

  /// Transformer
  UserEntity translateUserEntity(UserData userData) {
    return UserEntity(userData.userId, userData.createdAt, userData.name);
  }
}
