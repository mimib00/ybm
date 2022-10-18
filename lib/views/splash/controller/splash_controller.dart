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
        if (user != null) {
          await auth.getUserInfo();
          if (user.phoneNumber == null || user.phoneNumber!.isEmpty) {
            auth.confirmPhone();
            Get.offAllNamed(Routes.otp);
          } else if (!auth.user!.agreed) {
            Get.offAllNamed(Routes.terms);
          } else if (auth.user!.topics.isEmpty) {
            Get.offAllNamed(Routes.topics);
          } else if (auth.user!.filters.isEmpty) {
            Get.offAllNamed(Routes.filters);
          } else {
            Get.offAllNamed(Routes.root);
          }
        } else {
          Get.offAllNamed(Routes.login);
        }
      },
    );
    super.onInit();
  }
}
