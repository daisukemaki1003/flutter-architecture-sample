import 'package:man_memo_v2/domain/entity/model/diary.dart';

abstract class DiariesUseCase {
  Future<DiaryEntity> create(DiaryEntity diary);
  Future<DiaryEntity> update(DiaryEntity diary);
  Future<DiaryEntity> fetch(int id);
  Future<List<DiaryEntity>> fetchAll();
}
