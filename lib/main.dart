import 'package:flutter/material.dart';
import 'package:open_weather_app/core/utils/routes/app_route.dart';
import 'package:open_weather_app/core/utils/routes/name_route.dart';
import 'package:open_weather_app/services/location.dart';

void main() {
  runApp(const OpenWeatherApp());
}

class OpenWeatherApp extends StatelessWidget {
  const OpenWeatherApp({super.key});

  @override


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: NameRoutes.splashView,
      routes: AppRoute.appRoutes(context),
    );
  }
}

