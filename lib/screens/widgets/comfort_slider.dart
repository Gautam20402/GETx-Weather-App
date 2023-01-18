import 'package:flutter/material.dart';
import 'package:weather_app/screens/utils/colors.dart';
import '../../models/current_weather_model.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class comfortlevel extends StatelessWidget {

  final Weatherdatacurrent weatherdatacurrent;

  const comfortlevel({Key? key , required this.weatherdatacurrent}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 1,left: 20,right: 20,bottom: 20),
          child: Text(
            "Comfort Level",
            style: TextStyle(
              fontSize: 20
            ),
          ),
        ),
        SizedBox(
          height: 180,
          child: Column(
            children: [
              Center(
                child: SleekCircularSlider(
                  min: 0,
                  max: 100,
                  initialValue: weatherdatacurrent.current.humidity!.toDouble(),
                  appearance: CircularSliderAppearance(
                    customWidths: CustomSliderWidths(
                      handlerSize: 5,
                      trackWidth: 15,
                      progressBarWidth: 5,
                    ),
                    infoProperties: InfoProperties(
                      bottomLabelText: "Humidity",
                      bottomLabelStyle: TextStyle(
                        letterSpacing: 0.1,
                        fontSize: 20,
                        height: 1.5,
                      ),
                    ),
                    animationEnabled: true,
                    size: 150,
                    customColors: CustomSliderColors(
                      trackColor: Colors.lightBlue,
                      dotColor: Colors.white,
                      progressBarColors:[
                        Colors.white,
                        Colors.white60,
                      ]
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                      text:TextSpan(
                        children: [
                          TextSpan(
                            text: "Feels Like  ",
                            style: TextStyle(
                              fontSize: 15,
                              height: 0.8,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: "${weatherdatacurrent.current.feelslike}",
                            style: TextStyle(
                              fontSize: 15,
                              height: 0.8,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ]
                      ),),
                  Container(
                    height: 25,
                    margin: EdgeInsets.only(left: 40,right: 40),
                    width: 1,
                    color: customcolors.dividerLine,
                  ),
                  RichText(
                    text:TextSpan(
                        children: [
                          TextSpan(
                            text: "UV Index  ",
                            style: TextStyle(
                              fontSize: 15,
                              height: 0.8,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: "${weatherdatacurrent.current.uvindex}",
                            style: TextStyle(
                              fontSize: 15,
                              height: 0.8,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ]
                    ),),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
