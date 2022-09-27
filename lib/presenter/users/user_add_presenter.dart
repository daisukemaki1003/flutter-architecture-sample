import '../../domain/stubs/users/user_add_interactor.dart';
import '../../domain/usecases/users/add/user_add_input.dart';
import '../../domain/usecases/users/add/user_add_usecase.dart';
import '../../views/models/user.dart';

class UserAddPresenter {
  final UserAddUseCase _usecase = UserAddInteractor();

  Future<void> handle(UserModel user) async {
    final input = UserAddInput(user.name);
    _usecase.handle(input);
  }
}
