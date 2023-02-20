import 'package:flutter_test/flutter_test.dart';
import 'package:pawang_hujan/data/models/clouds.dart';
import 'package:pawang_hujan/data/models/coord.dart';
import 'package:pawang_hujan/data/models/main.dart';
import 'package:pawang_hujan/data/models/sys.dart';
import 'package:pawang_hujan/data/models/weather.dart';
import 'package:pawang_hujan/data/models/weathers.dart';
import 'package:pawang_hujan/data/models/wind.dart';
import 'package:pawang_hujan/domain/entity/weathers_entity.dart';

void main() {
  group("Weather from JSON", () {
    final json = {
      'coord': {
        'lon': 139.01,
        'lat': 35.02,
      },
      'weather': [
        {
          'id': 800,
          'main': 'Clear',
          'description': 'clear sky',
          'icon': '01n',
        },
      ],
      'base': 'stations',
      'main': {
        'temp': 285.514,
        'pressure': 1013,
        'humidity': 100,
        'temp_min': 285.514,
        'temp_max': 285.514,
        'sea_level': 1023,
        'grnd_level': 1013,
      },
      'visibility': 10000,
      'wind': {
        'speed': 5.52,
        'deg': 311,
      },
      'clouds': {
        'all': 0,
      },
      'dt': 1485792967,
      'sys': {
        'type': 3,
        'id': 75127,
        'message': 0.002,
        'country': 'ID',
        'sunrise': 1485726240,
        'sunset': 1485763863,
      },
      'timezone': 32400,
      'id': 1851632,
      'name': 'Shuzenji',
      'cod': 200,
    };

    test(
      'should return a valid model from JSON',
      () {
        final weathers = Weathers.fromJson(json);
        expect(weathers, isA<Weathers>());
        expect(weathers.coord, isA<Coord>());
        expect(weathers.weather, isA<List<Weather>>());
        expect(weathers.weather!.first, isA<Weather>());
        expect(weathers.main, isA<Main>());
        expect(weathers.wind, isA<Wind>());
        expect(weathers.clouds, isA<Clouds>());
        expect(weathers.sys, isA<Sys>());
        expect(weathers.toEntity(), isA<WeathersEntity>());
      },
    );
  });
}
