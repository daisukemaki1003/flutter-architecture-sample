import '../../domain/stubs/users/user_get_list_interactor.dart';
import '../../domain/usecases/users/get_list/user_get_list_input.dart';
import '../../domain/usecases/users/get_list/user_get_list_usecase.dart';
import '../../views/models/user.dart';
import '../transformer.dart';

class UserGetListPresenter {
  Transformer transformer = Transformer();
  final UserGetListUseCase _usecase = UserGetListInteractor();

  Future<List<UserModel>> handle() async {
    final input = UserGetListInput();
    final output = _usecase.handle(input);
    return output.users
        .map((e) => transformer.userEntityToUserModel(e))
        .toList();
  }
}
