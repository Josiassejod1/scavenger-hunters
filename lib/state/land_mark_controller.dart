import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:scavenger/models/landmark.dart';

class LandMarkController extends GetxController {
  Location location = new Location();

  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _location;

  List<Landmark> landmarks = [
    Landmark(
        name: 'Pier 39',
        latitude: 37.809326,
        longitude: -122.409981,
        tag: "Ocean",
        imageUrl:
            "https://dl.airtable.com/.attachments/2d15eb877a38bde0a5ea167eca76bdb6/c8f15ee2/image-from-rawpixel-id-6075083-jpeg.jpg",
        description: "Nice place with awesome views"),
    Landmark(
        name: 'Golden Gate Bridge',
        latitude: 37.818500,
        longitude: 122.478300,
        tag: "Ocean",
        imageUrl:
            "https://dl.airtable.com/.attachments/e808629abaa22161120fd2597a900e3b/eb2974cd/image-from-rawpixel-id-3285711-jpeg.jpg",
        description: "Nice place with awesome views"),
    Landmark(
        name: 'Palace of Fine Arts',
        latitude: 37.818500,
        longitude: 122.478300,
        tag: "Statue",
        imageUrl:
            "https://dl.airtable.com/.attachments/e808629abaa22161120fd2597a900e3b/eb2974cd/image-from-rawpixel-id-3285711-jpeg.jpg",
        description: "See the beautiful statues at the palace")
  ];

  Rx<LatLng> currentLocation = LatLng(37.773972, -122.431297).obs;

  Future<LatLng?> getLocation() async {
    location.enableBackgroundMode(enable: true);

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    _location = await location.getLocation();

    if (_location.latitude != null && _location.longitude != null) {
      return currentLocation.value =
          LatLng(_location.latitude!, _location.latitude!);
    }

    location.onLocationChanged.listen((LocationData currentLocation) {
  // Use current location
});

    return currentLocation.value;
  }
}
