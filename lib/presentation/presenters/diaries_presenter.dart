import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/domain_module.dart';
import '../../domain/usecases/diaries_usecase.dart';
import '../providers/diaries/diary_model.dart';

final diariesPresenterProvider = Provider((ref) {
  return DiariesPresenter(
    ref,
    ref.watch(diariesUseCaseProvider),
  );
});

class DiariesPresenter {
  final Ref ref;

  final DiariesUseCase _usecase;

  DiariesPresenter(
    this.ref,
    this._usecase,
  );

  Future<DiaryModel> create(DiaryModel diary) async {
    final entity = await _usecase.create(diary.toEntity());
    return DiaryModel.fromEntity(entity);
  }

  Future<DiaryModel> update(DiaryModel diary) async {
    final entity = await _usecase.update(diary.toEntity());
    return DiaryModel.fromEntity(entity);
  }

  fetch(int id) async {}

  Future<List<DiaryModel>> fetchAll() async {
    final diaryEntities = await _usecase.fetchAll();
    return diaryEntities.map((e) => DiaryModel.fromEntity(e)).toList();
  }
}
