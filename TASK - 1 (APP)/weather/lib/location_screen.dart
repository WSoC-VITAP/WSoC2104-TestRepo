import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import "weather.dart";
import "city_screen.dart";
import 'package:flutter/services.dart';

const key = 'f64f8195dd47a7678510ed026f51ad41';

class Location_screeen extends StatefulWidget {
  Location_screeen({Key? key, this.weather_report, this.loc}) : super(key: key);
  dynamic weather_report;
  dynamic loc;
  dynamic loc2;
  @override
  _Location_screeenState createState() => _Location_screeenState();
}

class _Location_screeenState extends State<Location_screeen> {
  late var temperature;
  late var condition;
  late var icon;
  late var weathermessage;
  late var temp;
  late var citydata;
  late var city;
  late var counter = 1;
  late var humidity;
  late var pressure;
  late var windspeed;
  late var weather_info;

  Weathermodel wether = Weathermodel();

  @override
  void initState() {
    updateUI(widget.weather_report);
  }

  void updateUI2(dynamic weatherData) {
    setState(() {
      if (widget.loc2 != 200) {
        temperature = 0;
        weathermessage = 'unable to connect network';
        icon = ' ';
        counter = 1;
        condition = 0;
        city = ' ';
        humidity = ' ';
        pressure = ' ';
        windspeed = ' ';
        weather_info = ' ';
        return;
      }
      temp = weatherData["main"]["temp"];
      temperature = temp.toInt();
      weathermessage = wether.getMessage(temperature);
      condition = weatherData['weather'][0]['id'];
      icon = wether.weatherIcon(condition);
      city = weatherData["name"];
      humidity = weatherData["main"]["humidity"];
      pressure = weatherData["main"]["pressure"];
      windspeed = weatherData["wind"]["speed"];
      weather_info = weatherData["weather"][0]["main"];
      if (condition >= 200 && condition <= 232) counter = 2;
      if (condition >= 300 && condition <= 321) {
        counter = 3;
      } else if (condition >= 500 && condition <= 531) {
        counter = 5;
      } else if (condition >= 600 && condition <= 622)
        counter = 6;
      else if (condition >= 700 && condition <= 781)
        counter = 7;
      else if (condition == 800)
        counter = 8;
      else if (condition == 801)
        counter = 10;
      else if (condition == 802 || condition == 803 || condition == 804)
        counter = 9;
      else
        counter = 1;
    });
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (widget.loc != 200) {
        temperature = 0;
        weathermessage = 'unable to connect network';
        icon = ' ';
        counter = 1;
        condition = 0;
        city = ' ';
        humidity = ' ';
        pressure = ' ';
        windspeed = ' ';
        weather_info = ' ';
        return;
      }
      temp = weatherData["main"]["temp"];
      temperature = temp.toInt();
      weathermessage = wether.getMessage(temperature);
      condition = weatherData['weather'][0]['id'];
      icon = wether.weatherIcon(condition);
      city = weatherData["name"];
      humidity = weatherData["main"]["humidity"];
      pressure = weatherData["main"]["pressure"];
      windspeed = weatherData["wind"]["speed"];
      weather_info = weatherData["weather"][0]["main"];
      if (condition >= 200 && condition <= 232) counter = 2;
      if (condition >= 300 && condition <= 321)
        counter = 3;
      else if (condition >= 500 && condition <= 531)
        counter = 5;
      else if (condition >= 600 && condition <= 622)
        counter = 6;
      else if (condition >= 700 && condition <= 781)
        counter = 7;
      else if (condition == 800)
        counter = 8;
      else if (condition == 801)
        counter = 10;
      else if (condition == 802 || condition == 803 || condition == 804)
        counter = 9;
      else
        counter = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('image/weather$counter.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.9), BlendMode.dstATop),
          ),
        ),
        child: SafeArea(
          child: Column(children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      updateUI(widget.weather_report);
                    },
                    child: const Icon(Icons.near_me, size: 50.0, color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () async {
                      citydata = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Cityname(),
                        ),
                      );
                      if (citydata != null) {
                        dynamic weatherdata =
                            await wether.getcityData(citydata);
                        widget.loc2 = wether.life;
                        print(widget.loc2);
                        updateUI2(weatherdata);
                      }
                    },
                    child: Icon(Icons.location_city,
                        color: Colors.white, size: 50.0),
                  ),
                ]),
            Expanded(child: Container(margin: EdgeInsets.only(top: 80.0))),
            Row(children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 10.0),
                child: Text(
                  (temperature != 0)
                      ? ' $temperature°c'.toString()
                      : '$temperature°error '.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Spartan',
                    fontSize: 65.0,
                  ),
                ),
              ),
              Text(icon,
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 60.0,
                  ))
            ]),
            Expanded(child: Container(child: Text(''))),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Text((temperature != 0) ? "Weather Details" : '',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Spartan',
                      fontSize: 30.0,
                      fontWeight: FontWeight.w900)),
            ]),
            SizedBox(
                height: 20.0,
                width: 280,
                child: (temperature != 0)
                    ? Divider(thickness: 5.0, color: Colors.white)
                    : Container(child: Text(''))),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Text((temperature != 0) ? 'Humidity' : '  ',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Spartan',
                      fontWeight: FontWeight.bold)),
              SizedBox(width: 10.0),
              Text((temperature != 0) ? '$humidity' : '',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Spartan',
                      fontWeight: FontWeight.bold)),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Text((temperature != 0) ? 'Pressure' : '  ',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Spartan',
                      fontWeight: FontWeight.bold)),
              SizedBox(width: 10.0),
              Text((temperature != 0) ? '$pressure' : '',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Spartan',
                      fontWeight: FontWeight.bold)),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Text((temperature != 0) ? 'Speed:' : '  ',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Spartan',
                      fontWeight: FontWeight.bold)),
              SizedBox(width: 10.0),
              Text((temperature != 0) ? '$windspeed' : '',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Spartan',
                      fontWeight: FontWeight.bold)),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Text((temperature != 0) ? 'Info :' : '  ',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Spartan',
                      fontWeight: FontWeight.bold)),
              SizedBox(width: 10.0),
              Text((temperature != 0) ? '$weather_info' : '',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Spartan',
                      fontWeight: FontWeight.bold))
            ]),
            Expanded(child: Container(child: Text(''))),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
              child: Container(
                child: Text(
                  (condition != 0)
                      ? '$weathermessage  in $city'
                      : '$weathermessage ',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: 'Spartan',
                    fontSize: 40.0,
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
