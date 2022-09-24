import '../../../domain/stubs/users/user_get_detail_interactor.dart';
import '../../../domain/usecases/users/get_detail/user_get_detail_input.dart';
import '../../../domain/usecases/users/get_detail/user_get_detail_usecase.dart';
import '../../../views/models/user.dart';
import '../../../views/models/user_detail.dart';
import '../transformer.dart';

class UserGetDetailPresenter {
  Transformer transformer = Transformer();
  final UserGetDetailUseCase _usecase = UserGetDetailInteractor();

  Future<UserDetailModel> handle(UserModel user) async {
    final userEntity = transformer.userModelToUserEntity(user);
    final input = UserGetDetailInput(userEntity);
    final output = _usecase.handle(input);
    final userDetailModel =
        transformer.userDetailEntityToUserDetailModel(output.user);

    return userDetailModel;
  }
}
