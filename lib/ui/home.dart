import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/service/api_service.dart';
import 'package:weather_app/ui/components/future_forcast_listitem.dart';
import 'package:weather_app/ui/components/hourly_weather_listitem.dart';
import 'package:weather_app/ui/components/todays_weather.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  ApiService apiService = ApiService();
  final _textfieldcontroller = TextEditingController();
  String searchtext = "auto:ip";
  _showtextinpudialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Search Location"),
            content: TextField(
              controller: _textfieldcontroller,
              decoration:
                  InputDecoration(hintText: "Search by city, zip let lang"),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel")),
              ElevatedButton(
                  onPressed: () {
                    if (_textfieldcontroller.text.isEmpty) {
                      return;
                    }
                    Navigator.pop(context, _textfieldcontroller.text);
                  },
                  child: Text("OK"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Wether app"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                String text = await _showtextinpudialog(context);
                searchtext = text;
                setState(() {
                  searchtext = text;
                });
              },
              icon: Icon(Icons.search)),
          IconButton(
              onPressed: () {
                searchtext = "auto:ip";
                setState(() {});
              },
              icon: Icon(Icons.my_location))
        ],
      ),
      body: SafeArea(
          child: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Weathermodel? weathermodel = snapshot.data;
            return Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: TodaysWeather(
                    weathermodel: weathermodel!,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Weather by Hours",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      Hour? hour =
                          weathermodel?.forecast?.forecastday?[0].hour?[index];
                      return HourlyWeatherListitem(
                        hour: hour,
                      );
                    },
                    itemCount:
                        weathermodel?.forecast?.forecastday?[0].hour?.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Next 7 days Weather",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      Forecastday? forecastday =
                          weathermodel?.forecast?.forecastday?[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FutureForcastListitem(
                          forecastday: forecastday,
                        ),
                      );
                    },
                    itemCount: weathermodel?.forecast?.forecastday?.length,
                  ),
                )
              ],
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
        future: apiService.getWeatherData("$searchtext"),
      )),
    );
  }
}
