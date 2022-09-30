import '../../entity/model/user.dart';
import '../core/usecase.dart';

abstract class UserSearchUseCase implements UseCase<String, List<UserEntity>> {}
