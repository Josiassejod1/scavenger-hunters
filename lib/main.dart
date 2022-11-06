import 'package:dotenv/dotenv.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scavenger/components/home_screen.dart';
import 'package:scavenger/components/map_screen.dart';
import 'package:scavenger/state/home_controller.dart';

void main() {
  final homeController = Get.put(HomeController());

  runApp(GetMaterialApp(
    initialRoute: '/',
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Scavenger Hunter'),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: homeController.currentPage.value,
        onTap: (index) {
          homeController.updatePage(index);
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.map,
              color: Colors.red,
            ),
            label: 'Open Hunts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Camera',
          ),
        ],
      ),
      body: Obx(() => homeController.pages[homeController.currentPage.value]),
    ),
    // getPages: [
    //   GetPage(name: '/maps', page: () => MapScreen()),
    // ],
  ));
}
