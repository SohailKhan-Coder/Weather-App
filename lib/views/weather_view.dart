import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_weather_app/core/utils/routes/name_route.dart';
import 'package:open_weather_app/models/weather_model.dart';
import 'package:open_weather_app/services/weather.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  int? temperature;
  String? weatherMessage;
  String? weatherIcon;
  String? currentLocation;
  Weather weather = Weather();
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final args =
        ModalRoute.of(context)!.settings.arguments as LocationWeatherArguments;
    updateUI(args.weatherModel);
  }

  void updateUI(WeatherModel weatherModel) {
    setState(() {
      if (weatherModel == null) {
        temperature = 0;
        weatherMessage = '';
        weatherIcon = '';
        currentLocation = '';
        return;
      }
      double temp = weatherModel.temperature;
      temperature = temp.toInt();
      currentLocation = weatherModel.cityNmae;
      int condition = weatherModel.condition;
      weatherMessage = weather.getMessage(temperature!);
      weatherIcon = weather.getWeatherIcon(condition);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/wv.jpg'),fit: BoxFit.cover)
        ),
        child: Column(
        
          children: [
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () async {
                        WeatherModel weatherModel =
                            await weather.getWeatherDataByLocation();
                        updateUI(weatherModel);
                      },
                      icon: Icon(Icons.near_me,size: 50,color: Colors.white,)),
                  IconButton(
                      onPressed: () async {
                        var typedCityName = await Navigator.of(context)
                            .pushNamed(NameRoutes.cityView);
        
                        if (typedCityName != null) {
                          WeatherModel weatherModel =
                              await weather.getDataByCity(typedCityName.toString());
                          updateUI(weatherModel);
                        }
                      },
                      icon: Icon(Icons.location_city,size: 50,color: Colors.white,))
                ],
              ),
            ),
            ///WeatherIcon
            Text(weatherIcon ?? '',style: TextStyle(fontSize: 50),),
            ///Temperature
            Text(temperature != null ? "$temperature°C" : '',style: GoogleFonts.abrilFatface(color: Colors.white,fontSize: 45),),
            SizedBox(height: 25,),
            ///WeatherMessage
            Text(weatherMessage ?? '',style: GoogleFonts.aladin(color: Colors.white,fontSize: 23),),
            Spacer(),
            ///CurrentLocation
            Text(currentLocation ?? '',style: GoogleFonts.aboreto(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
            SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}

class LocationWeatherArguments {
  WeatherModel weatherModel;
  LocationWeatherArguments({required this.weatherModel});
}
