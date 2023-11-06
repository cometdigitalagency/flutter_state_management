part of 'weather_bloc.dart';

enum WeatherStateStatus { initial, loading, success, failure }

class WeatherState extends Equatable {
  const WeatherState(
      {this.status = WeatherStateStatus.initial,
      this.weather,
      this.errorMessage});
  final WeatherStateStatus status;
  final Weather? weather;
  final String? errorMessage;

  WeatherState copyWith(
      {WeatherStateStatus? status, Weather? weather, String? errorMessage}) {
    return WeatherState(
        status: status ?? this.status,
        weather: weather ?? this.weather,
        errorMessage: errorMessage ?? this.errorMessage);
  }

  @override
  List<Object?> get props => [status, weather, errorMessage];
}
