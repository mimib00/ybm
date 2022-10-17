import 'package:cloud_firestore/cloud_firestore.dart';

class Business {
  final String id;
  final String name;
  final String description;
  final String address;
  final String photo;
  final List<String> photos;
  final Timestamp createdAt;
  final String vat;
  final List<String> tags;
  final GeoPoint location;

  Business(
    this.id,
    this.name,
    this.description,
    this.address,
    this.photo,
    this.photos,
    this.createdAt,
    this.vat,
    this.tags,
    this.location,
  );
  factory Business.fromJson(Map<String, dynamic> data) {
    return Business(
      data["id"],
      data["business_name"],
      data["business_description"],
      data["business_address"],
      data["business_image"],
      data["images"].cast<String>(),
      data["created_at"],
      data["vat"],
      data["tags"].cast<String>(),
      data["location"],
    );
  }
}
