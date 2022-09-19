import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entity/model/user.dart';
import '../../../domain/stubs/users/user_get_list_interactor.dart';
import '../../../domain/usecases/users/fetch_list/user_fetch_list_input.dart';
import '../../../domain/usecases/users/fetch_list/user_fetch_list_usecase.dart';
import '../../model/user_model.dart';

/// Provider
final userFetchListPresenterProvider = FutureProvider((ref) async {
  return UserFetchListPresenter().handle();
});

/// Presenter
class UserFetchListPresenter {
  final UserFetchListUseCase _usecase = UserFetchListInteractor();

  List<UserModel> handle() {
    final input = UserFetchListInput();
    final output = _usecase.handle(input);
    return output.users.map((e) => translate(e)).toList();
  }

  /// Transformer
  UserModel translate(UserEntity userEntity) {
    return (UserModel(userEntity.name, userEntity.iconPath));
  }
}
