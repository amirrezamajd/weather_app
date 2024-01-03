import 'package:dartz/dartz.dart';
import 'package:weather_app/data/models/datasource/weather_datasource.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/di/di.dart';
import 'package:weather_app/utility/api_exception.dart';

abstract class IWeatherRepository {
  Future<Either<String, List<WeatherModel>>> getWeather(String location);
}

class WeatherRepository extends IWeatherRepository {
  final WeatherDataSource _dataSource = locator.get();
  @override
  Future<Either<String, List<WeatherModel>>> getWeather(String location) async {
    try {
      final response = await _dataSource.getWeather(location);
      return Right(response);
    } on ApiException catch (ex) {
      return Left(ex.message);
    }
  }
}
