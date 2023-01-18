import 'package:flutter/material.dart';
import 'package:weather_app/models/current_weather_model.dart';
import 'package:weather_app/screens/utils/colors.dart';

class currentweather extends StatelessWidget {

  final Weatherdatacurrent weatherdatacurrent;

  const currentweather({Key? key , required this.weatherdatacurrent}): super(key: key);

  Widget currentweatherdetails(){
     return Column(
       children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
             Container(
               height: 60,
               width: 60,
               padding: EdgeInsets.all(16),
               decoration: BoxDecoration(
                 color: customcolors.cardColor,
                 borderRadius: BorderRadius.circular(15),
               ),
               child: Image.asset('assets/icons/windspeed.png'),
             ),
             Container(
               height: 60,
               width: 60,
               padding: EdgeInsets.all(16),
               decoration: BoxDecoration(
                 color: customcolors.cardColor,
                 borderRadius: BorderRadius.circular(15),
               ),
               child: Image.asset('assets/icons/clouds.png'),
             ),
             Container(
               height: 60,
               width: 60,
               padding: EdgeInsets.all(16),
               decoration: BoxDecoration(
                 color: customcolors.cardColor,
                 borderRadius: BorderRadius.circular(15),
               ),
               child: Image.asset('assets/icons/humidity.png'),
             ),
           ],
         ),
         SizedBox(
           height: 10,
         ),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
             SizedBox(
               height: 20,
               width: 60,
               child: Text(
                 '${weatherdatacurrent.current.windSpeed}km/h',
                 style: TextStyle(
                   fontSize: 12,
                 ),
                 textAlign: TextAlign.center,
               ),
             ),
             SizedBox(
               height: 20,
               width: 60,
               child: Text(
                 '${weatherdatacurrent.current.clouds}%',
                 style: TextStyle(
                   fontSize: 12,
                 ),
                 textAlign: TextAlign.center,
               ),
             ),
             SizedBox(
               height: 20,
               width: 60,
               child: Text(
                 '${weatherdatacurrent.current.humidity}%',
                 style: TextStyle(
                   fontSize: 12,
                 ),
                 textAlign: TextAlign.center,
               ),
             ),
           ],
         ),
       ],
     );
  }

  Widget tempeaturearea(){
    return Row(
      children: [
        Container(width: 20,),
        Image.asset(
          'assets/weather/${weatherdatacurrent.current.weather![0].icon}.png',
          height: 80,
        width: 80,),
        Container(width: 40,),
        Container(height: 50,
          width: 1,
          color:customcolors.dividerLine,),
        Container(width: 40,),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "${weatherdatacurrent.current.temp!.toInt()}°",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 68,
                  color: customcolors.textColorBlack,
                )
              ),
              TextSpan(
                  text: "${weatherdatacurrent.current.weather![0].description}",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Colors.grey,
                  )
              ),
            ]
          ),
        )
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        tempeaturearea(),
        SizedBox(
          height: 20,
        ),
        currentweatherdetails(),
      ],
    );
  }
}
