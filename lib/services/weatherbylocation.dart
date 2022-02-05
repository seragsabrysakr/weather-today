import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_today/models/weather_model.dart';

class Getlocation {
  // Future<Position> _determinePosition() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;

  //   // Test if location services are enabled.
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     await Geolocator.openLocationSettings();
  //     return Future.error('Location services are disabled.');
  //   }

  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       return Future.error('Location permissions are denied');
  //     }
  //   }

  //   if (permission == LocationPermission.deniedForever) {
  //     // Permissions are denied forever, handle appropriately.
  //     return Future.error(
  //         'Location permissions are permanently denied, we cannot request permissions.');
  //   }

  //   // When we reach here, permissions are granted and we can
  //   // continue accessing the position of the device.
  //   return await Geolocator.getCurrentPosition();
  // }

  Future<int> getcity(
      {required double? longitude, required double? latitude}) async {
    Uri url = Uri.parse(
        'https://www.metaweather.com//api/location/search/?lattlong=${latitude},${longitude}');
    http.Response response = await http.get(url);
    List<dynamic> data = await jsonDecode(response.body);
    print(response.body);
    int cityId = data[0]["woeid"];
    print(cityId);

    return cityId;
  }

  Future<String> getcityname(Position position) async {
    int id = await getcity(
        latitude: position.latitude, longitude: position.longitude);
    Uri url = Uri.parse('https://www.metaweather.com//api/location/$id/');
    http.Response response = await http.get(url);
    Map<String, dynamic> jsondata = jsonDecode(response.body);
    String cityname = jsondata["title"];
    print(cityname);
    return cityname;
  }

  Future<Weather_Model?> getweather2(Position position) async {
    Weather_Model? weatherData;
    // Position position = await Geolocator.getCurrentPosition(
    //     desiredAccuracy: LocationAccuracy.high);

    try {
      int id = await getcity(
          latitude: position.latitude, longitude: position.longitude);
      Uri url = Uri.parse('https://www.metaweather.com//api/location/$id/');
      http.Response response = await http.get(url);
      Map<String, dynamic> jsondata = jsonDecode(response.body);
      Map<String, dynamic> data = jsondata["consolidated_weather"][0];

      weatherData = Weather_Model.fromjson(data);
    } catch (e) {
      print('Error is $e');
    }
    return weatherData;
  }
}
