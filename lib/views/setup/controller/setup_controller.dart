import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ybm/views/auth/controller/auth_controller.dart';

class SetupController extends GetxController {
  final AuthController auth = Get.find();
  RxList<String> topics = <String>[].obs;

  RxList<String> filters = <String>[].obs;
  RxList<String> ratings = <String>[].obs;

  void selectTopic(String value) {
    if (topics.contains(value)) {
      topics.removeWhere((element) => element == value);
    } else {
      topics.add(value);
    }
    update();
  }

  void selectFilter(String value) {
    if (filters.contains(value)) {
      filters.removeWhere((element) => element == value);
    } else {
      filters.add(value);
    }
    update();
  }

  void selectRating(String value) {
    if (ratings.contains(value)) {
      ratings.removeWhere((element) => element == value);
    } else {
      ratings.add(value);
    }
    update();
  }

  Future<void> saveTopics() async {
    await auth.updateUser({"topics": FieldValue.arrayUnion(topics)});
  }

  Future<void> saveFilters() async {
    await auth.updateUser(
      {
        "filters": FieldValue.arrayUnion(filters),
        "ratings": FieldValue.arrayUnion(ratings),
      },
    );
  }
}
