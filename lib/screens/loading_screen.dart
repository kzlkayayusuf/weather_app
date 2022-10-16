import 'package:flutter/material.dart';
import 'package:weather/services/location.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async{
    Location location=Location();
    await location.getCurrentLocation();
    print(location.longitude);
    print(location.latitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}