import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../constants/fake_weather_list.dart';
import '../models/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(const WeatherState()) {
    on<GetWeather>(getWeather);
  }

  void getWeather(
    GetWeather event,
    Emitter<WeatherState> emit,
  ) async {
    try {
      emit(state.copyWith(status: WeatherStateStatus.loading));
      await Future.delayed(const Duration(seconds: 3), () {
        final result = fakeWeatherList.firstWhere((element) =>
            element.cityName.toLowerCase() == event.cityName.toLowerCase());
        emit(state.copyWith(
            status: WeatherStateStatus.success, weather: result));
      });
    } catch (e) {
      emit(state.copyWith(
          status: WeatherStateStatus.failure, errorMessage: 'Not found'));
    }
  }
}
