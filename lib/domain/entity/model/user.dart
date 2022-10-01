import '../enum/occupation.dart';
import '../enum/prefectures.dart';

class UserEntity {
  final int? id; // User id
  final DateTime createdAt; // 作成日
  final String name; // 名前
  final String icon; // アイコンパス

  final int age; // 年齢
  final String birthday; // 誕生日
  final PrefecturesEnum birthplace; // 出身地
  final PrefecturesEnum residence; // 居住地
  final int holiday; // 休日
  final OccupatioEenum occupation; // 職業
  final String memo; // メモ

  UserEntity({
    this.id,
    required this.createdAt,
    required this.name,
    required this.icon,
    required this.age,
    required this.birthday,
    required this.birthplace,
    required this.residence,
    required this.holiday,
    required this.occupation,
    required this.memo,
  });
}
