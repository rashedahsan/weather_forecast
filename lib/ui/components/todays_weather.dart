import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';

import '../../model/weather_model.dart';

class TodaysWeather extends StatelessWidget {
  final Weathermodel weathermodel;
  const TodaysWeather({
    Key,
    key,
    required this.weathermodel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WeatherBg(
            weatherType: WeatherType.cloudy,
            width: double.infinity,
            height: 300),
      ],
    );
  }
}
