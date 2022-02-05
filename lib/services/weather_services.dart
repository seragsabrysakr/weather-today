import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:weather_today/models/weather_model.dart';

class Weather_Services {
  String baseurl = 'https://www.metaweather.com/';
  Future<int> getcityId({required String city}) async {
    Uri url = Uri.parse('$baseurl/api/location/search/?query=$city');
    http.Response response = await http.get(url);
    List<dynamic> jsondata = jsonDecode(response.body);
    int cityId = jsondata[0]['woeid'];
    return cityId;
  }

  Future<Weather_Model?> getweather({required String city}) async {
    Weather_Model? weatherdata;

    try {
      int id = await getcityId(city: city);
      Uri url = Uri.parse('$baseurl/api/location/$id/');
      http.Response response = await http.get(url);
      Map<String, dynamic> forcast = jsonDecode(response.body);
      Map<String, dynamic> data = forcast["consolidated_weather"][0];
      weatherdata = Weather_Model.fromjson(data);
    } catch (e) {
      print('Error is $e');
    }
    return weatherdata;
  }
}
