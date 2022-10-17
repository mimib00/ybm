import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:ybm/core/routes/routes.dart';
import 'package:ybm/views/auth/controller/auth_controller.dart';

class SplashController extends GetxController {
  final AuthController auth = Get.find<AuthController>();
  @override
  void onInit() {
    FirebaseAuth.instance.authStateChanges().listen(
      (user) async {
        if (user != null && user.phoneNumber != null) {
          await auth.getUserInfo();
          Get.offAllNamed(Routes.root);
        } else {
          Get.offAllNamed(Routes.login);
        }
      },
    );
    super.onInit();
  }
}
