import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_today/models/weather_model.dart';
import 'package:weather_today/pages/homepage.dart';
import 'package:weather_today/pages/startpage.dart';
import 'package:weather_today/providers/weather_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => Weather_Provider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  Weather_Model? weatherhome;
  @override
  Widget build(BuildContext context) {
    weatherhome = Provider.of<Weather_Provider>(context).weatherdata;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: weatherhome == null ? Startpage() : HomePage(),
    );
  }
}
