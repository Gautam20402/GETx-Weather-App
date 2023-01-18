class Weatherdatacurrent{
  final Current current;
  Weatherdatacurrent({required this.current});

  factory Weatherdatacurrent.fromJson(Map<String , dynamic>json)=>
      Weatherdatacurrent(current: Current.fromJson(json['current']));
}

class Current {
  int? temp;
  int? humidity;
  int? clouds;
  double? windSpeed;
  double? uvindex;
  double? feelslike;

  List<Weather>? weather;

  Current(
      {
        this.temp,
        this.humidity,
        this.clouds,
        this.windSpeed,
        this.uvindex,
        this.feelslike,
        this.weather});

  factory Current.fromJson(Map<String, dynamic> json)=>Current(
      temp : (json['temp']as num?)?.round(),
      humidity : json['humidity'] as int?,
      feelslike : (json['feels_like'] as num?)?.toDouble(),
      uvindex : (json['uvi'] as num?)?.toDouble(),
      clouds : json['clouds'] as int?,
      windSpeed : (json['wind_speed'] as num?)?.toDouble(),
      weather : (json['weather']as List<dynamic>?)
      ?.map((e) => Weather.fromJson(e as Map<String, dynamic>)).toList(),);



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['temp'] = this.temp;
    data['feels_like'] = this.feelslike;
    data['uvi'] = this.uvindex;
    data['humidity'] = this.humidity;
    data['clouds'] = this.clouds;
    data['wind_speed'] = this.windSpeed;


    if (this.weather != null) {
      data['weather'] = this.weather!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['main'] = this.main;
    data['description'] = this.description;
    data['icon'] = this.icon;
    return data;
  }
}