import 'package:get/get.dart';
import 'package:ybm/core/routes/routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAllNamed(Routes.login);
    super.onInit();
  }
}
