import '../../../domain/stubs/users/user_get_list_interactor.dart';
import '../../../domain/usecases/users/user_get_list/user_get_list_input.dart';
import '../../../domain/usecases/users/user_get_list/user_get_list_output.dart';
import '../../../domain/usecases/users/user_get_list/user_get_list_usecase.dart';

class UserGetListPresenter {
  final UserGetListUseCase _usecase = UserGetListInteractor();

  Stream<UserGetListOutput> handle() async* {
    UserGetListInput input = UserGetListInput();
    UserGetListOutput output = _usecase.handle(input);
    yield output;
  }
}
