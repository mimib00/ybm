import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ybm/core/controllers/location_controller.dart';
import 'package:ybm/core/routes/routes.dart';
import 'package:ybm/meta/widgets/loading.dart';

class AuthController extends GetxController {
  final locationController = Get.find<LocationController>();

  final loginForm = GlobalKey<FormState>();
  final registerForm = GlobalKey<FormState>();
  final companyForm = GlobalKey<FormState>();

  final email = TextEditingController();
  final password = TextEditingController();

  final name = TextEditingController();
  final username = TextEditingController();
  final phone = TextEditingController();

  final businessName = TextEditingController();
  final businessDescription = TextEditingController();
  final businessAddress = TextEditingController();
  final businessCategory = TextEditingController();
  final tag = TextEditingController();
  final vat = TextEditingController();

  File? photo;

  Rx<LatLng?> location = Rx(null);

  RxSet<Marker> markers = <Marker>{}.obs;

  RxList<String> tags = <String>[].obs;

  RxList<File> photos = <File>[].obs;

  RxList<File> proof = <File>[].obs;

  Completer<GoogleMapController> mapController = Completer();
  CameraPosition get cameraPosition => CameraPosition(
        target: LatLng(
          locationController.locationData!.latitude!,
          locationController.locationData!.longitude!,
        ),
        zoom: 16,
      );

  void addPhotos(File image) {
    photos.add(image);
    update();
  }

  void removePhotos(File image) {
    photos.removeWhere((element) => element.path == image.path);
    update();
  }

  void addProof(File image) {
    proof.add(image);
    update();
  }

  void removeProof(File image) {
    proof.removeWhere((element) => element.path == image.path);
    update();
  }

  void addTag() {
    tags.add(tag.text.trim());
    tag.clear();
    update();
  }

  void removeTag(String name) {
    tags.removeWhere((element) => element == name);
    update();
  }

  void setPhoto(File image) => photo = image;

  void selectLocation(LatLng pos) async {
    final GoogleMapController map = await mapController.future;
    location.value = pos;
    markers.add(
      Marker(
        markerId: const MarkerId("Me"),
        position: pos,
      ),
    );
    map.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: pos, zoom: 16)));
    update();
  }

  Future<void> register() async {
    final storageRef = FirebaseStorage.instance.ref();
    try {
      Get.dialog(const Loading(message: "Creating Account"), barrierDismissible: false);
      // gather user data
      Map<String, dynamic> userData = {
        "created_at": FieldValue.serverTimestamp(),
        "name": name.text.trim(),
        "email": email.text.trim(),
        "phone": phone.text.trim(),
        "username": username.text.trim(),
      };
      Map<String, dynamic> businessData = {
        "created_at": FieldValue.serverTimestamp(),
        "business_name": businessName.text.trim(),
        "business_description": businessDescription.text.trim(),
        "business_address": businessAddress.text.trim(),
        "business_category": businessAddress.text.trim(),
        "business_image": null,
        "tags": tags,
        "location": GeoPoint(location.value!.latitude, location.value!.longitude),
        "vat": vat.text.trim(),
        "images": [],
        "proof": [],
      };
      // create user
      log({email.text.trim(), password.text.trim()}.toString());
      final UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );
      if (credential.user == null) return;

      final user = credential.user!;

      // add user data to firestore

      await FirebaseFirestore.instance.collection("users").doc(user.uid).set(userData);
      // add business to firestore
      final business =
          await FirebaseFirestore.instance.collection("users").doc(user.uid).collection("businesses").add(businessData);

      // upload company image
      final companySnapshot = await storageRef.child('business/${business.id}').putFile(
            photo!,
            SettableMetadata(
              contentType: "image/jpeg",
            ),
          );

      if (companySnapshot.state == TaskState.error || companySnapshot.state == TaskState.canceled) {
        throw "There was an error during upload";
      }

      // upload photos
      List<TaskSnapshot> photoTasks = [];

      for (var photo in photos) {
        final snapshot =
            await storageRef.child('business/${business.id}/photos/${DateTime.now().microsecondsSinceEpoch}').putFile(
                  photo,
                  SettableMetadata(
                    contentType: "image/jpeg",
                  ),
                );
        if (companySnapshot.state == TaskState.error || companySnapshot.state == TaskState.canceled) {
          throw "There was an error during upload";
        }
        photoTasks.add(snapshot);
      }

      // upload proof
      List<TaskSnapshot> proofTasks = [];

      for (var photo in proof) {
        final snapshot =
            await storageRef.child('business/${business.id}/proof/${DateTime.now().microsecondsSinceEpoch}').putFile(
                  photo,
                  SettableMetadata(
                    contentType: "image/jpeg",
                  ),
                );
        if (companySnapshot.state == TaskState.error || companySnapshot.state == TaskState.canceled) {
          throw "There was an error during upload";
        }
        proofTasks.add(snapshot);
      }

      // update user data
      final companyImage = await companySnapshot.ref.getDownloadURL();
      List<String> photosUrl = [];
      List<String> proofsUrl = [];
      for (var photo in photoTasks) {
        photosUrl.add(await photo.ref.getDownloadURL());
      }
      for (var photo in proofTasks) {
        proofsUrl.add(await photo.ref.getDownloadURL());
      }

      Map<String, dynamic> updateData = {
        "business_image": companyImage,
        "images": FieldValue.arrayUnion(photosUrl),
        "proof": FieldValue.arrayUnion(proofsUrl),
      };
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .collection("businesses")
          .doc(business.id)
          .update(updateData);
      // logout user
      await FirebaseAuth.instance.signOut();

      // send to login
      Get.back();
      Fluttertoast.showToast(msg: "Account created", backgroundColor: Colors.green);
      await Future.delayed(const Duration(seconds: 2));
      reset();
      Get.offAllNamed(Routes.login);
    } on FirebaseException catch (e) {
      Get.back();
      log(e.message.toString());
      Fluttertoast.showToast(msg: e.code, backgroundColor: Colors.red);
    }
  }

  void reset() {
    name.clear();
    email.clear();
    phone.clear();
    username.clear();
    businessName.clear();
    businessDescription.clear();
    businessAddress.clear();
    businessAddress.clear();
    tags.clear();
    photos.clear();
    proof.clear();
    password.clear();
    location.value = null;
  }
}
