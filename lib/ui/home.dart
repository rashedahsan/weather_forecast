import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/service/api_service.dart';
import 'package:weather_app/ui/components/todays_weather.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wether app"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Weathermodel? weathermodel = snapshot.data;
            return TodaysWeather(
              weathermodel: weathermodel!,
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text("error has ocurr"),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        future: apiService.getWeatherData("searchText"),
      )),
    );
  }
}
