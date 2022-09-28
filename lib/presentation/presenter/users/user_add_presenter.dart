import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/domain/entity/model/user.dart';
import 'package:man_memo_v2/domain/usecases/users/add/user_add_output.dart';
import 'package:man_memo_v2/domain/usecases/users/add/user_add_usecase.dart';

import '../../../domain/interactor/users/user_add_interactor.dart';
import '../../../domain/usecases/users/add/user_add_input.dart';

///
/// Notifier provider
///
final userAddPresenterNotifierProvider =
    StateNotifierProvider<UserAddPresenterNotifier, UserEntity?>((ref) {
  return UserAddPresenterNotifier(ref);
});

///
/// Notifier
///
class UserAddPresenterNotifier extends StateNotifier<UserEntity?> {
  UserAddPresenterNotifier(this.ref) : super(null);

  final Ref ref;

  Future<UserAddOutput> handle() async {
    final usecase = ref.watch(userAddUseCaseProvider);
    final input = ref.watch(userAddInputProvider.notifier).state;
    return usecase.handle(input);
  }
}

///
/// 新規作成ユーザー
///
final newUserName = StateProvider<String>((_) {
  return "";
});

///
/// Usecase input data
///
final userAddInputProvider = StateProvider<UserAddInput>((ref) {
  final name = ref.watch(newUserName.notifier).state;
  return UserAddInput(name);
});

///
/// Use case
///
final userAddUseCaseProvider = Provider<UserAddUseCase>(((ref) {
  return UserAddInteractor();
}));
