import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/controllers/global_controller.dart';
import 'package:weather_app/models/hourly_weather_model.dart';
import 'package:weather_app/screens/utils/colors.dart';

class hourlyweather extends StatelessWidget {

  final Weatherdatahourly weatherdatahourly;

  hourlyweather({Key? key , required this.weatherdatahourly}): super(key: key);

  RxInt cardindex = Globalcontroller().getindex();

  Widget hourlylist(){
    return Container(
      height: 160,
      padding: EdgeInsets.only(top: 10,bottom: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: weatherdatahourly.hourly.length>12
              ? 12 :
              weatherdatahourly.hashCode.bitLength,
        itemBuilder: (context, index){
            return Obx((() =>GestureDetector(
              onTap: (){
                cardindex.value = index;
              } ,
              child: Container(
                width: 90,
                margin: EdgeInsets.only(left: 20,right: 5),
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      offset:  Offset(0.5,0),
                      blurRadius:  30,
                      spreadRadius: 1,
                      color: customcolors.dividerLine.withAlpha(150)
                    )
                  ],
                  gradient: cardindex.value == index ?
                      LinearGradient(
                          colors:[
                            customcolors.firstGradientColor,
                            customcolors.secondGradientColor,
                          ]
                      ):null
                ),
                child: hourlydetails(
                  index: index,
                    cardindex: cardindex.toInt(),
                    temp: weatherdatahourly.hourly[index].temp!,
                    time: weatherdatahourly.hourly[index].dt!,
                    weathericon: weatherdatahourly.hourly[index].weather![0].icon!),
              ),
            )
            ));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
          alignment: Alignment.topCenter,
          child: Text('Today',
          style: TextStyle(
            fontSize: 20,
          ),)
        ),
        hourlylist(),
      ],
    );
  }
}

class hourlydetails extends StatelessWidget{

  int temp;
  int time;
  int index;
  int cardindex;
  String weathericon;

  hourlydetails({Key? key,
    required this.index,
    required this.cardindex,
    required this.temp,
  required this.time,
  required this.weathericon}):
      super(key: key);

  String gettime(final time){
    DateTime timee = DateTime.fromMicrosecondsSinceEpoch(time*1000000);
    String x = DateFormat('jm').format(timee);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(gettime(time),
          style: TextStyle(
            color: cardindex == index ?
                Colors.white: customcolors.textColorBlack,
          ),),
        ),
        Container(
          margin:  EdgeInsets.all(5),
          child: Image.asset(
            "assets/weather/$weathericon.png",
            height: 40,
            width: 40,
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Text("$temp°",
          style: TextStyle(
    color: cardindex == index ?
    Colors.white: customcolors.textColorBlack,
    ),),
        ),
      ],
    );
  }
}

