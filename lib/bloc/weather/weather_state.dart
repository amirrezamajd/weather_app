import 'package:dartz/dartz.dart';
import 'package:weather_app/data/models/weather_model.dart';

abstract class WeatherState {}

class WeatherInitState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherResponseState extends WeatherState {
  Either<String, List<WeatherModel>> response;
  WeatherResponseState(this.response);
}
