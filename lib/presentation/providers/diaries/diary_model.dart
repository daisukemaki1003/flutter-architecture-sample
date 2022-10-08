import 'package:man_memo_v2/domain/entity/model/diary.dart';

class DiaryModel {
  final int? id;
  final DateTime createdAt;
  final List<int> userIds;
  final String title;
  final String body;

  DiaryModel({
    this.id,
    required this.createdAt,
    required this.userIds,
    required this.title,
    required this.body,
  });

  DiaryModel copy({
    int? id,
    DateTime? createdAt,
    List<int>? userIds,
    String? title,
    String? body,
  }) =>
      DiaryModel(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        userIds: userIds ?? this.userIds,
        title: title ?? this.title,
        body: body ?? this.body,
      );

  static DiaryModel fromEntity(DiaryEntity entity) => DiaryModel(
        id: entity.id,
        createdAt: entity.createdAt,
        userIds: entity.userIds,
        title: entity.title,
        body: entity.body,
      );

  DiaryEntity toEntity() => DiaryEntity(
        id: id,
        createdAt: createdAt,
        userIds: userIds,
        title: title,
        body: body,
      );
}
