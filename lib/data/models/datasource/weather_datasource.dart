import 'package:dio/dio.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/di/di.dart';
import 'package:weather_app/utility/api_exception.dart';

abstract class WeatherDataSource {
  Future<List<WeatherModel>> getWeather(String location);
}

class WeatherRemoteDataSource extends WeatherDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<WeatherModel>> getWeather(String location) async {
    try {
      final response = await _dio.get(
          'weather?q=$location&units=metric&appid=09c26f57c611469d1cfe8a099372ba4c');
      return response.data
          .toMap<WeatherModel>(
              (jsonObject) => WeatherModel.fromJson(jsonObject))
          .toList();
    } on DioException catch (ex) {
      throw ApiException(
        ex.response!.statusCode!,
        ex.response!.data['message'],
      );
    } catch (ex) {
      throw ApiException(0, 'خطای نامشخص');
    }
  }
}
