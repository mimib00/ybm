import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:ybm/core/routes/routes.dart';
import 'package:ybm/views/auth/controller/auth_controller.dart';

void main() {
  Get.put(AuthController(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, _, __) {
        return GetMaterialApp(
          title: 'YBM',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(scaffoldBackgroundColor: Colors.white),
          initialRoute: Routes.splash,
          getPages: Routes.allRoutes,
        );
      },
    );
  }
}
