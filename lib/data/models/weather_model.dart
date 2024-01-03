class WeatherModel {
  final double temp;
  final double tempMax;
  final double tempMin;
  final double lat;
  final double long;
  final double feelsLike;
  final int pressure;
  final String description;
  final String currently;
  final int humidity;
  final double windSpeed;
  final String cityName;

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
    );
  }
}
