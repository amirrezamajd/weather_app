import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather/weather_event.dart';
import 'package:weather_app/bloc/weather/weather_state.dart';
import 'package:weather_app/data/repository/weather_repository.dart';
import 'package:weather_app/di/di.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitState()) {
    final IWeatherRepository repository = locator.get();
    on<GetWeatherEvent>((event, emit) async {
      emit(WeatherLoadingState());
      final response = await repository.getWeather(event.location);
      emit(WeatherResponseState(response));
    });
  }
}
