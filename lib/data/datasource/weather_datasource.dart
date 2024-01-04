import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/di/di.dart';
import 'package:weather_app/utility/api_exception.dart';

abstract class WeatherDataSource {
  Future<WeatherModel> getWeather(String location);
}

class WeatherRemoteDataSource extends WeatherDataSource {
  final Dio _dio = locator.get();
  @override
  Future<WeatherModel> getWeather(String location) async {
    Uri url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=$location&units=metric&appid=09c26f57c611469d1cfe8a099372ba4c',
    );
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      return WeatherModel.fromJson(extractedData);
    } on HttpException catch (ex) {
      throw ApiException(
        0,
        ex.message,
      );
    }
  }
}
