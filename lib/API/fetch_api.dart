import 'dart:convert';
import 'package:weather_app/models/current_weather_model.dart';
import 'package:weather_app/models/daily_weather_model.dart';
import 'package:weather_app/models/hourly_weather_model.dart';
import 'package:weather_app/models/weather_data.dart';
import 'package:http/http.dart' as http;

import '../screens/utils/api_url.dart';

class Fetchapi{


  Weatherdata? weatherdata;

  Future<Weatherdata>processdata(lat,lon)async{
    var response = await http.get(Uri.parse(apiurl(lat, lon)));
    var jsonString = jsonDecode(response.body);
    weatherdata = Weatherdata(Weatherdatacurrent.fromJson(jsonString),
        Weatherdatahourly.fromJson(jsonString),
        Weatherdatadaily.fromJson(jsonString));

    return weatherdata!;
  }
}


