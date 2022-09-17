import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserData {
  final String userId; // User id
  final DateTime createdAt; // 作成日
  final String name; // 名前

  UserData({
    required this.userId,
    required this.createdAt,
    required this.name,
  });
}
