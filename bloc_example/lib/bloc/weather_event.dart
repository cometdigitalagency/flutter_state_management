part of 'weather_bloc.dart';

abstract class WeatherEvent {}

class GetWeather extends WeatherEvent {
  GetWeather({required this.cityName});
  final String cityName;
}
