import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/daily_weather_model.dart';
import 'package:weather_app/screens/utils/colors.dart';

class Dailyweather extends StatelessWidget {

  final Weatherdatadaily weatherdatadaily;

  Dailyweather({Key? key, required this.weatherdatadaily})
  : super(key:key);

  String getday(final day){
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day*1000);
    final x = DateFormat('EEE').format(time);
    return x;
  }


  Widget  dailylist(){
    return SizedBox(
      height: 300,
      child: ListView.builder(
          itemCount: weatherdatadaily.daily.length
              > 7 ? 7 : weatherdatadaily.daily.length,
        itemBuilder: (context, index){
            return Column(
              children: [
                Container(
                  height: 60,
                  padding: EdgeInsets.only(left: 10,right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 80,
                        child: Text(
                          getday(weatherdatadaily.daily[index].dt),
                        style: TextStyle(
                          color: customcolors.textColorBlack,
                          fontSize: 15
                        ),),
                      ),
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset(
                          "assets/weather/${weatherdatadaily.daily[index].weather![0].icon}.png"
                        ),
                      ),
                      Text(
                        "${weatherdatadaily.daily[index].temp!.max}°/${weatherdatadaily.daily[index].temp!.min}°"
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  color: customcolors.dividerLine,
                ),
              ],
            );
        },
      ),
    );
  }

  @override

  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: customcolors.dividerLine.withAlpha(150),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              "Next Days",
              style: TextStyle(
                color: customcolors.textColorBlack,
                fontSize: 20,
              ),
            ),
          ),
          dailylist(),
        ],
      ),
    );
  }
}
