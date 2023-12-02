import 'dart:convert';
import 'package:azkar_app/models/prayer_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

class PrayerService {
  static double pLat = 30.079694;
  static double pLong = 31.323437;
  //Data list;
  static Future<Data> getPrayerData() async {
    var locationPermissionStatus = await Permission.location.request();
    if (locationPermissionStatus.isGranted) {
      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.medium);
        pLat = position.latitude;
        pLong = position.longitude;
        String date = DateTime.now().toIso8601String();
        int method = 5;

        Uri url = Uri.parse(
            'http://api.aladhan.com/v1/timings/$date?latitude=$pLat&longitude=$pLong&method=$method'); // Replace with your API URL

        http.Response response = await http.get(url);

        if (response.statusCode == 200) {
          final jsonData = jsonDecode(response.body);
          return Data.fromJson(jsonData);
        } else {
          throw Exception('Failed to load prayer data');
        }
      } catch (e) {
        // Handle any exceptions that may occur while fetching data
        throw Exception('Failed to fetch prayer data: $e');
        
      }
    } else {
      // Handle permission denied or show an explanation to the user
      throw Exception('Location permission denied');
    }
  }
}
