import 'package:open_weather_app/models/weather_model.dart';
import 'package:open_weather_app/services/location.dart';
import 'package:open_weather_app/services/network.dart';
const String apikey = '5516b9ec7c52d9e7f879c4d28e5dd869';
const String baseUrl = 'https://api.openweathermap.org/data/2.5/weather?';
class Weather{
  Future<WeatherModel>getWeatherDataByLocation()async{
    LocationHelper locationHelper = LocationHelper();
    await locationHelper.determinePosition();
    NetWork _network = NetWork(url: '${baseUrl}lat=${locationHelper.latitude}&lon=${locationHelper.longitude}&appid=$apikey&units=metric');
    WeatherModel weatherModel = await _network.getOpenWeather();
    return weatherModel;
  }
  Future<WeatherModel> getDataByCity(String cityName)async{
    NetWork _network = NetWork(url: "${baseUrl}q=$cityName&appid=$apikey&units=metric");
    WeatherModel weatherModel = await _network.getOpenWeather();
    return weatherModel;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
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