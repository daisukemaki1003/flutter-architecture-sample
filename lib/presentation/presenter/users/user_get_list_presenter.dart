import '../../../domain/stubs/users/user_get_list_interactor.dart';
import '../../../domain/usecases/users/get_list/user_get_list_input.dart';
import '../../../domain/usecases/users/get_list/user_get_list_usecase.dart';
import '../../model/user.dart';
import '../transformer.dart';

class UserGetListPresenter {
  final UserGetListUseCase _usecase = UserGetListInteractor();

  Future<List<UserModel>> handle() async {
    final input = UserGetListInput();
    final output = _usecase.handle(input);
    return output.users.map((e) => translateUserEntityToUserModel(e)).toList();
  }
}
