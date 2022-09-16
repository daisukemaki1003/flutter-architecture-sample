import 'package:cloud_firestore/cloud_firestore.dart';

class DiaryData {
  DateTime createdAt;
  List<String> names;
  String body;
  DiaryData(this.createdAt, this.names, this.body);
}
