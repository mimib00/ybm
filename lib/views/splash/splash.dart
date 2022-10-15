import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ybm/meta/utils/math_utils.dart';
import 'package:ybm/views/splash/controller/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/groupLogo.png',
          height: getVerticalSize(88),
          width: getHorizontalSize(173.76),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
