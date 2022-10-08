import 'package:man_memo_v2/domain/interactor/meetings/meeting_fetch_list_interactor.dart';
import 'package:man_memo_v2/domain/usecases/meetings/fetch_list/meeting_fetch_list_usecase.dart';

import '../../../domain/usecases/meetings/fetch_list/meeting_fetch_list_input.dart';
import '../../../domain/usecases/meetings/fetch_list/meeting_fetch_list_output.dart';

class MeetingFetchListPresenter {
  final MeetingFetchListUseCase _usecase = MeetingFetchListInteractor();

  Future<MeetingFetchListOutput> handle() async {
    MeetingFetchListInput input = MeetingFetchListInput();
    return await _usecase.handle(input);
  }
}
