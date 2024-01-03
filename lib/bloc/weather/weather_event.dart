abstract class WeatherEvent {}

class GetWeatherEvent extends WeatherEvent {
  String location;
  GetWeatherEvent({required this.location});
}
