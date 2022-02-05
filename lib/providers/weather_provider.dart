import 'package:flutter/material.dart';
import 'package:weather_today/models/weather_model.dart';

class Weather_Provider extends ChangeNotifier {
  Weather_Model? _weatherdata;
  String? cityname;
  set weatherdata(Weather_Model? weather) {
    _weatherdata = weather;

    notifyListeners();
  }

  Weather_Model? get weatherdata => _weatherdata;
}
