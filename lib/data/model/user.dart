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
    /// Add all fields
    id, isImportant, number, title, description, time
  ];

  static const String id = '_id';
  static const String isImportant = 'isImportant';
  static const String number = 'number';
  static const String title = 'title';
  static const String description = 'description';
  static const String time = 'time';
}

class User {
  final int? id;
  final bool isImportant;
  final int number;
  final String title;
  final String description;
  final DateTime createdTime;

  const User({
    this.id,
    required this.isImportant,
    required this.number,
    required this.title,
    required this.description,
    required this.createdTime,
  });

  User copy({
    int? id,
    bool? isImportant,
    int? number,
    String? title,
    String? description,
    DateTime? createdTime,
  }) =>
      User(
        id: id ?? this.id,
        isImportant: isImportant ?? this.isImportant,
        number: number ?? this.number,
        title: title ?? this.title,
        description: description ?? this.description,
        createdTime: createdTime ?? this.createdTime,
      );

  static User fromJson(Map<String, Object?> json) => User(
        id: json[UserFields.id] as int?,
        isImportant: json[UserFields.isImportant] == 1,
        number: json[UserFields.number] as int,
        title: json[UserFields.title] as String,
        description: json[UserFields.description] as String,
        createdTime: DateTime.parse(json[UserFields.time] as String),
      );

  Map<String, Object?> toJson() => {
        UserFields.id: id,
        UserFields.title: title,
        UserFields.isImportant: isImportant ? 1 : 0,
        UserFields.number: number,
        UserFields.description: description,
        UserFields.time: createdTime.toIso8601String(),
      };
}