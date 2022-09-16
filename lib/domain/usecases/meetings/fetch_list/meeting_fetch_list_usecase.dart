import 'package:man_memo_v2/domain/usecases/core/usecase.dart';
import 'package:man_memo_v2/domain/usecases/meetings/fetch_list/meeting_fetch_list_input.dart';
import 'package:man_memo_v2/domain/usecases/meetings/fetch_list/meeting_fetch_list_output.dart';

abstract class MeetingFetchListUseCase
    implements UseCase<MeetingFetchListInput, MeetingFetchListOutput> {}
