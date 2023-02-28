import 'package:flutter_test/flutter_test.dart';
import 'package:pawang_hujan/data/models/clouds.dart';
import 'package:pawang_hujan/data/models/coord.dart';
import 'package:pawang_hujan/data/models/main.dart';
import 'package:pawang_hujan/data/models/sys.dart';
import 'package:pawang_hujan/data/models/weather.dart';
import 'package:pawang_hujan/data/models/weathers.dart';
import 'package:pawang_hujan/data/models/wind.dart';

void main() {
  group('Weathers toEntity', () {
    const coord = Coord(lat: 1.0, lon: 2.0);
    final weather = [
      const Weather(
        id: 1,
        main: 'Sunny',
        description: 'Clear Sky',
        icon: '01d',
      )
    ];
    const base = 'stations';
    const main = Main(
      temp: 25.0,
      feelsLike: 26.0,
      tempMin: 24.0,
      tempMax: 26.0,
      pressure: 1015,
      humidity: 50,
      seaLevel: 1009,
      grndLevel: 1009,
    );
    const visibility = 10000;
    const wind = Wind(
      speed: 4.12,
      deg: 350,
      gust: 6.23,
    );
    const clouds = Clouds(all: 0);
    const dt = 1645311600;
    const sys = Sys(
      country: 'ID',
      sunrise: 1645291943,
      sunset: 1645335253,
    );
    const timezone = 25200;
    const id = 1642846;
    const name = 'Aceh';
    const cod = 200;

    final weathers = Weathers(
      coord: coord,
      weather: weather,
      base: base,
      main: main,
      visibility: visibility,
      wind: wind,
      clouds: clouds,
      dt: dt,
      sys: sys,
      timezone: timezone,
      id: id,
      name: name,
      cod: cod,
    );

    final entity = weathers.toEntity();

    test('returns a WeathersEntity with the correct values', () {
      expect(entity.coord?.lat, equals(1.0));
      expect(entity.coord?.lon, equals(2.0));
      expect(entity.weather?[0].id, equals(1));
      expect(entity.weather?[0].main, equals('Sunny'));
      expect(entity.weather?[0].description, equals('Clear Sky'));
      expect(entity.weather?[0].icon, equals('01d'));
      expect(entity.base, equals('stations'));
      expect(entity.main?.temp, equals(25.0));
      expect(entity.main?.feelsLike, equals(26.0));
      expect(entity.main?.tempMin, equals(24.0));
      expect(entity.main?.tempMax, equals(26.0));
      expect(entity.main?.pressure, equals(1015));
      expect(entity.main?.humidity, equals(50));
      expect(entity.main?.seaLevel, equals(1009));
      expect(entity.main?.grndLevel, equals(1009));
      expect(entity.visibility, equals(10000));
      expect(entity.wind?.speed, equals(4.12));
      expect(entity.wind?.deg, equals(350));
      expect(entity.wind?.gust, equals(6.23));
      expect(entity.clouds?.all, equals(0));
      expect(entity.dt, equals(1645311600));
      expect(entity.sys?.country, equals('ID'));
      expect(entity.sys?.sunrise, equals(1645291943));
      expect(entity.sys?.sunset, equals(1645335253));
      expect(entity.timezone, equals(25200));
      expect(entity.id, equals(1642846));
      expect(entity.name, equals('Aceh'));
      expect(entity.cod, equals(200));
    });
  });
}
