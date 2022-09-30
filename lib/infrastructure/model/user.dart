class UserData {
  final String userId; // User id
  final DateTime createdAt; // 作成日
  final String name; // 名前

  UserData({
    required this.userId,
    required this.createdAt,
    required this.name,
  });
}

const String tableUsers = 'users';

class UserFields {
  static final List<String> values = [
    id,
    createdAt,
    name,
    icon,
    age,
    birthday,
    birthplace,
    residence,
    holiday,
    occupation,
    memo
  ];

  static const String id = "_id";
  static const String createdAt = "_createdAt";
  static const String name = "_name";
  static const String icon = "_icon";

  static const String age = "_age";
  static const String birthday = "_birthday";
  static const String birthplace = "_birthplace";
  static const String residence = "_residence";
  static const String holiday = "_holiday";
  static const String occupation = "_occupation";
  static const String memo = "_memo";
}

///
/// UserDBData
class User {
  final int? id; // User id
  final DateTime createdAt; // 作成日
  final String name; // 名前
  final String icon; // アイコンパス

  final int age; // 年齢
  final String birthday; // 誕生日
  final String birthplace; // 出身地
  final String residence; // 居住地
  final int holiday; // 休日
  final String occupation; // 職業
  final String memo; // メモ

  User({
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

  User copy({
    int? id,
    DateTime? createdAt,
    String? name,
    String? icon,
    int? age,
    String? birthday,
    String? birthplace,
    String? residence,
    int? holiday,
    String? occupation,
    String? memo,
  }) =>
      User(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        name: name ?? this.name,
        icon: icon ?? this.icon,
        age: age ?? this.age,
        birthday: birthday ?? this.birthday,
        birthplace: birthplace ?? this.birthplace,
        residence: residence ?? this.residence,
        holiday: holiday ?? this.holiday,
        occupation: occupation ?? this.occupation,
        memo: memo ?? this.memo,
      );

  static User fromJson(Map<String, Object?> json) => User(
        id: json[UserFields.id] as int,
        createdAt: DateTime.parse(json[UserFields.createdAt] as String),
        name: json[UserFields.name] as String,
        icon: json[UserFields.icon] as String,
        age: json[UserFields.age] as int,
        birthday: json[UserFields.birthday] as String,
        birthplace: json[UserFields.birthplace] as String,
        residence: json[UserFields.residence] as String,
        holiday: json[UserFields.holiday] as int,
        occupation: json[UserFields.occupation] as String,
        memo: json[UserFields.memo] as String,
      );

  Map<String, Object?> toJson() => {
        UserFields.id: id,
        UserFields.createdAt: createdAt.toIso8601String(),
        UserFields.name: name,
        UserFields.icon: icon,
        UserFields.age: age,
        UserFields.birthday: birthday,
        UserFields.birthplace: birthplace,
        UserFields.residence: residence,
        UserFields.holiday: holiday,
        UserFields.occupation: occupation,
        UserFields.memo: memo,
      };
}
