import '../../core/usecase.dart';
import '../get_list/user_get_list_output.dart';
import 'user_get_list_input.dart';

abstract class UserGetListUseCase
    implements UseCase<UserGetListInput, UserGetListOutput> {}
