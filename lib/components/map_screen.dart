import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:scavenger/components/scavenger_card.dart';
import 'package:scavenger/state/land_mark_controller.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LandMarkController());
    final mapController = MapController();

    return FutureBuilder<LatLng?>(
      future: controller.getLocation(),
      initialData: controller.currentLocation.value,
      builder: ((context, snapshot) {
      return FlutterMap(
        mapController: mapController,
        options: MapOptions(
            zoom: 9.2,
            center: snapshot.data.obs.value,
            onMapReady: () {
              controller.getLocation();
            }),
        nonRotatedChildren: [
          AttributionWidget(
              attributionBuilder: (context) {
                return SizedBox(
                  height: 300,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return ScavengerCard(
                            landmark: controller.landmarks[index]);
                      }),
                );
              },
              alignment: Alignment.bottomCenter),
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
          MarkerLayer(
            markers: controller.landmarks
                .map((e) => Marker(
                      point: LatLng(e.latitude, e.longitude),
                      height: 80,
                      width: 80,
                      builder: (context) => Icon(Icons.star),
                    ))
                .toList(),
          )
        ],
      );
    }));
  }
}
