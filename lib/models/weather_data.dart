import 'package:weather_app/models/daily_weather_model.dart';
import 'current_weather_model.dart';
import 'package:weather_app/models/hourly_weather_model.dart';

class Weatherdata{
  final Weatherdatacurrent? current;
  final Weatherdatahourly? hourly;
  final Weatherdatadaily? daily;

  Weatherdata([this.current, this.hourly, this.daily]);

  Weatherdatacurrent getcurrentweather() => current!;
  Weatherdatahourly gethourlyweather() => hourly!;
  Weatherdatadaily getdailyweather() => daily!;
}