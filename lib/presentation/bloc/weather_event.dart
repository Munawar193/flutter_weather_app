part of 'weather_bloc.dart';

abstract class WeatherBlocEvent extends Equatable {
  const WeatherBlocEvent();

  @override
  List<Object> get props => [];
}

class OnWeatherEvent extends WeatherBlocEvent {
  final String lang;
  final double lat;
  final double lon;

  const OnWeatherEvent(this.lang, this.lat, this.lon);

  @override
  List<Object> get props => [lang, lat, lon];
}
