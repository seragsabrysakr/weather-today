import 'package:flutter/material.dart';
import 'dart:convert';

class Weather_Model {
  String? State;
  double? Temp;
  DateTime? date;
  double? wind;
  double? mintemp;
  double? maxtemp;
  Weather_Model({
    required this.State,
    required this.Temp,
    required this.date,
    required this.wind,
    required this.mintemp,
    required this.maxtemp,
  });
  factory Weather_Model.fromjson(Map<String, dynamic> jsondata) {
    return Weather_Model(
        State: jsondata["weather_state_name"].replaceAll(' ', '').toLowerCase(),
        Temp: jsondata["the_temp"],
        date: DateTime.parse(jsondata["created"]),
        maxtemp: jsondata["max_temp"],
        mintemp: jsondata["min_temp"],
        wind: jsondata["wind_speed"]);
  }
}
