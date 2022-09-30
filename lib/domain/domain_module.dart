import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../infrastructure/data_module.dart';
import 'interactor/users_interactor.dart';
import 'usecases/users_usecase.dart';

final usersUseCaseProvider = Provider<UsersUseCase>(((ref) {
  return UsersInteractor(ref.watch(usersRepositoryProvider));
}));
