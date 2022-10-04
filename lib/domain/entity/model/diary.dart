import 'package:man_memo_v2/domain/entity/model/user.dart';

class DiaryEntity {
  final int? id;
  final DateTime createdAt;
  final List<int> userIds;
  final String title;
  final String body;
  DiaryEntity({
    this.id,
    required this.createdAt,
    required this.userIds,
    required this.title,
    required this.body,
  });
}
