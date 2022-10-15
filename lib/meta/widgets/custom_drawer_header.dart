import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ybm/meta/utils/constants.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
        gradient: gradientColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              size: 25,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Center(
            child: Image.asset(
              'assets/images/drawerLogoYBM.png',
              height: 104,
              width: 228,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
