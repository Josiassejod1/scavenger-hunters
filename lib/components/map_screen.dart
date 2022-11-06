import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:scavenger/components/scavenger_card.dart';
import 'package:scavenger/state/land_mark_controller.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LandMarkController());
    return FlutterMap(
      options: MapOptions(
        zoom: 9.2,
      ),
      nonRotatedChildren: [
        AttributionWidget(attributionBuilder: (context) {
          return SizedBox(
            height: 300,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ScavengerCard(landmark: controller.landmarks[index]);
                }),
          );
        }, alignment:  Alignment.bottomCenter),
        AttributionWidget.defaultWidget(
          source: 'OpenStreetMap contributors',
          onSourceTapped: null,
        ),
      ],
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
      ],
    );
  }
}
