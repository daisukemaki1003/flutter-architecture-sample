import 'package:man_memo_v2/domain/usecases/users/add/user_add_input.dart';
import 'package:man_memo_v2/domain/usecases/users/add/user_add_output.dart';

import '../../../domain/stubs/users/user_add_interactor.dart';
import '../../../domain/usecases/users/add/user_add_usecase.dart';

class UserAddPresenter {
  final UserAddUseCase _usecase = UserAddInteractor();

  handle(String name) {
    UserAddInput input = UserAddInput(name);
    UserAddOutput output = _usecase.handle(input);
    return output;
  }
}
