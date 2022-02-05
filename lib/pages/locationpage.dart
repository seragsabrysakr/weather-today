import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_today/models/weather_model.dart';
import 'package:weather_today/pages/searchpage.dart';
import 'package:weather_today/providers/weather_provider.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Weather_Model? weatherlocation;

  @override
  Widget build(BuildContext context) {
    weatherlocation = Provider.of<Weather_Provider>(context).weatherdata;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent, // 1
        elevation: 0, // 2
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/back/${weatherlocation!.State}.png'),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: double.infinity,
                height: 30,
              ),
              Image.asset(
                'assets/states/${weatherlocation!.State}.png',
                scale: 10,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                '${Provider.of<Weather_Provider>(context).cityname}',
                style: const TextStyle(
                    fontFamily: 'Lobster-Regular',
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Uppdate at : ${weatherlocation!.date?.hour.toString()}:${weatherlocation!.date?.minute.toString()}',
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                '${weatherlocation!.date?.day.toString()}/${weatherlocation!.date?.month.toString()}/${weatherlocation!.date?.year.toString()}',
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                ' ${weatherlocation!.Temp?.roundToDouble()}  °C',
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                '${Provider.of<Weather_Provider>(context, listen: false).weatherdata?.State}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: 'AbrilFatface-Regular',
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Searchpage()));
                  },
                  child: Text(
                    'search By city🔍',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
