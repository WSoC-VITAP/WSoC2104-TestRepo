import 'location.dart';
import 'networking.dart';

const key = 'f64f8195dd47a7678510ed026f51ad41';

class Weathermodel {
  var life;
  Future<dynamic> getcityData(String citydata) async {
    Network network = Network(
        'http://api.openweathermap.org/data/2.5/weather?q=$citydata&appid=$key&units=metric');
    dynamic weather = await network.getdata();
    life = network.status;
    return weather;
  }

  Future<dynamic> getLocation() async {
    Location location = Location();
    await location.getcurrentlocation();
    Network network = Network(
        'http://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon'
        '=${location.longitude}&appid=$key&units=metric');
    dynamic weather = await network.getdata();
    life = network.status;
    return weather;
  }

  String weatherIcon(int condition) {
    if (condition >= 200 && condition <= 232) return '⚡️  ';
    if (condition >= 300 && condition <= 321) {
      return '🌩';
    } else if (condition >= 500 && condition <= 531) {
      return '🌧️  ';
    } else if (condition >= 600 && condition <= 622) {
      return '❄️  ';
    } else if (condition >= 700 && condition <= 781) {
      return '🌫️';
    } else if (condition == 800) {
      return '️☀️';
    } else if (condition == 801) {
      return '🌤  ';
    } else if (condition == 802 || condition == 803 || condition == 804) {
      return " ☁️  ";
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
