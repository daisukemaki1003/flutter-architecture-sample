import 'package:man_memo_v2/domain/usecases/core/usecase.dart';
import 'package:man_memo_v2/domain/usecases/users/get_detail/user_get_detail_input.dart';
import 'package:man_memo_v2/domain/usecases/users/get_detail/user_get_detail_output.dart';

abstract class UserGetDetailUseCase
    extends UseCase<UserGetDetailInput, UserGetDetailOutput> {}
