import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String name;
  String? iconPath;
  UserModel(this.name, this.iconPath);
}
