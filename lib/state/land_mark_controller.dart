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
        tasks: [
           "Take a picture of a sea lion",
           "Take a picture of the ferris wheel",
           "Snap a picture of a ship"
        ],
        imageUrl:
            "https://bafybeiber25qv2uot5jqbywrqbgk36p3p3rx2wipb27g7bwpidjwq6eqtm.ipfs.nftstorage.link/",
        description: "Nice place with awesome views"),
    Landmark(
        name: 'Golden Gate Bridge',
        latitude: 37.818500,
        longitude: 122.478300,
        tasks: [
          "take a picture of the bridge",
          "take a picture of mountain"
        ],
        tag: "Ocean",
        imageUrl:
            "https://bafybeie2dw4hnnfnnto5zqovjxlog2cn4bvvd6dpfy6vqz4lugpa5t2ibm.ipfs.nftstorage.link/",
        description: "Nice place with awesome views"),
    Landmark(
        name: 'Palace of Fine Arts',
        latitude: 37.818500,
        longitude: 122.478300,
        tag: "Statue",
        tasks: [
          "take a picture of a statue"
        ],
        imageUrl:
            "https://bafkreif6yp4izfxrmxqspao4iwmfyyalv4cjqwod5amfv366qolgy5vciq.ipfs.nftstorage.link",
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
