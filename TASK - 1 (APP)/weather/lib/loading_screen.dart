import 'package:flutter_spinkit/flutter_spinkit.dart';
import "package:flutter/material.dart";
import "weather.dart";
import "location_screen.dart";

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Weathermodel wether = Weathermodel();
    dynamic weather = await wether.getLocation();
    dynamic operation = wether.life;
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              Location_screeen(weather_report: weather, loc: operation)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return (const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 40.0,
        ),
      ),
    ));
  }
}
