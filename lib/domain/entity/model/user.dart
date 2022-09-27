class UserEntity {
  final String userId;
  final DateTime createdAt;

  final String name;
  String? iconPath;

  UserEntity(
    this.userId,
    this.createdAt,
    this.name,
  );
}
