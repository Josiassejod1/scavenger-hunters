class Landmark {
  String name;
  double latitude;
  double longitude;
  String description;
  String tag;
  String imageUrl;
  List<String> tasks;

  Landmark({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.tag,
    required this.imageUrl,
    required this.description, 
    required this.tasks
  });
}
