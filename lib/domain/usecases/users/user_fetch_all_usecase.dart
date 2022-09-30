import 'package:man_memo_v2/domain/entity/model/user.dart';

import '../core/usecase.dart';

abstract class UserFetchAllUseCase implements UseCase<void, List<UserEntity>> {}
