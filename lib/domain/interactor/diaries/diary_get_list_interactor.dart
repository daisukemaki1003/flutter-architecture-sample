import 'package:man_memo_v2/infrastructure/repositories/diaries_repository.dart';
import 'package:man_memo_v2/domain/entity/model/diary.dart';
import 'package:man_memo_v2/domain/i_repositories/diaries_repository.dart';

import '../../../infrastructure/model/diary.dart';
import '../../../infrastructure/model/user.dart';
import '../../entity/model/user.dart';
import '../../usecases/diaries/diary_get_list/diary_get_list_input.dart';
import '../../usecases/diaries/diary_get_list/diary_get_list_output.dart';
import '../../usecases/diaries/diary_get_list/diary_get_list_usecase.dart';

class DiaryGetListInteractor implements DiaryGetListUseCase {
  DiariesRepository diaryRepository = DiariesRepositoryImpl();

  @override
  DiaryGetListOutput handle(DiaryGetListInput input) {
    List<DiaryData> diaryDataList = diaryRepository.getDiaryList();
    List<DiaryEntity> diaryEntityList =
        diaryDataList.map((diary) => translate(diary)).toList();
    return DiaryGetListOutput(diaryEntityList);
  }

  /// Transformer
  DiaryEntity translate(DiaryData diary) {
    return DiaryEntity(
      diary.createdAt,
      diary.users.map((e) => translateUserEntity(e)).toList(),
      "",
      diary.body,
    );
  }

  /// Transformer
  UserEntity translateUserEntity(UserData userData) {
    return UserEntity(userData.userId, userData.createdAt, userData.name);
  }
}
