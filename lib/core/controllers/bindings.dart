import 'package:get/get.dart';
import 'package:ybm/views/root/navigation_controller/navigation_controller.dart';
import 'package:ybm/views/setup/controller/setup_controller.dart';
import 'package:ybm/views/splash/controller/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NavigationController());
  }
}

class SetupBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SetupController());
  }
}
