import 'package:man_memo_v2/domain/entity/model/diary.dart';

const String tableDiaries = 'diaries';

class DiaryFields {
  static final List<String> values = [
    id,
    createdAt,
    userIds,
    title,
    body,
  ];

  static const String id = "_id";
  static const String createdAt = "_createdAt";
  static const String userIds = "_userIds";
  static const String title = "_title";
  static const String body = "_body";
}

///
/// Diary data
class DiaryData {
  final int? id; // ID
  final DateTime createdAt; // 作成日
  final List<int> userIds; // 一緒に遊んだ友人のID
  final String title; // タイトル
  final String body; // 本文

  DiaryData({
    this.id,
    required this.createdAt,
    required this.userIds,
    required this.title,
    required this.body,
  });

  DiaryData copy({
    int? id,
    DateTime? createdAt,
    List<int>? userIds,
    String? title,
    String? body,
  }) =>
      DiaryData(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        userIds: userIds ?? this.userIds,
        title: title ?? this.title,
        body: body ?? this.body,
      );

  static DiaryData fromJson(Map<String, Object?> json) => DiaryData(
        id: json[DiaryFields.id] as int,
        createdAt: DateTime.parse(json[DiaryFields.createdAt] as String),
        userIds: json[DiaryFields.userIds] as List<int>,
        title: json[DiaryFields.title] as String,
        body: json[DiaryFields.body] as String,
      );

  Map<String, Object?> toJson() => {
        DiaryFields.id: id,
        DiaryFields.createdAt: createdAt.toIso8601String(),
        DiaryFields.userIds: userIds,
        DiaryFields.title: title,
        DiaryFields.body: body,
      };

  static DiaryData fromEntity(DiaryEntity entity) => DiaryData(
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
