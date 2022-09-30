import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/infrastructure/repositories/users_repository.dart';

import '../domain/i_repositories/users_repository.dart';
import 'datasources/users_datasource.dart';

final usersDatabaseProvider = Provider((_) => UsersDatabase.instance);
final usersRepositoryProvider = Provider<UsersRepository>((ref) {
  return UsersRepositoryImpl(
      ref.watch(usersDatabaseProvider), UsersDataSource());
});
