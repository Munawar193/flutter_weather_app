import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pawang_hujan/domain/entity/weathers_entity.dart';
import 'package:pawang_hujan/domain/useCase/get_weather.dart';

part 'weather_bloc_event.dart';
part 'weather_bloc_state.dart';

class GetWeatherBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  final GetWeather _getWeather;

  GetWeatherBloc(this._getWeather) : super(WeatherLoading()) {
    on<OnWeatherEvent>((event, emit) async {
      emit(WeatherLoading());
      final result = await _getWeather.execute();
      result.fold(
        (failure) => emit(WeatherError(failure.message)),
        (data) => emit(WeatherHasData(data)),
      );
    });
  }
}
