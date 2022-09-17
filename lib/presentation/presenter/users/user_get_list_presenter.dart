import '../../../domain/entity/model/user.dart';
import '../../../domain/stubs/users/user_get_list_interactor.dart';
import '../../../domain/usecases/users/fetch_list/user_fetch_list_input.dart';
import '../../../domain/usecases/users/fetch_list/user_fetch_list_output.dart';
import '../../../domain/usecases/users/fetch_list/user_fetch_list_usecase.dart';
import '../../model/user_model.dart';

class UserFetchListPresenter {
  final UserFetchListUseCase _usecase = UserFetchListInteractor();

  List<UserModel> handle() {
    UserFetchListInput input = UserFetchListInput();
    UserFetchListOutput output = _usecase.handle(input);
    return output.users.map((e) => translate(e)).toList();
  }

  /// Transformer
  UserModel translate(UserEntity userEntity) {
    return (UserModel(userEntity.name, userEntity.iconPath));
  }
}

// class UserFetchListPresenter {
//   final UserFetchListUseCase _usecase = UserFetchListInteractor();

//   Stream<List<UserModel>> handle() async* {
//     UserFetchListInput input = UserFetchListInput();
//     UserFetchListOutput output = _usecase.handle(input);
//     yield output.users.map((e) => translate(e)).toList();
//   }

//   /// Transformer
//   UserModel translate(UserEntity userEntity) {
//     return (UserModel(userEntity.name, userEntity.iconPath));
//   }
// }
