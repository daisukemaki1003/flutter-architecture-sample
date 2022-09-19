import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/stubs/users/user_add_interactor.dart';
import '../../../domain/usecases/users/add/user_add_input.dart';
import '../../../domain/usecases/users/add/user_add_usecase.dart';
import '../../model/user_model.dart';

/// Provider
final userAddPresenterProvider =
    FutureProvider.family<void, UserModel>((ref, user) async {
  UserAddPresenter().handle(user);
});

class UserAddPresenter {
  final UserAddUseCase _usecase = UserAddInteractor();

  void handle(UserModel user) {
    final input = UserAddInput(user.name);
    _usecase.handle(input);
  }
}
