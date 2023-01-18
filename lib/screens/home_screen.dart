import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:weather_app/controllers/global_controller.dart';
import 'package:weather_app/screens/utils/colors.dart';
import 'package:weather_app/screens/widgets/comfort_slider.dart';
import 'package:weather_app/screens/widgets/current_weather.dart';
import 'package:weather_app/screens/widgets/daily_weather.dart';
import 'package:weather_app/screens/widgets/headerwidget.dart';
import 'package:weather_app/screens/widgets/hourly_weather.dart';

class homescreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return homescreenstate();
  }
}

class homescreenstate extends State {

  final Globalcontroller globalcontroller =
      Get.put(Globalcontroller(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Obx(() =>globalcontroller.checkloading().isTrue?Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GFAvatar(
                  backgroundColor: Colors.lightBlue,
                  backgroundImage: AssetImage("assets/weather/02d.png"),
                  radius: 50,
                ),
                Container(height: 50,),
                CircularProgressIndicator(),
              ],
            ),
          ):ListView(
            scrollDirection: Axis.vertical,
            children: [
              SizedBox(
                height: 10,
              ),
              header(),

              currentweather(
                weatherdatacurrent: globalcontroller.getdata().getcurrentweather(),
              ),
              SizedBox(
                height: 10,
              ),
              hourlyweather(
                weatherdatahourly: globalcontroller.getdata().gethourlyweather(),
              ),
              Dailyweather(
                  weatherdatadaily: globalcontroller.getdata().getdailyweather(),
              ),
              Container(
                height: 1,
                color: customcolors.dividerLine,
              ),
              SizedBox(
                height: 10,
              ),
              comfortlevel(
                weatherdatacurrent: globalcontroller.getdata().getcurrentweather(),
              ),
            ],
          )),
      ),
    );
  }
}
