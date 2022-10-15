import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final loginForm = GlobalKey<FormState>();

  final email = TextEditingController();
  final password = TextEditingController();
}
