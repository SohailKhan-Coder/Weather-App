import 'package:flutter/cupertino.dart';
import 'package:open_weather_app/core/utils/routes/name_route.dart';
import 'package:open_weather_app/views/city_view.dart';
import 'package:open_weather_app/views/splash_view.dart';
import 'package:open_weather_app/views/weather_view.dart';

class AppRoute{
  static Map<String,Widget Function(BuildContext)> appRoutes(BuildContext context){
    return {
      NameRoutes.splashView : (context) => SplashView(),
      NameRoutes.weatherView : (context) => WeatherView(),
      NameRoutes.cityView : (context) => CityView()

    };
  }
}