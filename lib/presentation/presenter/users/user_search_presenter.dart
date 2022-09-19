import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/domain/stubs/users/user_search_interactor.dart';
import 'package:man_memo_v2/domain/usecases/users/search/user_search_input.dart';
import 'package:man_memo_v2/domain/usecases/users/search/user_search_usecase.dart';

import '../../../domain/entity/model/user.dart';
import '../../model/user_model.dart';

/// Provider
final userSearchPresenterProvider =
    FutureProvider.family<void, String>((ref, keyword) async {
  await UserSearchPresenter().handle(keyword);
});

class UserSearchPresenter {
  final UserSearchUseCase _usecase = UserSearchInteractor();

  Future<List<UserModel>> handle(String name) async {
    final input = UserSearchInput(name);
    final output = _usecase.handle(input);
    return output.users.map((e) => translate(e)).toList();
  }

  /// Transformer
  UserModel translate(UserEntity userEntity) {
    return (UserModel(userEntity.name, userEntity.iconPath));
  }
}
