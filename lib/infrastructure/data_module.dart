import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/infrastructure/repositories/diaries_repository.dart';
import 'package:man_memo_v2/infrastructure/repositories/users_repository.dart';

import '../domain/repositories/diaries_repository.dart';
import '../domain/repositories/users_repository.dart';
import 'datasources/diaries_datasource.dart';
import 'datasources/users_datasource.dart';

///
/// Users
final usersDatabaseProvider = Provider((_) {
  return UsersDatabase.instance;
});

final usersRepositoryProvider = Provider<UsersRepository>((ref) {
  return UsersRepositoryImpl(ref.watch(usersDatabaseProvider));
});

///
/// Diary
final diariesDatabaseProvider = Provider((_) {
  return DiariesDatabase.instance;
});

final diariesRepositoryProvider = Provider<DiariesRepository>((ref) {
  return DiariesRepositoryImpl(ref.watch(diariesDatabaseProvider));
});
