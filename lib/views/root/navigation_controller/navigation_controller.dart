import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ybm/views/events/event_screen.dart';
import 'package:ybm/views/home/home_screen.dart';
import 'package:ybm/views/my%20business/my_business_screen.dart';
import 'package:ybm/views/offers/offers.dart';
import 'package:ybm/views/search/search_screen.dart';

class NavigationController extends GetxController {
  RxInt index = 0.obs;

  List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
    const MyBusinessScreen(),
    const EventScreen(),
    const OffersScreen(),
  ];

  Widget get screen => screens[index.value];

  void goto(int value) {
    index.value = value;
    update();
  }
}
