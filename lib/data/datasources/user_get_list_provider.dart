import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod/riverpod.dart';

import '../model/user.dart';

// final userGetListProvider = StreamProvider<List<User>?>((ref) async* {
//   try {
//     final snapshot = await FirebaseFirestore.instance
//         .collection('user_apps')
//         .orderBy('releasedAt', descending: true)
//         .get();
//     yield snapshot.docs.map((e) => User.doc(e)).toList();
//   } catch (e) {
//     print(e);
//     yield null;
//   }
// });
