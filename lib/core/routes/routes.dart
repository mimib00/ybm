import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:ybm/core/bindings.dart';
import 'package:ybm/views/splash/splash.dart';

class Routes {
  static const root = "/";
  static const splash = "/splash";
  static const login = "/login";

  static List<GetPage> allRoutes = [
    GetPage(name: root, page: () => const Scaffold()),
    GetPage(name: splash, page: () => const SplashScreen(), binding: SplashBinding()),
    GetPage(name: login, page: () => const Scaffold()),
  ];
}
