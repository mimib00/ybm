import 'package:cloud_firestore/cloud_firestore.dart';

class Offer {
  final String id;
  final String title;
  final String description;
  final String photo;
  final int discount;
  final Timestamp start;
  final Timestamp end;

  Offer(
    this.id,
    this.title,
    this.photo,
    this.description,
    this.discount,
    this.start,
    this.end,
  );
  factory Offer.fromJson(Map<String, dynamic> data) {
    return Offer(
      data["id"],
      data["title"],
      data["photo"],
      data["description"],
      data["discount"],
      data["start"],
      data["end"],
    );
  }
}
