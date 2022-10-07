import '../../../domain/entity/enum/occupation.dart';
import '../../../domain/entity/enum/prefectures.dart';
import '../../../domain/entity/model/holiday.dart';
import '../../../domain/entity/model/user.dart';

class UserModel {
  final int? id;
  final DateTime createdAt; // 作成日
  final String name;
  final String icon; // アイコンパス

  final int age; // 年齢
  final String birthday; // 誕生日
  final PrefecturesEnum birthplace; // 出身地
  final PrefecturesEnum residence; // 居住地
  final Holiday holiday; // 休日
  final OccupatioEenum occupation; // 職業
  final String memo; // メモ
  UserModel({
    this.id,
    required this.createdAt,
    required this.icon,
    required this.age,
    required this.birthday,
    required this.birthplace,
    required this.residence,
    required this.holiday,
    required this.occupation,
    required this.memo,
    required this.name,
  });

  static UserModel fromEntity(UserEntity entity) => UserModel(
        id: entity.id,
        createdAt: entity.createdAt,
        name: entity.name,
        icon: entity.icon,
        age: entity.age,
        birthday: entity.birthday,
        birthplace: entity.birthplace,
        residence: entity.residence,
        holiday: entity.holiday,
        occupation: entity.occupation,
        memo: entity.memo,
      );

  UserEntity toEntity() => UserEntity(
        id: id,
        createdAt: createdAt,
        name: name,
        icon: icon,
        age: age,
        birthday: birthday,
        birthplace: birthplace,
        residence: residence,
        holiday: holiday,
        occupation: occupation,
        memo: memo,
      );
}
