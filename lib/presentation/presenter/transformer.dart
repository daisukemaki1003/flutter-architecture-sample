import '../../domain/entity/model/user.dart';
import '../../domain/entity/model/user_detail.dart';
import '../model/user.dart';
import '../model/user_detail.dart';

/// Transformer

UserEntity translateUserModelToUserEntity(UserModel userModel) {
  return (UserEntity(userModel.createdAt, userModel.name));
}

UserModel translateUserEntityToUserModel(UserEntity userEntity) {
  return (UserModel(
      userEntity.name, userEntity.iconPath, userEntity.createdAt));
}

UserDetailModel translateUserDetailEntityToUserDetailModel(
    UserDetailEntity userDetailEntity) {
  final userBase = userDetailEntity.userBase;
  final userDetailModel = UserDetailModel(
    userBase: UserModel(userBase.name, userBase.iconPath, userBase.createdAt),
    age: userDetailEntity.age,
    birthday: userDetailEntity.birthday,
    birthplace: userDetailEntity.birthplace,
    residence: userDetailEntity.residence,
    holiday: userDetailEntity.holiday,
    occupation: userDetailEntity.occupation,
    memo: userDetailEntity.memo,
  );
  return userDetailModel;
}
