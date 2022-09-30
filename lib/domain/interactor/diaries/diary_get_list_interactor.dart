import 'package:man_memo_v2/infrastructure/repositories/diaries_repository.dart';
import 'package:man_memo_v2/domain/entity/model/diary.dart';
import 'package:man_memo_v2/domain/i_repositories/diaries_repository.dart';

import '../../../infrastructure/models/diary.dart';
import '../../../infrastructure/models/user.dart';
import '../../entity/model/user.dart';
import '../../usecases/diaries/diary_get_list/diary_get_list_input.dart';
import '../../usecases/diaries/diary_get_list/diary_get_list_output.dart';
import '../../usecases/diaries/diary_get_list/diary_get_list_usecase.dart';

class DiaryGetListInteractor implements DiaryGetListUseCase {
  DiariesRepository diaryRepository = DiariesRepositoryImpl();

  @override
  handle(DiaryGetListInput input) async {
    return DiaryGetListOutput([]);
  }
}
