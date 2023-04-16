import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entity/weathers_entity.dart';
import '../../domain/useCase/get_weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class GetWeatherBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  final GetWeather _getWeather;

  GetWeatherBloc(this._getWeather) : super(WeatherLoading()) {
    on<OnWeatherEvent>((event, emit) async {
      final lang = event.lang;
      final lat = event.lat;
      final lon = event.lon;

      emit(WeatherLoading());
      final result = await _getWeather.execute(lang, lat, lon);
      result.fold(
        (failure) => emit(WeatherError(failure.message)),
        (data) => emit(WeatherHasData(data)),
      );
    });
  }
}
