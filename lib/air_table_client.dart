import 'package:dart_airtable/dart_airtable.dart';
import 'package:dotenv/dotenv.dart';

class AirTableClient {
  static AirTableClient? _instance;

  AirTableClient._();

  static AirTableClient get instance => _instance ??= AirTableClient._();

  Airtable client() {
   // var env = DotEnv(includePlatformEnvironment: false)..load();
    final apiKey = "keyTNQ08QhLAohjM8";

    if (apiKey == null) {
      throw ("This api key not loaded");
    }
    const projectBase = 'Landmark';
    final airtable = Airtable(apiKey: apiKey, projectBase: projectBase);
    return airtable;
  }
}
