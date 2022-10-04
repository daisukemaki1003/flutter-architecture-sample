import 'package:man_memo_v2/domain/entity/model/diary.dart';

import '../../domain/repositories/diaries_repository.dart';
import '../datasources/diaries_datasource.dart';
import '../datasources/users_datasource.dart';
import '../models/diary.dart';

class DiariesRepositoryImpl implements DiariesRepository {
  final DiariesDatabase database;

  DiariesRepositoryImpl(this.database);

  @override
  Future<DiaryEntity> create(DiaryEntity diary) async {
    final createdDiary = await database.create(DiaryData.fromEntity(diary));
    return createdDiary.toEntity();
  }

  @override
  Future<DiaryEntity> get(int id) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<List<DiaryEntity>> fetchAll() async {
    final diaries = await database.readAllDiaries();
    return diaries.map((e) => e.toEntity()).toList();
  }
}
