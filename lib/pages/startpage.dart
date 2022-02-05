import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:weather_today/models/weather_model.dart';
import 'package:weather_today/pages/homepage.dart';
import 'package:weather_today/pages/searchpage.dart';
import 'package:weather_today/providers/weather_provider.dart';
import 'package:weather_today/services/weatherbylocation.dart';

class Startpage extends StatefulWidget {
  const Startpage({Key? key}) : super(key: key);

  @override
  State<Startpage> createState() => _StartpageState();
}

class _StartpageState extends State<Startpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue[50],
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Weather Today',
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontFamily: 'AbrilFatface-Regular',
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                height: 300,
                width: double.infinity,
                child: const FlareActor(
                  'assets/WorldSpin.flr',
                  animation: 'roll',
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Text(
                      'There Is No Weather 😔 Start',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      '--OR--',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      ' Wrong City 😡 ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Searchpage()));
                      },
                      child: const Text(
                        'Weather By City 🔍',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () async {
                        Position position = await Geolocator.getCurrentPosition(
                            desiredAccuracy: LocationAccuracy.high);
                        Getlocation locat = Getlocation();
                        String? city = await locat.getcityname(position);

                        Weather_Model? weatherdata =
                            await locat.getweather2(position);

                        Provider.of<Weather_Provider>(context, listen: false)
                            .weatherdata = weatherdata;
                        Provider.of<Weather_Provider>(context, listen: false)
                            .cityname = city;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      child: const Text(
                        'Weather By your location 🗺️',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      ' By Serag sakr',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blueAccent,
                          fontFamily: 'AbrilFatface-Regular',
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
