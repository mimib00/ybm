import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:ybm/core/controllers/location_controller.dart';
import 'package:ybm/core/routes/routes.dart';
import 'package:ybm/firebase_options.dart';
import 'package:ybm/views/auth/controller/auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(LocationController(), permanent: true);
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
