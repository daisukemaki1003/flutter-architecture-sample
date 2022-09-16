import '../../domain/usecases/users/fetch_list/user_fetch_list_output.dart';
import '../presenter/users/user_get_list_presenter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userListStreamProvider =
    StreamProvider.autoDispose<UserFetchListOutput>((_) {
  return UserFetchListPresenter().handle();
});
