import 'package:man_memo_v2/domain/entity/model/diary.dart';

import '../repositories/diaries_repository.dart';
import '../usecases/diaries_usecase.dart';

class DiariesInteractor implements DiariesUseCase {
  final DiariesRepository repository;

  DiariesInteractor(this.repository);

  @override
  Future<DiaryEntity> create(DiaryEntity diary) async {
    return await repository.create(diary);
  }

  @override
  Future<DiaryEntity> update(DiaryEntity diary) async {
    return await repository.create(diary);
  }

  @override
  Future<DiaryEntity> fetch(int id) {
    // TODO: implement fetch
    throw UnimplementedError();
  }

  @override
  Future<List<DiaryEntity>> fetchAll() async {
    return await repository.fetchAll();
  }
}
