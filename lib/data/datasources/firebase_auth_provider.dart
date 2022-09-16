import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod/riverpod.dart';

final firebaseAuthProvider =
    StateProvider<FirebaseAuth>((ref) => FirebaseAuth.instance);
