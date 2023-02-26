import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pawang_hujan/domain/entity/weathers_entity.dart';
import 'package:pawang_hujan/domain/useCase/get_weather.dart';
import 'package:pawang_hujan/presentation/bloc/weather_bloc_bloc.dart';
import 'package:pawang_hujan/utils/failure.dart';

class MockGetWeather extends Mock implements GetWeather {}

void main() {
  group('GetWeatherBloc', () {
    late GetWeatherBloc bloc;
    late GetWeather mockGetWeather;

    setUp(() {
      mockGetWeather = MockGetWeather();
      bloc = GetWeatherBloc(mockGetWeather);
    });

    test('initial state should be WeatherLoading', () {
      expect(bloc.state, WeatherLoading());
    });

    test('emits WeatherHasData state on success', () async {
      const entity = WeathersEntity();
      when(() => mockGetWeather.execute()).thenAnswer(
        (_) => Future.value(const Right(entity)),
      );

      bloc.add(OnWeatherEvent());

      await expectLater(
        bloc.stream,
        emitsInOrder([WeatherLoading(), const WeatherHasData(entity)]),
      );
    });

    test('emits WeatherError state on failure', () async {
      const failure = ServerFailure('server error');
      when(() => mockGetWeather.execute()).thenAnswer(
        (_) => Future.value(const Left(failure)),
      );

      bloc.add(OnWeatherEvent());

      await expectLater(
        bloc.stream,
        emitsInOrder([WeatherLoading(), WeatherError(failure.message)]),
      );
    });
  });
}
