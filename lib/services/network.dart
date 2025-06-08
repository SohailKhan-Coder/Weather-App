import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:open_weather_app/models/weather_model.dart';

class NetWork {
  String url;
  NetWork({required this.url});
 Future<WeatherModel> getOpenWeather() async {
   try{
     final response = await http.get(Uri.parse(url));
     final weatherData = jsonDecode(response.body);
     if (response.statusCode == 200) {
       return WeatherModel(
           temperature: weatherData['main']['temp'],
           cityNmae: weatherData['name'],
           condition: weatherData['weather'][0]['id']);

     }else{
       throw Exception("StatusCode is ${response.statusCode}");
     }
   }catch(e){
     throw Exception(e);
   }
  }
}
