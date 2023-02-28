import 'package:flutter_test/flutter_test.dart';
import 'package:pawang_hujan/data/models/clouds.dart';
import 'package:pawang_hujan/data/models/coord.dart';
import 'package:pawang_hujan/data/models/main.dart';
import 'package:pawang_hujan/data/models/sys.dart';
import 'package:pawang_hujan/data/models/weather.dart';
import 'package:pawang_hujan/data/models/weathers.dart';
import 'package:pawang_hujan/data/models/wind.dart';

void main() {
  group("Weather To JSON", () {
    const weathers = Weathers(
      coord: Coord(lat: 10.0, lon: 20.0),
      weather: [
        Weather(
          id: 800,
          main: 'Clear',
          description: 'clear sky',
          icon: '01d',
        )
      ],
      base: 'stations',
      main: Main(
        temp: 23.0,
        feelsLike: 22.0,
        tempMin: 301.02,
        tempMax: 301.02,
        pressure: 1009,
        humidity: 73,
        seaLevel: 1009,
        grndLevel: 1006,
      ),
      visibility: 10000,
      wind: Wind(
        speed: 5.1,
        deg: 10,
        gust: 6.23,
      ),
      clouds: Clouds(all: 0),
      dt: 1645317185,
      sys: Sys(
        country: 'ID',
        sunrise: 1645312589,
        sunset: 1645354417,
      ),
      timezone: -28800,
      id: 5391959,
      name: 'Aceh',
      cod: 200,
    );

    final json = weathers.toJson();
    test('should return a JSON map containing proper data', () {
      expect(json, {
        'coord': {'lat': 10.0, 'lon': 20.0},
        'weather': [
          {
            'id': 800,
            'main': 'Clear',
            'description': 'clear sky',
            'icon': '01d'
          }
        ],
        'base': 'stations',
        'main': {
          'temp': 23.0,
          'feels_like': 22.0,
          "temp_min": 301.02,
          "temp_max": 301.02,
          'pressure': 1009,
          'humidity': 73,
          "sea_level": 1009,
          "grnd_level": 1006
        },
        'visibility': 10000,
        'wind': {
          'speed': 5.1,
          'deg': 10,
          "gust": 6.23,
        },
        'clouds': {'all': 0},
        'dt': 1645317185,
        'sys': {
          'country': 'ID',
          'sunrise': 1645312589,
          'sunset': 1645354417,
        },
        'timezone': -28800,
        'id': 5391959,
        'name': 'Aceh',
        'cod': 200,
      });
    });
  });
}
