import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather/services/location.dart';
import 'package:http/http.dart' as http;

const apiKey = '22a69b5bc909a7b7cc5da4fa07e23804';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double latitude;
  late double longitude;

  @override
  void initState() {
    super.initState();
    getLocation();
    print('initState code is triggered');
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    print(latitude);
    print(longitude);

    getData();
  }

  /*https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}*/
  void getData() async {

    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);

      double temperature = decodedData['main']['temp'];
      int condition = decodedData['weather'][0]['id'];
      String cityName = decodedData['name'];

      print(temperature);
      print(condition);
      print(cityName);
    } else {
      print(response.statusCode);
      print('olmadı');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
