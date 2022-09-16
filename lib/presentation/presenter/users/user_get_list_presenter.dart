import '../../../domain/stubs/users/user_get_list_interactor.dart';
import '../../../domain/usecases/users/fetch_list/user_fetch_list_input.dart';
import '../../../domain/usecases/users/fetch_list/user_fetch_list_output.dart';
import '../../../domain/usecases/users/fetch_list/user_fetch_list_usecase.dart';

class UserFetchListPresenter {
  final UserFetchListUseCase _usecase = UserFetchListInteractor();

  Stream<UserFetchListOutput> handle() async* {
    UserFetchListInput input = UserFetchListInput();
    UserFetchListOutput output = _usecase.handle(input);
    yield output;
  }
}
