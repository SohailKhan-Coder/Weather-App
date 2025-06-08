import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_weather_app/core/utils/routes/name_route.dart';
import 'package:open_weather_app/models/weather_model.dart';
import 'package:open_weather_app/services/weather.dart';
import 'package:open_weather_app/views/weather_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashDelay();
  }
  splashDelay()async{
    Weather weather = Weather();
    WeatherModel weatherModel = await weather.getWeatherDataByLocation();
    Navigator.of(context).pushReplacementNamed(NameRoutes.weatherView,arguments: LocationWeatherArguments(weatherModel: weatherModel));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/sp1.jpg'),fit: BoxFit.cover)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text("    WELCOME \n             TO  \n WEATHER APP",style: GoogleFonts.abhayaLibre(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
              SizedBox(height: 100,),
              SpinKitSpinningLines(color: Colors.white,)
          ],
        ),
      ),
    );
  }
}
