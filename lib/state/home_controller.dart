

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:scavenger/components/home_screen.dart';
import 'package:scavenger/components/map_screen.dart';

class HomeController extends GetxController {
   final List<Widget> pages = [
    HomeScreen(),
    const MapScreen()
  ];

  final Rx<int> currentPage = 0.obs;

  void updatePage(int value) {
    currentPage.value = value;
    currentPage.refresh();
  }
}