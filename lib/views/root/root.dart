import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:ybm/views/root/navigation_controller/navigation_controller.dart';

class RootScreen extends GetView<NavigationController> {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          body: controller.screen,
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedFontSize: 12,
            unselectedLabelStyle: GoogleFonts.nunito(fontSize: 10),
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black.withOpacity(0.5),
            currentIndex: controller.index.value,
            onTap: (value) => controller.goto(value),
            items: [
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/bottomHomeIcon.png',
                    height: 20,
                    width: 20,
                    fit: BoxFit.fill,
                    color: controller.index.value == 0 ? Colors.black : Colors.black.withOpacity(0.5),
                  ),
                  label: "Home"),
              const BottomNavigationBarItem(icon: Icon(Icons.search_rounded), label: "Search"),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/bottomBusinessIcon.png',
                    height: 25,
                    width: 25,
                    color: controller.index.value == 2 ? Colors.black : Colors.black.withOpacity(0.5),
                  ),
                  label: "My Business"),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/bottomEventsIcon.png',
                    height: 25,
                    width: 25,
                    color: controller.index.value == 3 ? Colors.black : Colors.black.withOpacity(0.5),
                  ),
                  label: "Events"),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/bottomSaleIcon.png',
                    height: 25,
                    width: 25,
                    color: controller.index.value == 4 ? Colors.black : Colors.black.withOpacity(0.5),
                  ),
                  label: "My offers"),
            ],
          ),
        );
      },
    );
  }
}
