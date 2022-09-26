class UserEntity {
  String userId;
  DateTime createdAt;

  final String name;
  String? iconPath;

  UserEntity(
    this.userId,
    this.createdAt,
    this.name,
  );
}
