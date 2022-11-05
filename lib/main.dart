import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scavenger/components/home_screen.dart';
import 'package:scavenger/components/map_screen.dart';

void main() {
  runApp(
      GetMaterialApp(
      initialRoute: '/',
      home: HomeScreen(),
      getPages: [
        GetPage(name: '/maps', page: () =>  MapScreen()),
      ],
    )
  );
}
