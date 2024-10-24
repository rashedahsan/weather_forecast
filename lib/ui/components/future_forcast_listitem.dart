import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/weather_model.dart';

class FutureForcastListitem extends StatelessWidget {
  final Forecastday? forecastday;
  const FutureForcastListitem({Key? key, this.forecastday}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      margin: EdgeInsets.all(4),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white30, borderRadius: BorderRadius.circular(18)),
      child: Row(
        children: [
          Image.network("https:${forecastday?.day?.condition?.icon ?? ""}"),
          Expanded(
            child: Text(
              DateFormat.MMMEd()
                  .format(DateTime.parse(forecastday?.date.toString() ?? "")),
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(
              forecastday?.day?.condition?.text.toString() ?? "",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            child: Text(
              "^${forecastday?.day?.maxtempC?.round()}/${forecastday?.day?.maxtempC?.round()}",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}
