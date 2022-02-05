import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:weather_today/models/weather_model.dart';
import 'package:weather_today/pages/homepage.dart';
import 'package:weather_today/pages/startpage.dart';
import 'package:weather_today/providers/weather_provider.dart';
import 'package:weather_today/services/weather_services.dart';
import 'package:weather_today/services/weatherbylocation.dart';

class Searchpage extends StatefulWidget {
  Searchpage({Key? key}) : super(key: key);
  String? cityname;
  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  @override
  var _citycontroller = TextEditingController();
  String? city;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Today'),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Startpage()));
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              height: 300,
              width: double.infinity,
              child: FlareActor(
                'assets/WorldSpin.flr',
                animation: 'roll',
              ),
            ),
            Text(
              ' Weather By City',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                onFieldSubmitted: (data) async {
                  city = data;
                },
                controller: _citycontroller,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      style: BorderStyle.solid,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      style: BorderStyle.solid,
                    ),
                  ),
                  hintText: 'Enter your City',
                ),
              ),
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.black)),
              onPressed: () async {
                city = _citycontroller.text;
                Weather_Services services = Weather_Services();

                Weather_Model? weatherdata =
                    await services.getweather(city: city!);

                Provider.of<Weather_Provider>(context, listen: false)
                    .weatherdata = weatherdata;

                Provider.of<Weather_Provider>(context, listen: false).cityname =
                    city;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>   HomePage()));
              },
              height: 50,
              minWidth: 200,
              child: Text(
                'Search',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
