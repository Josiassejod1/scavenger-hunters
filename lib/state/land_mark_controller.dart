import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:scavenger/models/landmark.dart';

class LandMarkController extends GetxController {
  List<Landmark> landmarks = [
    Landmark(name: 'Pier 39', latitude: 	37.809326, longitude: -122.409981, tag: "Ocean", imageUrl: "https://dl.airtable.com/.attachments/2d15eb877a38bde0a5ea167eca76bdb6/c8f15ee2/image-from-rawpixel-id-6075083-jpeg.jpg", description: "Nice place with awesome views"),
    Landmark(name: 'Golden Gate Bridge', latitude: 37.818500, longitude: 122.478300, tag: "Ocean", imageUrl: "https://dl.airtable.com/.attachments/e808629abaa22161120fd2597a900e3b/eb2974cd/image-from-rawpixel-id-3285711-jpeg.jpg", description: "Nice place with awesome views"),
    Landmark(name: 'Palace of Fine Arts', latitude: 	37.818500, longitude:122.478300, tag: "Statue", imageUrl: "https://dl.airtable.com/.attachments/e808629abaa22161120fd2597a900e3b/eb2974cd/image-from-rawpixel-id-3285711-jpeg.jpg", description: "See the beautiful statues at the palace")
  ];
}