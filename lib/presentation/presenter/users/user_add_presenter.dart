import '../../../domain/stubs/users/user_add_interactor.dart';
import '../../../domain/usecases/users/add/user_add_input.dart';
import '../../../domain/usecases/users/add/user_add_usecase.dart';

class UserAddPresenter {
  final UserAddUseCase _usecase = UserAddInteractor();

  handle(String name) {
    final input = UserAddInput(name);
    final output = _usecase.handle(input);
    return output;
  }
}
