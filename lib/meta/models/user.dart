import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ybm/meta/models/business.dart';

class Users {
  final String uid;
  final String name;
  final String username;
  final String email;
  final String phone;
  final List<Business> businesses;
  final Timestamp createdAt;
  final bool agreed;
  final List<String> filters;
  final List<String> topics;

  Users(
    this.uid,
    this.name,
    this.username,
    this.email,
    this.phone,
    this.businesses,
    this.createdAt,
    this.agreed,
    this.filters,
    this.topics,
  );

  factory Users.fromJason(Map<String, dynamic> data, List<Business> businesses) {
    return Users(
      data["uid"],
      data["name"],
      data["username"],
      data["email"],
      data["phone"],
      businesses,
      data["created_at"],
      data["agreed"] ?? false,
      data["filters"] == null ? [] : data["filters"].cast<String>(),
      data["topics"] == null ? [] : data["topics"].cast<String>(),
    );
  }
}
