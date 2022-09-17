import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/user_model.dart';
import '../presenter/users/user_get_list_presenter.dart';
import '../presenter/users/user_search_presenter.dart';

// https://qiita.com/tfandkusu/items/e6446008dee2ae375105

final userListStreamProvider = StreamProvider((ref) async* {
  yield UserFetchListPresenter().handle();
});

final userSearchPresenterProvder = Provider((ref) => UserSearchPresenter());

final listProvider = FutureProvider<List<UserModel>>((ref) async {
  final presenter = ref.read(userSearchPresenterProvder);
  return presenter.handle("te");
});

final userSearchResultsProvider = StateProvider<List<UserModel>>((ref) => []);
