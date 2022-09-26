import 'package:man_memo_v2/domain/stubs/users/user_search_interactor.dart';
import 'package:man_memo_v2/domain/usecases/users/search/user_search_input.dart';
import 'package:man_memo_v2/domain/usecases/users/search/user_search_usecase.dart';

import '../../views/models/user.dart';
import '../transformer.dart';

class UserSearchPresenter {
  Transformer transformer = Transformer();
  final UserSearchUseCase _usecase = UserSearchInteractor();

  Future<List<UserModel>> handle(String name) async {
    final input = UserSearchInput(name);
    final output = _usecase.handle(input);
    return output.users
        .map((e) => transformer.userEntityToUserModel(e))
        .toList();
  }
}
