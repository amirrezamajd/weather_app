import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/data/models/datasource/weather_datasource.dart';
import 'package:weather_app/data/repository/weather_repository.dart';

final locator = GetIt.instance;

Future<void> getItInit() async {
//components
  locator.registerSingleton<Dio>(
      Dio(BaseOptions(baseUrl: 'https://api.openweathermap.org/data/2.5/')));

  //datasource
  locator.registerSingleton<WeatherDataSource>(WeatherRemoteDataSource());

  //repository
  locator.registerSingleton<IWeatherRepository>(WeatherRepository());
}
