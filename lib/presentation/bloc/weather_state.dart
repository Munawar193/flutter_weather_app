part of 'weather_bloc.dart';

abstract class WeatherBlocState extends Equatable {
  const WeatherBlocState();

  @override
  List<Object> get props => [];
}

class WeatherEmpty extends WeatherBlocState {}

class WeatherLoading extends WeatherBlocState {}

class WeatherError extends WeatherBlocState {
  final String message;

  const WeatherError(this.message);

  @override
  List<Object> get props => [message];
}

class WeatherHasData extends WeatherBlocState {
  final WeathersEntity data;

  const WeatherHasData(this.data);

  @override
  List<Object> get props => [data];
}
