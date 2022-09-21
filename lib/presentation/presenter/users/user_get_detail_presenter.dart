import '../../../domain/stubs/users/user_get_detail_interactor.dart';
import '../../../domain/usecases/users/get_detail/user_get_detail_input.dart';
import '../../../domain/usecases/users/get_detail/user_get_detail_usecase.dart';
import '../../model/user.dart';
import '../../model/user_detail.dart';
import '../transformer.dart';

class UserGetDetailPresenter {
  final UserGetDetailUseCase _usecase = UserGetDetailInteractor();

  Future<UserDetailModel> handle(UserModel user) async {
    final userEntity = translateUserModelToUserEntity(user);
    final input = UserGetDetailInput(userEntity);
    final output = _usecase.handle(input);
    final userDetailModel =
        translateUserDetailEntityToUserDetailModel(output.user);

    return userDetailModel;
  }
}
