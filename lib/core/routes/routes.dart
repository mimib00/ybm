import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:ybm/core/controllers/bindings.dart';
import 'package:ybm/views/auth/company_profile.dart';
import 'package:ybm/views/auth/login.dart';
import 'package:ybm/views/auth/register.dart';
import 'package:ybm/views/root/root.dart';
import 'package:ybm/views/splash/splash.dart';

class Routes {
  static const root = "/";
  static const splash = "/splash";
  static const login = "/login";
  static const register = "/register";
  static const company = "/register/company";
  static const forgetPassword = "/forget_password";

  static List<GetPage> allRoutes = [
    GetPage(name: root, page: () => const RootScreen(), binding: NavigationBinding()),
    GetPage(name: splash, page: () => const SplashScreen(), binding: SplashBinding()),
    GetPage(name: login, page: () => const LoginScreen()),
    GetPage(name: register, page: () => const RegisterScreen()),
    GetPage(name: company, page: () => const CompanyProfile()),
    GetPage(name: forgetPassword, page: () => const Scaffold()),
  ];
}
