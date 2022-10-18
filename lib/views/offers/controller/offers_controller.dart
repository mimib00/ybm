import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ybm/meta/models/offer.dart';
import 'package:ybm/meta/models/user.dart';
import 'package:ybm/views/auth/controller/auth_controller.dart';

class OffersController extends GetxController {
  final AuthController auth = Get.find();
  Users get user => auth.user!;

  CollectionReference<Offer> get offers => FirebaseFirestore.instance
      .collection("collectionPath")
      .doc(user.uid)
      .collection("businesses")
      .doc(user.businesses.first.id)
      .collection("offers")
      .withConverter(
        fromFirestore: (snapshot, options) => Offer.fromJson(
          {
            "id": snapshot.id,
            ...snapshot.data()!,
          },
        ),
        toFirestore: (value, options) => {},
      );
}
