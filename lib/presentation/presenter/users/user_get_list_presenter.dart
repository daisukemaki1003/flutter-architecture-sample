import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/domain/usecases/users/get_list/user_get_list_usecase.dart';

import '../../../domain/entity/model/user.dart';
import '../../../domain/interactor/users/user_get_list_interactor.dart';
import '../../../domain/usecases/users/get_list/user_get_list_input.dart';

///
/// Notifier provider
///
final userGetListPresenterNotifierProvider = StateNotifierProvider<
    UserGetListPresenterNotifier, AsyncValue<List<UserEntity>>>((ref) {
  return UserGetListPresenterNotifier(ref)..initialize();
});

///
/// Notifier
///
class UserGetListPresenterNotifier
    extends StateNotifier<AsyncValue<List<UserEntity>>> {
  UserGetListPresenterNotifier(this.ref)
      : super(const AsyncValue<List<UserEntity>>.loading());

  final Ref ref;

  Future<void> initialize() async {
    await handle();
  }

  handle() async {
    final usecase = ref.watch(userGetDetailUseCaseProvider);
    final input = ref.watch(userGetListInputProvider.notifier).state;
    state = AsyncValue.data((usecase.handle(input).users));
  }
}

///
/// Use case input data
///
final userGetListInputProvider = StateProvider<UserGetListInput>((ref) {
  return UserGetListInput();
});

///
/// Use case
///
final userGetDetailUseCaseProvider = Provider<UserGetListUseCase>(((ref) {
  return UserGetListInteractor();
}));
