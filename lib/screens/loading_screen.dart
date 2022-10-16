
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/screens/location_screen.dart';
import 'package:weather/services/location.dart';
import 'package:weather/services/networking.dart';



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
    getLocationData();
    print('initState code is triggered');
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper=NetworkHelper(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey'),);

    var weatherData=await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen();
    }));

    print(latitude);
    print(longitude);


  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWanderingCubes(
          color: Colors.purple,
          size: 100.0,
        ),
      ),
    );
  }
}
