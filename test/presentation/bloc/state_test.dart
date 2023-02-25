import 'package:flutter_test/flutter_test.dart';
import 'package:pawang_hujan/domain/entity/weather_entity.dart';
import 'package:pawang_hujan/domain/entity/weathers_entity.dart';
import 'package:pawang_hujan/presentation/bloc/weather_bloc_bloc.dart';

void main() {
  group('WeatherBlocState', () {
    group('WeatherEmpty', () {
      test('props should be empty', () {
        expect(WeatherEmpty().props, []);
      });
    });

    group('WeatherLoading', () {
      test('props should be empty', () {
        expect(WeatherLoading().props, []);
      });
    });

    group('WeatherError', () {
      test('props should contain message', () {
        const message = 'Error message';
        expect(const WeatherError(message).props, [message]);
      });
    });

    group('WeatherHasData', () {
      test('props should contain data', () {
        const data = WeathersEntity(
          weather: [
            WeatherEntity(
              id: 803,
              main: 'Clouds',
              description: 'broken clouds',
              icon: '04d',
            ),
          ],
        );
        expect(const WeatherHasData(data).props, [data]);
      });
    });
  });
}
