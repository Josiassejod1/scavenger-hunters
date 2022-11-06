import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:scavenger/components/map_screen.dart';
import 'package:scavenger/components/scavenger_card.dart';
import 'package:scavenger/state/home_controller.dart';
import 'package:scavenger/state/land_mark_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LandMarkController());

    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return ScavengerCard(landmark: controller.landmarks[index]);
        });
  }
}
