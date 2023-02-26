import 'package:flutter_test/flutter_test.dart';
import 'package:pawang_hujan/presentation/bloc/weather_bloc_bloc.dart';

void main() {
  group('OnWeatherEvent', () {
    test('props should be empty', () {
      expect(OnWeatherEvent().props, []);
    });
  });
}
