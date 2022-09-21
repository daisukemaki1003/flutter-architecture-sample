import 'user.dart';

class UserDetailEntity {
  final UserEntity userBase;

  final int age; // 年齢
  final String birthday; // 誕生日
  final String birthplace; // 出身地
  final String residence; // 居住地
  final int holiday; // 休日
  final String occupation; // 職業
  final String memo; // メモ

  UserDetailEntity({
    required this.userBase,
    required this.age,
    required this.birthday,
    required this.birthplace,
    required this.residence,
    required this.holiday,
    required this.occupation,
    required this.memo,
  });
}
