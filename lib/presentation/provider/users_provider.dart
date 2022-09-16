import '../../domain/usecases/users/user_get_list/user_get_list_output.dart';
import '../presenter/users/user_get_list_presenter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userListStreamProvider =
    StreamProvider.autoDispose<UserGetListOutput>((_) {
  return UserGetListPresenter().handle();
});
