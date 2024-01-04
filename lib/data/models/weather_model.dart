import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/utility/utility.dart';
part 'weather_model.g.dart';

@HiveType(typeId: 1)
class WeatherModel extends HiveObject {
  @HiveField(0)
  final double temp;
  @HiveField(1)
  final double tempMax;
  @HiveField(2)
  final double tempMin;
  @HiveField(3)
  final double lat;
  @HiveField(4)
  final double long;
  @HiveField(5)
  final double feelsLike;
  @HiveField(6)
  final int pressure;
  @HiveField(7)
  final String description;
  @HiveField(8)
  final String currently;
  @HiveField(9)
  final int humidity;
  @HiveField(10)
  final double windSpeed;
  @HiveField(11)
  final String cityName;
  @HiveField(12)
  final DateTime time;

  WeatherModel({
    required this.temp,
    required this.tempMax,
    required this.tempMin,
    required this.lat,
    required this.long,
    required this.feelsLike,
    required this.pressure,
    required this.description,
    required this.currently,
    required this.humidity,
    required this.windSpeed,
    required this.cityName,
    required this.time,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> jsonObject) {
    return WeatherModel(
      temp: (jsonObject['main']['temp']).toDouble(),
      tempMax: (jsonObject['main']['temp_max']).toDouble(),
      tempMin: (jsonObject['main']['temp_min']).toDouble(),
      lat: jsonObject['coord']['lat'],
      long: jsonObject['coord']['lon'],
      feelsLike: (jsonObject['main']['feels_like']).toDouble(),
      pressure: jsonObject['main']['pressure'],
      description: jsonObject['weather'][0]['description'],
      currently: jsonObject['weather'][0]['main'],
      humidity: jsonObject['main']['humidity'],
      windSpeed: (jsonObject['wind']['speed']).toDouble(),
      cityName: jsonObject['name'],
      time: DateTime.now(),
    );
  }
}
