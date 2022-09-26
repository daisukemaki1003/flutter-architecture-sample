import '../domain/entity/model/diary.dart';
import '../domain/entity/model/user.dart';
import '../domain/entity/model/user_detail.dart';
import '../views/models/diary.dart';
import '../views/models/user.dart';
import '../views/models/user_detail.dart';

/// Transformer
class Transformer {
  /// User
  UserEntity userModelToUserEntity(UserModel userModel) {
    return (UserEntity(userModel.userId, userModel.createdAt, userModel.name));
  }

  UserModel userEntityToUserModel(UserEntity userEntity) {
    return (UserModel(userEntity.userId, userEntity.name, userEntity.iconPath,
        userEntity.createdAt));
  }

  UserDetailModel userDetailEntityToUserDetailModel(
      UserDetailEntity userDetailEntity) {
    final userModel = userDetailEntity.userBase;
    final userDetailModel = UserDetailModel(
      userBase: userEntityToUserModel(userModel),
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

  /// Diary
  Diary diaryEntityToDiaryModel(DiaryEntity diaryEntity) {
    final diaryList = Diary(
      createdAt: diaryEntity.createdAt,
      users: diaryEntity.users.map((e) => userEntityToUserModel(e)).toList(),
      content: diaryEntity.title + diaryEntity.body,
    );
    return diaryList;
  }
}
