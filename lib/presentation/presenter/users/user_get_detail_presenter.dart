import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/domain/entity/model/user.dart';
import 'package:man_memo_v2/domain/entity/model/user_detail.dart';

import '../../../domain/interactor/users/user_get_detail_interactor.dart';
import '../../../domain/usecases/users/get_detail/user_get_detail_input.dart';
import '../../../domain/usecases/users/get_detail/user_get_detail_usecase.dart';

///
/// Notifier provider
///
final userGetDetailPresenterNotifierProvider =
    StateNotifierProvider<UserGetDetailPresenterNotifier, UserDetailEntity?>(
        (ref) {
  return UserGetDetailPresenterNotifier(ref);
});

///
/// Notifier
///
class UserGetDetailPresenterNotifier extends StateNotifier<UserDetailEntity?> {
  UserGetDetailPresenterNotifier(this.ref) : super(null);

  final Ref ref;

  handle() async {
    final usecase = ref.watch(userGetDetailUseCaseProvider);
    final input = ref.watch(userGetDetailInputProvider.notifier).state;
    state = usecase.handle(input).user;
  }
}

///
/// 詳細を取得するユーザー
///
final selectedUserProvider = StateProvider<UserEntity?>(((_) {
  return null;
}));

///
/// Usecase input data
///
final userGetDetailInputProvider = StateProvider<UserGetDetailInput>((ref) {
  final user = ref.watch(selectedUserProvider.notifier).state;
  return UserGetDetailInput(user!);
});

///
/// Use case
///
final userGetDetailUseCaseProvider = Provider<UserGetDetailUseCase>(((ref) {
  return UserGetDetailInteractor();
}));
