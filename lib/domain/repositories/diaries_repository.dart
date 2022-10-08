import 'package:man_memo_v2/domain/entity/model/diary.dart';

abstract class DiariesRepository {
  Future<DiaryEntity> create(DiaryEntity diary);
  Future<DiaryEntity> get(int id);
  Future<List<DiaryEntity>> fetchAll();
}
