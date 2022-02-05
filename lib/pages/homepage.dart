import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:weather_today/models/weather_model.dart';
import 'package:weather_today/pages/searchpage.dart';
import 'package:weather_today/providers/weather_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Weather_Model? weatherhome;
  @override
  Widget build(BuildContext context) {
    weatherhome =
        Provider.of<Weather_Provider>(context, listen: true).weatherdata;
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
                image: AssetImage('assets/back/${weatherhome!.State}.png'),
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
                'assets/states/${weatherhome!.State}.png',
                scale: 15,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Uppdate at :',
                      style:
                          const TextStyle(color: Colors.white, fontSize: 20)),
                  Text(
                    ' ${weatherhome!.date?.hour.toString()}:${weatherhome!.date?.minute.toString()}',
                    style: const TextStyle(color: Colors.blue, fontSize: 20),
                  ),
                ],
              ),
              Text(
                '${weatherhome!.date?.day.toString()}/${weatherhome!.date?.month.toString()}/${weatherhome!.date?.year.toString()}',
                style: TextStyle(color: Colors.blue.shade100, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ' ${weatherhome!.Temp?.roundToDouble()}  ',
                    style: const TextStyle(color: Colors.blue, fontSize: 20),
                  ),
                  Text('°C',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20))
                ],
              ),
              Text(
                '${Provider.of<Weather_Provider>(context, listen: false).weatherdata?.State}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: 'AbrilFatface-Regular',
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 100,
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        Text(
                          'Min Temp',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          '${Provider.of<Weather_Provider>(context, listen: false).weatherdata?.mintemp?.roundToDouble()}',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        Text(
                          'Max Temp',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          '${Provider.of<Weather_Provider>(context, listen: false).weatherdata?.maxtemp?.roundToDouble()}',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        Text(
                          'Wind speed',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          '${Provider.of<Weather_Provider>(context, listen: false).weatherdata?.wind?.roundToDouble()}',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
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
                    'search  🔍',
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
