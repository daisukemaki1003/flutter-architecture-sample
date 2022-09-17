import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../presenter/users/user_get_list_presenter.dart';

final userListStreamProvider = StreamProvider((ref) async* {
  yield UserFetchListPresenter().handle();
});

// StreamProviderの作成 (データを非同期で断続的に取得する)
final streamProvider = StreamProvider<dynamic>((ref) {
  Stream<dynamic> getNumbers() async* {
    await Future.delayed(const Duration(seconds: 1));
    yield 'Are You Ready?';

    await Future.delayed(const Duration(seconds: 1));
    yield 3;

    await Future.delayed(const Duration(seconds: 1));
    yield 2;

    await Future.delayed(const Duration(seconds: 1));
    yield 1;

    await Future.delayed(const Duration(seconds: 1));
    yield '';
  }

  return getNumbers();
});
