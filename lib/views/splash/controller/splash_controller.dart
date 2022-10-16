import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:ybm/core/routes/routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    FirebaseAuth.instance.authStateChanges().listen(
      (user) {
        if (user != null) {
          if (user.phoneNumber != null) {
            Get.offAllNamed(Routes.root);
          } else {
            Get.offAllNamed(Routes.login);
          }
        } else {
          Get.offAllNamed(Routes.login);
        }
      },
    );
    super.onInit();
  }
}
