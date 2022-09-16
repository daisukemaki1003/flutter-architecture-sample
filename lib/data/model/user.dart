import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  final String userId; // User id
  // final Timestamp createdAt; // 作成日
  final String name; // 名前

  UserData._({
    required this.userId,
    required this.name,
    // required this.createdAt,
  });

  // factory User.doc(DocumentSnapshot doc,
  //     {required Timestamp createdAt,
  //     required String name,
  //     required String userId}) {
  //   final data = doc.data() as Map;
  //   return User._(
  //     // userId: doc.id,
  //     // createdAt: data["createdAt"],
  //     // name: data["name"],
  //     userId: userId,
  //     createdAt: createdAt,
  //     name: name,
  //   );
  factory UserData.doc({
    // required Timestamp createdAt,
    required String name,
    required String userId,
  }) {
    return UserData._(
      userId: userId,
      // createdAt: createdAt,
      name: name,
    );
  }
}
